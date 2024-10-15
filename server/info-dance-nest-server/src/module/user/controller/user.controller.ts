import {
  Controller,
  //   Get,
  Post,
  Body,
  Get,
  UseGuards,
  Delete,
  Put,
  //   ValidationPipe,
  //   Get,
  //   Param,
  //   Param,
  //   Patch,
  //   Delete,
} from '@nestjs/common';
import { UserService } from '../service/user.service';
import { CreateUserDto } from '../dto/user/create-user.dto';
// import { UpdateUserDto } from '../dto/update-user.dto';
import { UserInterface } from '../interface/user.interface';
import { Roles } from '@common/decorator/role.decorator';
import { JwtAuthGuard } from '@common/guard/jwt-auth.guard';
import { RoleGuard } from '@common/guard/role.guard';

// import { FindUserDto } from '../dto/user/find-user.dto';
@UseGuards(JwtAuthGuard)
@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  /**
   * 添加一个用户
   * @param createUserDto
   * @param {string} [CreateUserDto.name]    - 用户名
   * @param {string} CreateUserDto.email     - 邮箱
   * @param {string} [CreateUserDto.phone]   - 手机号
   * @param {string} CreateUserDto.password  - 密码
   * @param {string} [CreateUserDto.avatar]  - 用户头像
   * @returns
   */
  @Post()
  @Roles(['admin'])
  @UseGuards(RoleGuard)
  async create(
    @Body()
    createUserDto: CreateUserDto,
  ): Promise<UserInterface> {
    // 调用service中的方法添加一个用户
    return this.userService.createUser(createUserDto);
  }

  //   @Get(':id')
  //   async findOne(@Param('id') id: number): Promise<UserInterface> {
  //     return this.userService.findUser(FindUserDto);
  //   }

  @Delete()
  @Roles(['admin'])
  @UseGuards(RoleGuard)
  async delete(): Promise<any> {
    return 'delete';
  }

  @Put()
  @Roles(['admin'])
  @UseGuards(RoleGuard)
  async put(): Promise<any> {
    return 'update';
  }

  @Get()
  async find(): Promise<any> {
    return 'find';
  }
}
