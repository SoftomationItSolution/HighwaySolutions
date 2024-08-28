import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class WebSocketService {
  private socket: WebSocket;
  private messageSubject: Subject<string> = new Subject<string>();
  currentIP = '125.17.219.6'; // Hardcoded for now
  private reconnectInterval = 500; // Time between reconnection attempts (in ms)

  constructor() {
    this.GetIpAddress();
  }
  GetIpAddress() {
    this.currentIP='';
    var curretURL = (window.location.href).split(':')
    this.currentIP = '125.17.219.6'//curretURL[1].replace("//", "");
    this.connect();
  }

  // GetIpAddress() {
  //   console.log(`Connecting to WebSocket server at ws://${this.currentIP}:6789`);
  //   this.connect();
  // }

  connect(): void {
    try {
      this.socket = new WebSocket(`ws://${this.currentIP}:6789`);

      this.socket.onmessage = (event) => {
        //console.log('Received message:', event.data);
        this.messageSubject.next(event.data);
      };

      this.socket.onopen = (event) => {
        console.log('WebSocket connection opened:', event);
      };

      this.socket.onclose = (event) => {
        console.log('WebSocket connection closed:', event);
        this.handleReconnect(); // Attempt to reconnect on close
      };

      this.socket.onerror = (error) => {
        console.error('WebSocket error:', error);
        this.socket.close(); // Close the connection to trigger onclose event
      };
    } catch (error) {
      console.error('WebSocket connection error:', error);
      this.handleReconnect(); // Attempt to reconnect on error
    }
  }

  handleReconnect() {
    console.log(`Reconnecting in ${this.reconnectInterval / 1000} seconds...`);
    setTimeout(() => this.connect(), this.reconnectInterval);
  }

  getMessages() {
    return this.messageSubject.asObservable();
  }

  sendMessage(message: string): void {
    if (this.socket && this.socket.readyState === WebSocket.OPEN) {
      this.socket.send(message);
      console.log('Message sent:', message);
    } else {
      console.log('WebSocket is not open. Unable to send message.');
    }
  }
}
