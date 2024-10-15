import { Controller, Delete, Post } from '@nestjs/common';
import { RoleService } from '../service/role.service';

@Controller('role')
export class RoleController {
  constructor(private readonly roleService: RoleService) {}

  /**
   * 添加一个角色
   */
  @Post()
  async create() {}

  /**
   * 删除一个角色
   */
  @Delete()
  async deleteById() {}

  /**
   * 更新一个角色
   */
  async updateById() {}

  /**
   * 查找单个角色
   */
  async findById() {}

  /**
   * 查找所有角色
   */
  async findAll() {}
}
