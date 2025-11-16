import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class WebSocketService {
  private socket: WebSocket;
  private messageSubject: Subject<string> = new Subject<string>();
  currentIP = '127.0.0.1'; // Hardcoded for now
  private reconnectInterval = 500; // Time between reconnection attempts (in ms)

  constructor() {
    this.GetIpAddress();
  }
  
  GetIpAddress() {
    const url = new URL(window.location.href);
    this.currentIP = url.hostname;   // always correct
    this.connect();
  }

  connect(): void {
    const wsAdd = `ws://${this.currentIP}:5001/ws`
    try {
      
      console.log("ws ip:" + this.currentIP);
      console.log("ws add:" + wsAdd);
      this.socket = new WebSocket(wsAdd);
      this.socket.onmessage = (event) => {
        this.messageSubject.next(event.data);
      };

      this.socket.onopen = (event) => {
        //console.log('WebSocket connection opened:', event);
      };

      this.socket.onclose = (event) => {
        this.handleReconnect(); // Attempt to reconnect on close
      };

      this.socket.onerror = (error) => {
        this.socket.close(); // Close the connection to trigger onclose event
      };
    } catch (error) {
      console.log('WebSocket connection error:'+wsAdd, error);
      this.handleReconnect(); // Attempt to reconnect on error
    }
  }

  handleReconnect() {
    setTimeout(() => this.connect(), this.reconnectInterval);
  }

  getMessages() {
    return this.messageSubject.asObservable();
  }

  sendMessage(message: string): void {
    if (this.socket && this.socket.readyState === WebSocket.OPEN) {
      this.socket.send(message);
    } else {
      console.log('WebSocket is not open. Unable to send message.');
    }
  }
}
