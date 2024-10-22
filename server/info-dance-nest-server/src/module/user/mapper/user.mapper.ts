// import { UpdateUserDto } from '../dto/user/update-user.dto';
import { UserEntity } from '../entity/user.entity';
import { UserInterface } from '../interface/user.interface';
import { CreateOneUserSchema } from '../schema/create-one-user.schema';

export class UserMapper {
  // 将创建用户的DTO转换为用户实体
  static fromCreateDtoToEntity(createUserDto: CreateOneUserSchema): UserEntity {
    const user = new UserEntity();
    user.name = createUserDto.name;
    user.email = createUserDto.email;
    user.phone = createUserDto.phone;
    user.avatar = createUserDto.avatar;
    user.password = createUserDto.password;
    return user;
  }

  // 将创建用户实体转换为用户接口
  static fromEntityToInterface(user: UserEntity): UserInterface {
    return {
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      avatar: user.avatar,
    };
  }

  // 将更新用户的 DTO 转换为用户实体
  //   static fromUpdateDtoToEntity(
  //     updateUserDto: UpdateUserDto,
  //     existingUser: User,
  //   ): User {
  //     existingUser.username = updateUserDto.username || existingUser.username;
  //     existingUser.password = updateUserDto.password || existingUser.password;
  //     return existingUser;
  //   }
}
