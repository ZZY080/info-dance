import { Module } from '@nestjs/common';
import { AuthController } from './controller/auth.controller';
import { AuthService } from './service/auth.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserEntity } from '@module/user/entity/user.entity';
import { UserRoleEntity } from '@common/entity/user-role/user-role.entity';
import { RoleEntity } from '@module/role/entity/role.entity';
import { RolePermissionEntity } from '@common/entity/role-permission/role-permission.entity';
import { PermissionEntity } from '@module/permission/entity/permission.entity';
@Module({
  imports: [
    TypeOrmModule.forFeature([
      UserEntity,
      UserRoleEntity,
      RoleEntity,
      RolePermissionEntity,
      PermissionEntity,
    ]),
  ],
  controllers: [AuthController],
  providers: [AuthService],
  exports: [AuthService],
})
export class AuthModule {}
