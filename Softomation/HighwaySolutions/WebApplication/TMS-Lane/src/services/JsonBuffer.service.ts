import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class JsonBufferService {
  private buffer: string = ''; // Accumulate incoming data

  preprocessJson(inputString: string): any | null {
    this.buffer += inputString;
    let validJson = null;
    try {
      validJson = JSON.parse(this.buffer);
      this.buffer = '';
      return validJson;
    } catch (e) {
      const match = this.buffer.match(/\{.*\}/s); // Match JSON object
      if (match) {
        try {
          validJson = JSON.parse(match[0]);
          this.buffer = this.buffer.slice(this.buffer.indexOf(match[0]) + match[0].length);
          return validJson;
        } catch (innerError) {
          console.error('Error parsing extracted JSON:', innerError);
        }
      }
      this.buffer = '';
    }
    return null;
  }
}
