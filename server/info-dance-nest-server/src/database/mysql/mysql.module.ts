import { UserEntity } from '@module/user/entity/user.entity'; // 引入你的实体
import { DATABASE } from '@config/config';
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PermissionEntity } from '@module/permission/entity/permission.entity';
import { RoleEntity } from '@module/role/entity/role.entity';
import { UserRoleEntity } from '@common/entity/user-role/user-role.entity';
import { RolePermissionEntity } from '@common/entity/role-permission/role-permission.entity';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      port: 3306,
      username: 'root',
      password: 'ZZY806@!.',
      database: DATABASE,
      entities: [
        UserEntity,
        PermissionEntity,
        RoleEntity,
        UserRoleEntity,
        RolePermissionEntity,
      ],

      synchronize: true, // Use this option carefully in production
    }),
  ],
  providers: [],
  exports: [TypeOrmModule],
})
export class MysqlModule {}
