import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
// 用于给容器组件传递store
import { Provider } from "react-redux";
import { PersistGate } from "redux-persist/integration/react";
import store, { persistor } from "@redux/store.ts";
import { BrowserRouter } from "react-router-dom";
import App from "./App.tsx";
import "./index.css";

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    {/* 将store作为prop传入,即可使应用中的所有组件使用store */}
    <Provider store={store}>
      {/* 加入这个让共享数据持久化,如果不加这个刷新页面状态就会丢失 */}
      <PersistGate loading={null} persistor={persistor}>
        <BrowserRouter>
          <App />
        </BrowserRouter>
      </PersistGate>
    </Provider>
  </StrictMode>
);
