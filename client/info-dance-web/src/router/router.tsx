import AboutUs from "@component/ui/AboutUs/AboutUs";
import Campus from "@component/ui/Campus/Campus";
import Grow from "@component/ui/Grow/Grow";
import JobPosition from "@component/ui/JobPosition/JobPosition";
import PeoplePlan from "@component/ui/PeoplePlan/PeoplePlan";
import Product from "@component/ui/Product/Product";
import Recurit from "@component/ui/Recruit/Recruit";
import { createBrowserRouter } from "react-router-dom";

export const router = createBrowserRouter([
  {
    path: "about-us",
    element: <AboutUs />,
  },
  {
    path: "people-plan",
    element: <PeoplePlan />,
  },
  {
    path: "job-position",
    element: <JobPosition />,
  },
  {
    path: "recruit",
    element: <Recurit />,
  },
  {
    path: "product",
    element: <Product />,
  },
  {
    path: "grow",
    element: <Grow />,
  },
  {
    path: "campus",
    element: <Campus />,
  },
]);
