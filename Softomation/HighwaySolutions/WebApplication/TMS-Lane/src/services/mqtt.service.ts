import { Injectable, NgZone } from '@angular/core';
import { IMqttServiceOptions, MqttService } from 'ngx-mqtt';
import { BehaviorSubject, Subject, Subscription, take, timer } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class MQTTService {
    isMqttConnected$ = new BehaviorSubject<boolean>(false);
    mqttConnectedEvent$ = new Subject<void>();
    private reconnectAttempts = 0;
    private readonly MAX_RETRIES = 5;
    private mqttConnectedSub?: Subscription;

    private messageSubject = new Subject<{ topic: string, message: string }>();
    message$ = this.messageSubject.asObservable();
    hostname = ""
    private brokerURL = '';
    // private options: IClientOptions = {
    //     reconnectPeriod: 3000
    // };

    constructor(private mqtt: MqttService, private zone: NgZone) {

    }

    getMqttOptions(): IMqttServiceOptions {
        return {
            hostname: this.hostname,
            port: 9001,
            path: "/mqtt",
            protocol: 'ws',
        };
    }

    setServer(serverIp, serverPort) {
        this.hostname = serverIp;
        this.connectMqtt()
    }

    private connectMqtt() {
        if (this.isMqttConnected$.value) {
            console.log('⏳ MQTT already connected, skipping new connect.');
            return;
        }

        const options = this.getMqttOptions();
        if (!options.hostname || !options.port) {
            console.warn('Missing MQTT configuration');
            this.isMqttConnected$.next(false);
            return;
        }

        // 🧹 Cleanup old listeners
        this.mqttConnectedSub?.unsubscribe();

        console.log('🔄 Connecting MQTT:', options);
        this.mqtt.connect(options);

        this.mqtt.onConnect.pipe(take(1)).subscribe(() => {
            this.zone.run(() => {
                console.log('✅ MQTT Connected');
                this.isMqttConnected$.next(true);
                this.reconnectAttempts = 0;
                this.mqttConnectedEvent$.next(); // 🔹 notify listeners
            });
        });

        this.mqtt.onClose.pipe(take(1)).subscribe(() => {
            this.zone.run(() => this.handleDisconnect('Socket closed'));
        });

        this.mqtt.onError.pipe(take(1)).subscribe(() => {
            this.zone.run(() => this.handleDisconnect('Connection error'));
        });
    }

    private handleDisconnect(reason: string) {
        console.warn(`⚠️ MQTT disconnected (${reason})`);
        this.isMqttConnected$.next(false);

        this.reconnectAttempts++;
        if (this.reconnectAttempts >= this.MAX_RETRIES) {
            console.error('❌ Max reconnect attempts reached. Stopping retries.');
            return;
        }

        console.log(`⏳ Reconnecting in 5s... (Attempt ${this.reconnectAttempts}/${this.MAX_RETRIES})`);
        timer(5000).subscribe(() => this.connectMqtt());
    }


}
