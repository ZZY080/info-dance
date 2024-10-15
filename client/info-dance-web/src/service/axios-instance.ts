import axios from 'axios';
import { BASE_URL, TIMEOUT } from '@config/axios.config';
// 1.创建axios实例
const instance = axios.create({
  baseURL: BASE_URL,
  timeout: TIMEOUT,
});

// 2.添加请求拦截器
instance.interceptors.request.use(
  (config) => {
    console.log('请求被拦截');
    return config;
  },
  (error) => {
    console.log(error);
  }
);

// 3.添加响应拦截器
instance.interceptors.response.use(
  (res) => {
    return res.data;
  },
  (error) => {
    return error;
  }
);

// 4.导出axios实例
export default instance;
