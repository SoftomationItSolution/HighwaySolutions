import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class WebSocketService {
  private socket: WebSocket;
  private messageSubject: Subject<string> = new Subject<string>();

  constructor() {
    this.connect();
  }

  connect(): void {
    this.socket = new WebSocket('ws://localhost:6789');

    this.socket.onmessage = (event) => {
      this.messageSubject.next(event.data); // Emit the message to subscribers
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

  // Return an Observable for the component to subscribe to
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
