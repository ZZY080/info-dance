import { RolePermissionEntity } from '@common/entity/role-permission/role-permission.entity';
import { UserRoleEntity } from '@common/entity/user-role/user-role.entity';
import { ExceptionCode } from '@common/enum/exception.enum';
import { PermissionEntity } from '@module/permission/entity/permission.entity';
import { RoleEntity } from '@module/role/entity/role.entity';
import { UserEntity } from '@module/user/entity/user.entity';
import {
  Injectable,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { In, Repository } from 'typeorm';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(UserEntity)
    private readonly userRepository: Repository<UserEntity>,
    @InjectRepository(UserRoleEntity)
    private readonly userRoleRepository: Repository<UserRoleEntity>,
    @InjectRepository(RoleEntity)
    private readonly roleRepository: Repository<RoleEntity>,
    @InjectRepository(RolePermissionEntity)
    private readonly rolePermissionRepository: Repository<RolePermissionEntity>,
    @InjectRepository(PermissionEntity)
    private readonly permissionRepository: Repository<PermissionEntity>,
    private jwtService: JwtService,
  ) {}
  async login(email: string, password: string): Promise<any> {
    // 1. 数据库查询用户
    const user = await this.userRepository.findOne({
      where: {
        email: email,
      },
    });
    // 2. 如果不存在此用户
    if (!user) {
      throw new NotFoundException(ExceptionCode.USER_NOT_FOUND);
    }
    // 3. 判断没密码是否正确
    if (user.password !== password) {
      throw new UnauthorizedException(ExceptionCode.INVALID_PASSWORD);
    }
    // 4. 查询user-role表
    const userRoleList = await this.userRoleRepository.find({
      where: { userId: user.id },
    });
    // 5. 角色id列表
    const roleIdList = userRoleList.map((item) => {
      return item.roleId;
    });
    // 6. 角色列表
    const roleList = await this.roleRepository.find({
      where: {
        id: In(roleIdList),
      },
    });
    // 7. 查询role-permission数据库
    const rolePermissionList = await this.rolePermissionRepository.find({
      where: {
        roleId: In(roleIdList),
      },
    });
    // 8. 获取权限id列表
    const permissionIdList = rolePermissionList.map((item) => {
      return item.permissionId;
    });
    // 9. 获取权限表
    const permissionList = await this.permissionRepository.find({
      where: {
        id: In(permissionIdList),
      },
    });

    // 10. 构建负载
    const payload = {
      ...user,
      password: '',
      roles: roleList.map((item) => item.name),
      permissions: permissionList.map((item) => item.name),
    };
    console.log(payload);
    const token_string = await this.jwtService.sign(payload);
    // 11. 生成token
    return {
      access_token: 'Bearer ' + token_string,
    };
  }

  async add() {}
}
