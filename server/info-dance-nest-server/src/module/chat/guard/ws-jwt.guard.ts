import { JwtService } from '@nestjs/jwt';
import {
  CanActivate,
  ExecutionContext,
  Injectable,
  Logger,
  UnauthorizedException,
} from '@nestjs/common';

import { Observable } from 'rxjs';
import { Socket } from 'socket.io';
import { JWT_CONFIG } from '@config/config';
import { ExceptionCode } from '@common/enum/exception.enum';

@Injectable()
export class WsJwtGuard implements CanActivate {
  constructor(private readonly jwtService: JwtService) {}
  canActivate(
    context: ExecutionContext,
  ): boolean | Promise<boolean> | Observable<boolean> {
    if (context.getType() !== 'ws') {
      return true;
    }
    console.log(context.getType());
    const client: Socket = context.switchToWs().getClient();
    try {
      WsJwtGuard.validateToken(client);
    } catch (error) {
      throw new UnauthorizedException(ExceptionCode.TOKEN_EXPIRED);
    }
    return true;
  }
  static validateToken(client: Socket) {
    let jwtService = new JwtService();
    const { authorization } = client.handshake.auth;
    Logger.log({ authorization });
    const token = authorization.split(' ')[1];
    const payload = jwtService.verify(token, {
      secret: JWT_CONFIG.secret,
    });
    console.log(payload);
    return payload;
  }
}
