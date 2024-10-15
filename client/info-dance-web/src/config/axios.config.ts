const BASE_URL_MAP = {
  development: 'https://httpbin.org',
  test: 'https://production.org',
  production: '',
};

// 得到baseUrlMap字面量类型
const MODE = import.meta.env.MODE as keyof typeof BASE_URL_MAP;

export const BASE_URL: string = BASE_URL_MAP[MODE];

export const TIMEOUT = 5000;
