import { ExceptionCode } from '@common/enum/exception.enum';
import {
  ArgumentMetadata,
  BadRequestException,
  Injectable,
  PipeTransform,
} from '@nestjs/common';
/**
 * 验证请求中的数据是否符合预期格式。
 * 将请求数据转换为其他格式或类型
 */
@Injectable()
export class ValidationPipe implements PipeTransform {
  transform(value: any, metadata: ArgumentMetadata) {
    // 进行数据验证
    if (!value.isValid()) {
      throw new BadRequestException(ExceptionCode.INAVLID_DATA);
    }
    return true;
  }
}
