import '@component/layout/Header/Header.css';
import { useState } from 'react';
import { Link } from 'react-router-dom';
const Header = () => {
  const [menuData] = useState([
    { id: 1, tag: '关于我们', to: '/about-us' },
    { id: 2, tag: '团队生活', to: '/team-life' },
    { id: 3, tag: '职位', to: '/job-position' },
    { id: 4, tag: '招聘动态', to: '/recruit' },
    { id: 5, tag: '产品服务', to: '/product' },
    { id: 6, tag: '成长体验', to: '/grow' },
    { id: 7, tag: '校园计划', to: '/campus' },
    { id: 8, tag: '人才计划', to: '/people-plan' },
  ]);
  const [tabIndex, setTabIndex] = useState(0);
  const handleMenuTab = (index: number) => {
    setTabIndex(index);
  };
  return (
    <>
      <div className="header-container">
        <div className="header-content">
          <div className="logo-container">
            {/* <div className="desc">恒夏集团</div> */}
          </div>
          <div className="menu-container">
            {menuData.map((item, index) => {
              return (
                <div
                  className={[
                    'menu-item',
                    index === tabIndex ? 'active' : '',
                  ].join(' ')}
                  key={item.id}
                  onClick={() => handleMenuTab(index)}
                >
                  <Link className="word" to={item.to}>
                    {item.tag}
                  </Link>
                </div>
              );
            })}
          </div>
          <div className="btn-container">
            <div className="btn-item social">校园入驻</div>
            <div className="btn-item">登录</div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Header;
