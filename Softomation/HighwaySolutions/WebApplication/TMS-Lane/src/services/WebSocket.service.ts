import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class WebSocketService {
  private socket: WebSocket;
  private messageSubject: Subject<string> = new Subject<string>();
  currentIP='';
  constructor() {
   this.GetIpAddress()
  }

  GetIpAddress() {
    this.currentIP='';
    var curretURL = (window.location.href).split(':')
    this.currentIP = curretURL[1].replace("//", "");
    this.connect();
  }

  connect(): void {
    this.socket = new WebSocket('ws://'+this.currentIP+':6789');

    this.socket.onmessage = (event) => {
      this.messageSubject.next(event.data); 
    };

    this.socket.onopen = (event) => {
      console.log('WebSocket connection opened:', event);
    };

    this.socket.onclose = (event) => {
      console.log('WebSocket connection closed:', event);
    };

    this.socket.onerror = (error) => {
      console.error('WebSocket error:', error);
    };
  }

 
  getMessages() {
    return this.messageSubject.asObservable();
  }

  sendMessage(message: string): void {
    if (this.socket.readyState === WebSocket.OPEN) {
      this.socket.send(message);
    } else {
      console.log('WebSocket is not open. Unable to send message.');
    }
  }
}
