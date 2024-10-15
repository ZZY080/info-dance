import { ExceptionCode } from '@common/enum/exception.enum';
import {
  CanActivate,
  ExecutionContext,
  ForbiddenException,
  Injectable,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { Observable } from 'rxjs';

@Injectable()
export class RoleGuard implements CanActivate {
  constructor(private reflector: Reflector) {}
  canActivate(
    context: ExecutionContext,
  ): boolean | Promise<boolean> | Observable<boolean> {
    // 查询注解里的角色限制
    const roles = this.reflector.get<string[]>('roles', context.getHandler());

    // 如果没有角色限制,允许访问
    if (roles.length === 0) {
      return true;
    }

    // 获取请求对象
    const request = context.switchToHttp().getRequest();

    // 获取请求的方法
    const method = request.method;

    // 获取AuthGuard上给request添加的user
    const user = request.user;

    const isTrue = roles.some((role) => user.roles?.includes(role));

    if (!isTrue) {
      throw new ForbiddenException(
        ExceptionCode.THIS_USER_NOT_HAVE_PERMISSION + '_' + method,
      );
    }
    return isTrue;
  }
}
