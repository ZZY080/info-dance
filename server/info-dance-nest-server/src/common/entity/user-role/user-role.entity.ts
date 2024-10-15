import {
  Column,
  CreateDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('user_role')
export class UserRoleEntity {
  @PrimaryGeneratedColumn('uuid', { name: 'id' })
  id: string;

  @Column({
    name: 'user_id',
    type: 'varchar',
    length: '255',
    nullable: false,
  })
  public userId: string;

  @Column({
    name: 'role_id',
    type: 'varchar',
    length: '255',
    nullable: false,
  })
  public roleId: string;

  @CreateDateColumn({
    name: 'created_at',
    type: 'datetime',
  })
  createdAt: Date;

  @UpdateDateColumn({
    name: 'updated_at',
    type: 'datetime',
  })
  updatedAt: Date;
}
