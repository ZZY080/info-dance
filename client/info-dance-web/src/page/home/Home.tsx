import Content from '@component/layout/Content/Content';
import Footer from '@component/layout/Footer/Footer';
import Header from '@component/layout/Header/Header.tsx';
import axios from 'axios';
import { useEffect, useState } from 'react';

const Home = () => {
  const [windowHeight, setWindowHeight] = useState(window.innerHeight);
  const handGetData = async () => {
    const res = await axios.get(
      'https://api.uomg.com/api/rand.music?sort=%E7%83%AD%E6%AD%8C%E6%A6%9C&format=json'
    );
    console.log(res);
  };
  // 监听窗口大小变化，更新 Header 高度
  const handleResize = () => {
    setWindowHeight(window.innerHeight);
  };
  // 发送请求
  useEffect(() => {
    handGetData();
  }, []);
  useEffect(() => {
    window.addEventListener('resize', handleResize);

    // 清理事件监听器
    return () => {
      window.removeEventListener('resize', handleResize);
    };
  }, []);

  return (
    <>
      <div>
        {/* 头部 */}
        <Header />
        {/* 内容 */}
        <Content height={windowHeight - 80 - 225} />
        {/* 底部 */}
        <Footer />
      </div>
    </>
  );
};

export default Home;
