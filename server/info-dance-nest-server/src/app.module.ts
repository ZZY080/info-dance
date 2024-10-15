import { Module } from '@nestjs/common';
import { UserModule } from './module/user/user.module';
import { UploadFileModule } from './module/upload-file/upload-file.module';
import { MysqlModule } from '@database/mysql/mysql.module';
import { RedisModule } from '@database/redis/redis.module';
import { AuthModule } from '@module/auth/auth.module';
import { JwtModule } from '@nestjs/jwt';
import { JWT_CONFIG } from '@config/config';
import { ChatModule } from '@module/chat/chat.module';
import { APP_GUARD } from '@nestjs/core';
import { WsJwtGuard } from '@module/chat/guard/ws-jwt.guard';

@Module({
  imports: [
    //mysql模块
    MysqlModule,
    // redis模块
    RedisModule,
    UploadFileModule,
    AuthModule,
    UserModule,
    // 全局jwt
    JwtModule.register({
      global: true,
      secret: JWT_CONFIG.secret,
      signOptions: { expiresIn: JWT_CONFIG.expiresIn },
    }),
    ChatModule,
  ],
  controllers: [],
  providers: [
    {
      provide: APP_GUARD,
      useClass: WsJwtGuard,
    },
  ],
})
export class AppModule {}
