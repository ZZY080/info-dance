import { SetMetadata } from '@nestjs/common';

// 自定义Role装饰器，接收一个角色数组
export const Roles = (roles: string[]) => SetMetadata('roles', roles);
