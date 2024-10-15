import {
  Column,
  CreateDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('role_permission')
export class RolePermissionEntity {
  @PrimaryGeneratedColumn('uuid', { name: 'id' })
  id: string;

  @Column({
    name: 'role_id',
    type: 'varchar',
    length: '255',
    nullable: false,
  })
  public roleId: string;

  @Column({
    name: 'permission_id',
    type: 'varchar',
    length: '255',
    nullable: false,
  })
  public permissionId: string;

  @CreateDateColumn({
    name: 'created_at',
    type: 'datetime',
    nullable: false,
  })
  createdAt: Date;

  @UpdateDateColumn({
    name: 'updated_at',
    type: 'datetime',
    nullable: false,
  })
  updatedAt: Date;
}
