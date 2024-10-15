import "@component/layout/Footer/Footer.css";
import douyin from "@assets/douyin.png";
import wechat from "@assets/wechat.png";
import redBook from "@assets/red-book.png";
import bilibili from "@assets/bilibili.png";
import police from "@assets/police.png";
import { forwardRef } from "react";
const Footer = forwardRef<HTMLDivElement, {}>((props, ref) => {
  return (
    <>
      <div className="footer-container" ref={ref}>
        <div className="footer-content">
          <div className="info">
            {/* 描述与图标 */}
            <div className="desc-icons">
              <div className="desc">关注我们获取最新动态</div>
              <div className="icons">
                <a href="" className="icon">
                  <img src={douyin} alt="" />
                </a>
                <a href="" className="icon">
                  <img src={wechat} alt="" />
                </a>
                <a href="" className="icon">
                  <img src={redBook} alt="" />
                </a>
                <a href="" className="icon">
                  <img src={bilibili} alt="" />
                </a>
              </div>
            </div>
            {/* 版权与logo */}
            <div className="company-right">
              <div className="company">产销平台</div>
              <div className="right">©2012-2024 产销平台</div>
            </div>
            {/* 备案 */}
            <div className="low">
              <img className="police" src={police} />
              <div className="word">
                服务协议隐私政策浙ICP备2022000356号-3浙公网安备 33011002011859号
              </div>
            </div>
          </div>
          <div className="contact">
            <div className="word">联系我们</div>
            <div className="btn">候选人反馈平台</div>
            <div className="btn">官网使用体验</div>
          </div>
          <div className="website">
            <div className="word">相关网站</div>
            <div className="btn">产销平台</div>
            <div className="btn">社招官网</div>
            <div className="btn">全球招聘</div>
            <div className="btn">豆包大模型</div>
          </div>
        </div>
      </div>
    </>
  );
});

export default Footer;
