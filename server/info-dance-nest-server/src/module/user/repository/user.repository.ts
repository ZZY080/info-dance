import { Repository } from 'typeorm';
import { UserEntity } from '../entity/user.entity';
import { CreateUserDto } from '../dto/user/create-user.dto';
import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class UserRepository {
  constructor(
    @InjectRepository(UserEntity)
    private readonly repository: Repository<UserEntity>,
  ) {}
  // 添加用户
  async createUser(user: CreateUserDto): Promise<UserEntity> {
    const oldUser = await this.repository.findOne({
      where: { email: user.email },
    });
    if (oldUser) {
      throw new HttpException('此用户已存在！', HttpStatus.BAD_REQUEST);
    }
    const newuser = await this.repository.create(user);
    return await this.repository.save(newuser);
  }
  // 自定义的查询方法可以在这里添加
  findByEmail(email: string): Promise<UserEntity | undefined> {
    return this.repository.findOne({ where: { email } });
  }
}
