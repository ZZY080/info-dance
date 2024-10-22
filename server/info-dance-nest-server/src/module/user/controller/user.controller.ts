import {
  Controller,
  Post,
  Body,
  Get,
  UseGuards,
  Delete,
  Put,
  Param,
} from '@nestjs/common';
import { UserService } from '../service/user.service';
import { CreateOneUserDto } from '../dto/create-one-user.dto';
import { UserInterface } from '../interface/user.interface';
import { Roles } from '@common/decorator/role.decorator';
import { JwtAuthGuard } from '@common/guard/jwt-auth.guard';
import { RoleGuard } from '@common/guard/role.guard';
import { CreateOneUserSchema } from '../schema/create-one-user.schema';
import { UserEntity } from '../entity/user.entity';
@UseGuards(JwtAuthGuard)
@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  /**
   * 添加一个用户
   * @param createOneUser
   * @param {string} [createOneUser.name]    - 用户名
   * @param {string} createOneUser.email     - 邮箱
   * @param {string} [createOneUser.phone]   - 手机号
   * @param {string} createOneUser.password  - 密码
   * @param {string} [createOneUser.avatar]  - 用户头像
   * @returns
   */
  @Post()
  async createOneUser(
    @Body()
    data: CreateOneUserSchema,
  ): Promise<CreateOneUserDto> {
    // 调用service中的方法添加一个用户
    return await this.userService.createOneUser(data);
  }

  @Get(':id')
  async findOneUserById(@Param('id') id: string): Promise<UserEntity> {
    return await this.userService.findOneUserById(id);
  }

  @Delete(':id')
  @Roles(['admin'])
  @UseGuards(RoleGuard)
  async deleteOneUserById(@Param('id') id: string): Promise<UserEntity> {
    const user = await this.userService.deleteOneUserById(id);
    return user;
  }

  @Put(':id')
  @Roles(['admin'])
  @UseGuards(RoleGuard)
  async updateOneUserById(@Param('id') id: string): Promise<any> {
    return 'update';
  }
}
