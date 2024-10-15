import {
  IsEmail,
  isNotEmpty,
  IsNotEmpty,
  IsOptional,
  IsPhoneNumber,
  IsString,
  Length,
} from 'class-validator';

export class CreateUserDto {
  @IsString()
  @IsOptional()
  @Length(6, 50)
  declare readonly name: string;

  @IsEmail()
  @IsNotEmpty()
  declare readonly email: string;

  @IsPhoneNumber()
  @IsOptional()
  @Length(11)
  declare readonly phone: string;

  @IsString()
  @IsNotEmpty()
  @Length(6, 50)
  declare readonly password: string;

  @IsString()
  @IsOptional()
  declare readonly avatar: string;
}
