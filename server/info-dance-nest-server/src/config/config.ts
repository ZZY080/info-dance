import { getLocalIPs } from '@util/util';

// 服务器配置项
export const SERVER_HOST = getLocalIPs()[0];
export const SERVER_PORT = 8081;

// mysql配置项
export const DATABASE = `${process.env.DATABASE}`;

// token secret
export const JWT_CONFIG = {
  secret: 'DO NOT USE THIS VALUE. INSTEAD',
  expiresIn: '1d',
};
