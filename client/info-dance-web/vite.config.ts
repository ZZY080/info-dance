import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react-swc';
import path from 'path';
// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  // 1. 服务配置
  server: {
    host: '0.0.0.0',
  },
  // 2. 路径映射配置
  resolve: {
    alias: {
      '@config': path.resolve(__dirname, './src/config'),
      '@service': path.resolve(__dirname, './src/service'),
      '@assets': path.resolve(__dirname, './src/assets'),
      '@redux': path.resolve(__dirname, './src/redux'),
      '@page': path.resolve(__dirname, './src/page'),
      '@component': path.resolve(__dirname, './src/component'),
    },
  },
});
