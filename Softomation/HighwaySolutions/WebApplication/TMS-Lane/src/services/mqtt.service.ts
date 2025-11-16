import { Injectable, NgZone } from '@angular/core';
import { IMqttMessage, IMqttServiceOptions, MqttService } from 'ngx-mqtt';
import { BehaviorSubject, Subject, timer, take } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MQTTService {

  private isConnected$ = new BehaviorSubject<boolean>(false);
  private reconnectAttempts = 0;
  private readonly MAX_RETRIES = 10;

  private messageBus$ = new Subject<{ topic: string, message: any }>();

  private hostname = "";
  private port = 9001;

  constructor(private mqtt: MqttService, private zone: NgZone) {}

  // ---------------------------
  //  SET SERVER & CONNECT
  // ---------------------------
  setServer(serverIp: string, serverPort: number = 9001) {
    this.hostname = serverIp;
    this.port = serverPort;
    this.connect();
  }

  private getOptions(): IMqttServiceOptions {
    return {
      hostname: this.hostname,
      port: this.port,
      path: "/mqtt",
      protocol: 'ws',
      connectOnCreate: false
    };
  }

  private connect() {
    if (!this.hostname) {
      console.warn("MQTT: Missing hostname");
      return;
    }

    const options = this.getOptions();
    console.log("🔌 MQTT CONNECT:", options);

    this.mqtt.connect(options);

    this.mqtt.onConnect.pipe(take(1)).subscribe(() => {
      this.zone.run(() => {
        console.log("✅ MQTT CONNECTED");
        this.isConnected$.next(true);
        this.reconnectAttempts = 0;
      });
    });

    this.mqtt.onClose.subscribe(() => this.handleDisconnect("Socket closed"));
    this.mqtt.onError.subscribe(() => this.handleDisconnect("Connection error"));

    // Forward all messages to message bus
    this.mqtt.observe('#').subscribe((msg: IMqttMessage) => {
      this.zone.run(() => {
        const payload = msg.payload.toString();
        let parsed: any;

        try { parsed = JSON.parse(payload); }
        catch { parsed = payload; }

        this.messageBus$.next({ topic: msg.topic, message: parsed });
      });
    });
  }

  private handleDisconnect(reason: string) {
    console.warn("⚠️ MQTT disconnected:", reason);
    this.isConnected$.next(false);

    this.reconnectAttempts++;
    if (this.reconnectAttempts >= this.MAX_RETRIES) {
      console.error("❌ MQTT: Max retries reached.");
      return;
    }

    timer(3000).subscribe(() => this.connect());
  }

  // ---------------------------
  //  TOPIC SUBSCRIPTION
  // ---------------------------
  subscribeToTopic(topic: string): Subject<any> {
    const stream$ = new Subject<any>();

    const sub = this.messageBus$.subscribe(packet => {
      if (packet.topic === topic) {
        stream$.next(packet.message);
      }
    });

    (stream$ as any).subscription = sub;
    return stream$;
  }

  // Allow popup to unsubscribe
  unsubscribe(stream$: Subject<any>) {
    if ((stream$ as any).subscription) {
      (stream$ as any).subscription.unsubscribe();
    }
  }
}
