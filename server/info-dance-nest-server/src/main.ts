import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { AllExceptionsFilter } from './common/filter/all-exceptions.filter';
import * as dotenv from 'dotenv';
// 用于配置静态文件夹访问
import { NestExpressApplication } from '@nestjs/platform-express';
import { join } from 'path';
import { SERVER_HOST, SERVER_PORT } from '@config/config';
import { LoggingInterceptor } from '@common/interceptor/logging.interceptor';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  // 加载环境变量
  dotenv.config();
  // 配置静态文件夹访问目录
  app.useStaticAssets(join(__dirname, '..', '/assets/upload/image'), {
    prefix: '/static/',
  });
  app.useStaticAssets(join(__dirname, '..', '/assets/upload/video'), {
    prefix: '/static/',
  });

  // 全局管道数据验证(schema中的注解需要这个)
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true, // Strip properties that do not have decorators
      forbidNonWhitelisted: true, // Throw an error if non-whitelisted properties are found
      transform: true, // Automatically transform payloads to be instances of classes
    }),
  );
  // 全局过滤器处理异常
  // app.useGlobalFilters(new AllExceptionsFilter());

  // 全局拦截器
  // app.useGlobalInterceptors(new LoggingInterceptor());

  // cors处理跨域
  app.enableCors({
    origin: '*',
    methods: '*',
    allowedHeaders: '*',
    credentials: true,
  });
  const config = new DocumentBuilder()
    .setTitle('info-dance')
    .setDescription('The info-dance api description')
    .setVersion('1.0')
    .addTag('info-dance')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);
  await app.listen(SERVER_PORT, SERVER_HOST);
  console.log(`http://${SERVER_HOST}:${SERVER_PORT}`);
}
bootstrap();
