import { Module } from '@nestjs/common';
import { UploadFileController } from './controller/upload-file.controller';

@Module({
  imports: [],
  controllers: [UploadFileController],
  providers: [],
})
export class UploadFileModule {}
