import { WsJwtGuard } from '@module/chat/guard/ws-jwt.guard';
import { Logger } from '@nestjs/common';

export const WsJwtMiddleware = () => {
  return (client, next) => {
    try {
      WsJwtGuard.validateToken(client);
      next();
    } catch (error) {
      Logger.log({ error });
      next(error);
    }
  };
};
