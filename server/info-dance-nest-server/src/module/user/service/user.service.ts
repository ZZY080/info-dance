import { where } from '@sequelize/core';
import { UserEntity } from './../entity/user.entity';
import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateOneUserDto } from '../dto/create-one-user.dto';
import { UserMapper } from '../mapper/user.mapper';
import { UserInterface } from '../interface/user.interface';
import { CreateOneUserSchema } from '../schema/create-one-user.schema';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ExceptionCode } from '@common/enum/exception.enum';
import { UserRoleEntity } from '@common/entity/user-role/user-role.entity';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(UserEntity)
    private readonly userRepository: Repository<UserEntity>,
    @InjectRepository(UserRoleEntity)
    private readonly userRoleRepository: Repository<UserRoleEntity>,
  ) {}

  async createOneUser(data: CreateOneUserSchema): Promise<UserEntity> {
    // 查询是否有此用户
    let user = await this.userRepository.findOne({
      where: { email: data.email },
    });
    if (user) {
      throw new NotFoundException(ExceptionCode.USER_HAVE_ALREADY_EXIST);
    }
    // 添加一个用户
    user = await this.userRepository.save(data);
    // 为用户添加默认角色
    let userRole = await this.userRoleRepository.save({
      userId: user.id,
      roleId: '1',
    });
    return user;
  }
  async deleteOneUserById(id: string): Promise<UserEntity> {
    // 1.查询用户
    const user = await this.userRepository.findOne({ where: { id: id } });
    // 2. 通过id删除用户
    const deleteUser = await this.userRepository.delete({ id: id });
    if (deleteUser.affected === 0) {
      throw new NotFoundException(ExceptionCode.USER_NOT_FOUND);
    }
    return user;
  }
  // async updateOneUser(): Promise<UserInterface> {}
  async findOneUserById(id: string): Promise<UserEntity> {
    // 1.去数据库查找用户
    const user = await this.userRepository.findOne({ where: { id: id } });
    if (!user) {
      throw new NotFoundException(ExceptionCode.USER_NOT_FOUND);
    }
    return user;
  }

  //   async updateUser(
  //     id: number,
  //     updateUserDto: UpdateUserDto,
  //   ): Promise<UserInterface> {
  //     const user = await this.userRepository.findOne(id);
  //     if (!user) {
  //       throw new NotFoundException(`User with ID ${id} not found`);
  //     }
  //     const updatedUser = UserMapper.fromUpdateDtoToEntity(updateUserDto, user);
  //     const savedUser = await this.userRepository.save(updatedUser);
  //     return UserMapper.fromEntityToInterface(savedUser);
  //   }

  //   async findUserById(id: number): Promise<UserInterface> {
  //     const user = await this.userRepository.findOne(id);
  //     if (!user) {
  //       throw new NotFoundException(`User with ID ${id} not found`);
  //     }
  //     return UserMapper.fromEntityToInterface(user);
  //   }

  //   async findAllUsers(): Promise<UserInterface[]> {
  //     const users = await this.userRepository.find();
  //     return users.map(UserMapper.fromEntityToInterface);
  //   }

  //   async deleteUser(id: number): Promise<void> {
  //     const result = await this.userRepository.delete(id);
  //     if (result.affected === 0) {
  //       throw new NotFoundException(`User with ID ${id} not found`);
  //     }
  //   }
}
