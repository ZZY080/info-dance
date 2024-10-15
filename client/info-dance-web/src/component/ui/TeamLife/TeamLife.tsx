import { memo, useState } from 'react';
import '@component/ui/TeamLife/TeamLife.css';
import s from '@assets/team-life-01.jpeg';
import visit from '@assets/visit.png';
import adversize from '@assets/advertise.mp4';
import videoPlaying from '@assets/video-playing.png';
const TeamLife = memo(() => {
  const [isShowVideo] = useState(false);
  return (
    <div className="team-life-container">
      <div className="team-life-content">
        {/* 短视频列表 */}
        <div className="video-list">
          {[1, 2, 3, 4, 5, 6, 6, 7, 8, 9, 10].map((item, index) => {
            return (
              <div className="item-container" key={index}>
                <div className="item-content">
                  <img src={s} alt="" className="bgpic" />
                  <div className="visit-num">
                    <div className="visit">
                      <img src={visit} alt="" className="eye-icon" />
                    </div>
                    <div className="num">141</div>
                  </div>
                  <div className="is-play">
                    <img src={videoPlaying} alt="" />
                    <div className="desc">播放中</div>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
        {/* 播放的视频 */}
        <div
          className="video-play-container"
          style={{ display: isShowVideo ? '' : 'none' }}
        >
          <div className="video-play-content">
            <video src={adversize} autoPlay muted></video>
            <div className="ismuted">1</div>
          </div>
        </div>
      </div>
    </div>
  );
});

export default TeamLife;
