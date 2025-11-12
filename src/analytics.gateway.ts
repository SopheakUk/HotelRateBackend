import {
  WebSocketGateway,
  WebSocketServer,
} from '@nestjs/websockets';
import { Server } from 'socket.io';

@WebSocketGateway({
  cors: {
    origin: '*', // allow all origins or restrict as needed
  },
})
export class AnalyticsGateway {
  @WebSocketServer()
  server: Server;

  publishUpdate(payload: any) {
    this.server.emit(`hotel-update`, payload);
  }
}