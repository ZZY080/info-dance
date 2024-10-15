import '@component/layout/Content/Content.css';
import AboutUs from '@component/ui/AboutUs/AboutUs';
import Campus from '@component/ui/Campus/Campus';
import Grow from '@component/ui/Grow/Grow';
import JobPosition from '@component/ui/JobPosition/JobPosition';
import PeoplePlan from '@component/ui/PeoplePlan/PeoplePlan';
import Product from '@component/ui/Product/Product';
import Recurit from '@component/ui/Recruit/Recruit';
import TeamLife from '@component/ui/TeamLife/TeamLife';
import { Navigate, Route, Routes } from 'react-router-dom';

const Content = (props: { height: number }) => {
  return (
    <>
      <div style={{ minHeight: props.height }}>
        <Routes>
          <Route path="/" element={<Navigate to={'/about-us'} />} />
          <Route path="about-us" element={<AboutUs />} />
          <Route path="team-life" element={<TeamLife />} />
          <Route path="people-plan" element={<PeoplePlan />} />
          <Route path="job-position" element={<JobPosition />} />
          <Route path="recruit" element={<Recurit />} />
          <Route path="product" element={<Product />} />
          <Route path="grow" element={<Grow />} />
          <Route path="campus" element={<Campus />} />
        </Routes>
      </div>
    </>
  );
};

export default Content;
