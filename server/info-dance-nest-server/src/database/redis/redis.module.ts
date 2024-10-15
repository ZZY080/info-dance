import { Module, Global } from '@nestjs/common';
import { Redis } from 'ioredis';

@Global()
@Module({
  imports: [],
  providers: [
    {
      provide: 'REDIS_CLIENT',
      useFactory: () => {
        const redis = new Redis({
          host: 'localhost',
          port: 6379,
          password: '',
          db: 0,
        });
        redis.on('connect', () => {
          console.log('redis 连接成功!');
        });
        redis.on('error', (err) => {
          console.log('redis连接失败:', err);
        });
      },
    },
  ],
  exports: ['REDIS_CLIENT'],
})
export class RedisModule {}
