import '@component/ui/AboutUs/AboutUs.css';
import volumnClose from '@assets/volume-close.png';
import volumnUp from '@assets/volumn-up.png';
import advertise from '@assets/advertise.mp4';
import { memo, useRef, useState } from 'react';

const AboutUs = memo(() => {
  console.log(2);
  // 岗位介绍
  const [jobList] = useState([
    { id: 1, pic: '/src/assets/research.png', name: '研发' },
    { id: 2, pic: '/src/assets/product.png', name: '产品' },
    { id: 3, pic: '/src/assets/operation.png', name: '运营' },
    { id: 4, pic: '/src/assets/design.png', name: '设计' },
    { id: 5, pic: '/src/assets/market.png', name: '市场' },
    { id: 6, pic: '/src/assets/sale.png', name: '销售' },
    { id: 7, pic: '/src/assets/support.png', name: '职能支持' },
  ]);
  // 是否静音
  const [isMuted, setIsMuted] = useState<boolean>(true);
  // 获取video的dom
  const videoRef = useRef<HTMLVideoElement>(null);

  const handleIsMuted = () => {
    setIsMuted(!isMuted);
  };

  return (
    <>
      <div className="about-us-container">
        <div className="about-us-content">
          {/* 企业文化  */}
          <div className="culture">
            <div className="video-container">
              <video
                src={advertise}
                ref={videoRef}
                autoPlay={true}
                muted={isMuted}
                loop={true}
                playsInline
              ></video>
              {/* 控制是否静音的图标 */}
              <div className="volume" onClick={() => handleIsMuted()}>
                <img src={isMuted ? volumnClose : volumnUp} alt="" />
              </div>
            </div>
            <div className="desc">
              激发创造，丰富生活
              <br />
              我们因创新而驱动，希望吸引具有创造力的人加入我们，一起激发更多人的创造力。
            </div>
          </div>
          {/* 职位介绍 */}
          <div className="job-intro">
            <div className="title">探索你感兴趣的职位</div>
            <div className="list">
              {jobList.map((item) => {
                return (
                  <div className="item-container" key={item.id}>
                    <div className="item-content">
                      <div className="avatar">
                        <img src={item.pic} alt={item.name} title={item.name} />
                      </div>
                      <div className="desc">{item.name}</div>
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
          {/* 员工故事 */}
          <div className="staff-story">
            <div className="title">员工故事</div>
          </div>
        </div>
      </div>
    </>
  );
});

export default AboutUs;
