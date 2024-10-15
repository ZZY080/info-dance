import {
  BadRequestException,
  Controller,
  Post,
  UploadedFile,
  UseInterceptors,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { extname } from 'path';

@Controller('upload-file')
export class UploadFileController {
  @Post('image')
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        // ./ 是项目根目录
        destination: './assets/upload/image', // 文件保存路径
        filename: (req, file, cb) => {
          // 自定义文件名字
          const uniqueSuffix =
            Date.now() + '-' + Math.round(Math.random() * 1e9);
          // 获取文件扩展名
          const ext = extname(file.originalname);
          cb(null, `${file.fieldname}-${uniqueSuffix}${ext}`);
        },
      }),
      limits: { fileSize: 1024 * 1024 * 1 }, // 文件限制大小(5MB)
    }),
  )
  uploadImage(@UploadedFile() file: Express.Multer.File) {
    console.log('files:', file);
    if (!file) {
      throw new BadRequestException('File not provided');
    }
    return {
      message: `File upload successfully`,
    };
  }
  @Post('video')
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        // ./ 是项目根目录
        destination: './assets/upload/video', // 文件保存路径
        filename: (req, file, cb) => {
          // 自定义文件名字
          const uniqueSuffix =
            Date.now() + '-' + Math.round(Math.random() * 1e9);
          // 获取文件扩展名
          const ext = extname(file.originalname);
          cb(null, `${file.fieldname}-${uniqueSuffix}${ext}`);
        },
      }),
      limits: { fileSize: 1024 * 1024 * 50 }, // 文件限制大小(5MB)
    }),
  )
  uploadVideo(@UploadedFile() file: Express.Multer.File) {
    console.log('files:', file);
    if (!file) {
      throw new BadRequestException('File not provided');
    }
    return {
      message: `File upload successfully`,
    };
  }
  @Post('audio')
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        // ./ 是项目根目录
        destination: './assets/upload/audio', // 文件保存路径
        filename: (req, file, cb) => {
          // 自定义文件名字
          const uniqueSuffix =
            Date.now() + '-' + Math.round(Math.random() * 1e9);
          // 获取文件扩展名
          const ext = extname(file.originalname);
          cb(null, `${file.fieldname}-${uniqueSuffix}${ext}`);
        },
      }),
      limits: { fileSize: 1024 * 1024 * 50 }, // 文件限制大小(5MB)
    }),
  )
  uploadAudio(@UploadedFile() file: Express.Multer.File) {
    console.log('files:', file);
    if (!file) {
      throw new BadRequestException('File not provided');
    }
    return {
      message: `File upload successfully`,
    };
  }
}
