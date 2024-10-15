import { Logger, UseGuards } from '@nestjs/common';
import {
  ConnectedSocket,
  MessageBody,
  OnGatewayConnection,
  OnGatewayDisconnect,
  SubscribeMessage,
  WebSocketGateway,
  WebSocketServer,
} from '@nestjs/websockets';

import { Server, Socket } from 'socket.io';
import { WsJwtGuard } from '../guard/ws-jwt.guard';
import { WsJwtMiddleware } from '@common/middleware/ws-jwt.middleware';

@WebSocketGateway(8082, {
  namespace: 'message',
  cors: { origin: '*' },
})
@UseGuards(WsJwtGuard)
export class ChatGateway implements OnGatewayConnection, OnGatewayDisconnect {
  constructor() {}

  @WebSocketServer()
  server: Server;

  afterInit(client: Socket) {
    console.log('AfterInit');
    client.use(WsJwtMiddleware());
    Logger.log('afterInit');
  }

  // 处理用户连接
  async handleConnection(@ConnectedSocket() client: Socket): Promise<void> {
    console.log('连接成功:', client.id);
  }

  @SubscribeMessage('message')
  async handleKickUserEvent(
    @ConnectedSocket() client: Socket,
    @MessageBody() payload: any,
  ): Promise<boolean> {
    console.log(payload);
    return true;
  }

  // 处理断开连接
  async handleDisconnect(@ConnectedSocket() client: Socket): Promise<void> {
    console.log(`断开连接：`, client.id);
  }
}
