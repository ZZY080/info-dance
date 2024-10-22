import { ExceptionCode } from '@common/enum/exception.enum';
import { JWT_CONFIG } from '@config/config';
import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Request } from 'express';
import { Observable } from 'rxjs';

@Injectable()
export class JwtAuthGuard implements CanActivate {
  constructor(private jwtService: JwtService) {}
  private extractTokenFromHeader(request: Request): string | undefined {
    const [type, token] = request.headers.authorization?.split(' ') ?? [];
    return type === 'Bearer' ? token : undefined;
  }
  canActivate(
    context: ExecutionContext,
  ): boolean | Promise<boolean> | Observable<boolean> {
    const request = context.switchToHttp().getRequest();
    const token = this.extractTokenFromHeader(request);
    if (!token) {
      throw new UnauthorizedException(ExceptionCode.NOT_CARRY_TOKEN);
    }
    try {
      const payload = this.jwtService.verify(token, {
        secret: JWT_CONFIG.secret,
      });
      request['user'] = payload;
    } catch (err) {
      throw new UnauthorizedException(ExceptionCode.INVALID_TOKEN);
    }
    return true;
  }
}
