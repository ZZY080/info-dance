// import { Injectable, NotFoundException } from '@nestjs/common';
import { Injectable } from '@nestjs/common';
import { CreateUserDto } from '../dto/user/create-user.dto';
// import { UpdateUserDto } from '../dto/update-user.dto';
import { UserMapper } from '../mapper/user.mapper';
import { UserInterface } from '../interface/user.interface';
import { UserRepository } from '../repository/user.repository';
// import { UserEntity } from '../entity/user.entity';

@Injectable()
export class UserService {
  constructor(private readonly userRepository: UserRepository) {}

  async createUser(createUserDto: CreateUserDto): Promise<UserInterface> {
    // 1. mapper 将前端传来的数据转换为UserEntity
    const user = UserMapper.fromCreateDtoToEntity(createUserDto);
    const savedUser = await this.userRepository.createUser(user);
    return UserMapper.fromEntityToInterface(savedUser);
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
