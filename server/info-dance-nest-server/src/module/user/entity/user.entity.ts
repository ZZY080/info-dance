import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
  CreateDateColumn,
} from 'typeorm';
@Entity('user')
export class UserEntity {
  @PrimaryGeneratedColumn('uuid', { name: 'id' })
  id: string;

  @Column({
    name: 'name',
    type: 'varchar',
    length: 255,
    nullable: true,
    default: '',
  })
  public name: string;

  @Column({
    name: 'password',
    type: 'varchar',
    length: 255,
    nullable: false,
  })
  public password: string;

  @Column({
    name: 'email',
    type: 'varchar',
    length: 255,
    unique: true,
    nullable: false,
  })
  public email: string;

  @Column({
    name: 'phone',
    type: 'varchar',
    length: 255,
    unique: true,
    nullable: true,
  })
  public phone: string;

  @Column({
    name: 'avatar',
    type: 'varchar',
    length: 255,
    nullable: true,
    default: '',
  })
  public avatar: string;

  @Column({
    name: 'address',
    type: 'varchar',
    length: 255,
    nullable: true,
    default: '',
  })
  public address: string;

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
