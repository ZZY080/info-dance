---
typora-root-url: ./images
---

#### 一.环境搭建

#### 1.全局安装nest脚手架

```bash
npm i -g @nestjs/cli 

node版本 v21.7.3
```

#### 2.创建后端项目

```bash
 nest new server  (选择npm)
```

#### 3.配置mysql数据库安装依赖

```
npm install --save @nestjs/typeorm typeorm mysql2

```

#### 4.文件上传依赖下载

```
npm install @nestjs/platform-express multer  
npm i -D @types/multer
```



#### 5.局域网ip

```
import os from "os" 没起作用需要在tsconfig.json添加    "esModuleInterop": true,
```



#### 6.配置开发生产测试环境

```
1.在根目录建立相应文件
.env.dev
.env.prod
.env.test
2.安装相应的依赖
 npm i dotenv@16.4.5
 npm i dotenv-cli@7.4.2 -d
3.package.json scripts中配置命令
 "start:dev": "dotenv -e .env.dev nest start --watch ",
```

#### 7.redis配置依赖安装

```
npm i ioredis@5.4.1
```

#### 8.jwt配置依赖安装

```
npm install @nestjs/jwt @nestjs/passport passport passport-jwt
npm install --save-dev @types/passport-jwt


1. @nestjs/passport
作用：这是 NestJS 的官方 Passport 集成模块。它将 Passport 的功能引入到 NestJS 中，使得 Passport 可以与 NestJS 的依赖注入系统和模块化结构无缝集成。

功能：提供了 Passport 的策略支持，可以通过 PassportModule 导入到你的 NestJS 模块中。
通过自定义 Guard 和 Strategy，支持各种认证策略（如 JWT、OAuth 等）。
安装：npm install @nestjs/passport

2. passport
作用：Passport 是一个非常流行的 Node.js 中间件，用于处理各种认证策略。它提供了一个简单的、插件式的认证框架，可以使用不同的策略（如本地策略、JWT 策略、OAuth 策略等）。

功能：提供了基础设施来处理用户认证，并可以通过各种策略来验证用户身份。
可以与 Express 和其他 Node.js 框架一起使用。
安装：npm install passport

3. passport-jwt
作用：这是 Passport 的一个策略插件，用于基于 JSON Web Token (JWT) 实现认证。它提供了一种机制来从 HTTP 请求中提取和验证 JWT。

功能：从请求头、Cookie 或其他来源中提取 JWT。
验证 JWT 的有效性和签名。
根据 JWT 的内容进行用户认证。
安装：npm install passport-jwt
```

#### 9.Insomnia  动态获取token到环节变量 

<img src=".\01.png" style="width:100%;" />

<img src=".\02.png" style="width:100%;" />

#### 10.websocket配置

```
1.安装相关依赖
npm i --save @nestjs/websockets @nestjs/platform-socket.io
npm i socket.io
```

