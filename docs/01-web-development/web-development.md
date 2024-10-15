---
typora-root-url: ./images
---

#### 一.环境搭建

```
1.node.js版本
18.17.1

2.初始化项目
npm create vite@latest
-----project name:info-dance-web
-----select a framework:React
----- Select a variant: » TypeScript + SWC

3.安装依赖
npm i

4.启动项目
npm run dev

5.开发环境 测试环境 生产环境搭建
Vite 还支持自定义环境变量，通常使用 .env 文件来定义。Vite 默认支持以下几种 .env 文件：
.env：适用于所有环境。
.env.local：适用于所有环境，且不应提交到版本控制系统（如 Git）。
.env.development：仅适用于开发环境。
.env.production：仅适用于生产环境。
文件里的变量必须以VITE开头如：VITE_APP_TITLE=My Awesome App
配置测试环境  "test": "vite --mode test"  // 添加这个脚本

5.安装axios
npm i axios@1.7.6

6.安装router


```

#### 二.react项目启动测试打包以及eject

```

```

#### 三.建立规范的目录

```
1.使用tree生成目录树
```



#### 四.在vite构建的项目中为目录取别名

##### 1.在tsconfig.app.json中进行相关配置

![](./01.png)

##### 2.在vite.config.ts中进行相关配置

![](./02.png)

#### 五.redux的环境搭建与使用

##### 1.安装redux

```
npm  i redux@4.0.4
```

##### 2.安装redux-persist做状态持久化

```
npm  i redux-persist@6.0.0
```

##### 3.安装react-redux用于将store传递给所有组件

```
npm i  react-redux@7.2.2
npm i --save-dev @types/react-redux@7.1.33
```

