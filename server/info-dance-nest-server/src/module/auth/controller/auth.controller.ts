import { Controller, Post, Get, UseGuards, Body, Req } from '@nestjs/common';

import { Roles } from '@common/decorator/role.decorator';
import { JwtAuthGuard } from '@common/guard/jwt-auth.guard';
import { RoleGuard } from '@common/guard/role.guard';
import { LoginSchema, RegisterSchema } from '../schema/auth.schema';
// import { AuthGuard } from '@nestjs/passport';
import { Request } from 'express';
import { AuthService } from '@module/auth/service/auth.service';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('login')
  async login(@Body() body: LoginSchema): Promise<any> {
    const { email, password } = body;
    return await this.authService.login(email, password);
  }

  @Post('register')
  async register(@Body() body: RegisterSchema): Promise<any> {
    return {
      statusCode: 200,
      info: 'register',
    };
  }

  @Get('profile')
  @Roles(['admin'])
  @UseGuards(JwtAuthGuard, RoleGuard)
  getProfile(@Req() req: Request) {
    console.log(req.user);
  }
}
