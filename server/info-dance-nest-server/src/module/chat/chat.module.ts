import { Module } from '@nestjs/common';
import { ChatGateway } from './gateway/chat.gateway';

@Module({
  imports: [],
  controllers: [],
  providers: [ChatGateway],
  exports: [],
})
export class ChatModule {}
