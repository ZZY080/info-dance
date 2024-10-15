import { actionType, payloadType } from '@redux/user/type';
import { addUserAction, findUserAction } from '@redux/user/user-action';
import React from 'react';
import { connect } from 'react-redux';

interface propsType {
  data: {
    email: string;
    password: string;
  };
  login(data: payloadType): actionType;
}

// UI页面
const Login: React.FC<propsType> = (props) => {
  const handleLogin = () => {
    console.log(props);
    console.log(
      props.login({ email: '2916363651@qq.com', password: 'ZZY806@!.' })
    );
  };
  const handleRegister = () => {
    props.login({ email: '2916363652@qq.com', password: 'ZZY806@!.' });
  };
  return (
    <>
      <div onClick={handleLogin}>Login</div>
      <div onClick={handleRegister}>register</div>
      <div>{props.data.email}</div>
      <div>
        <img
          src="https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00681-4265.jpg"
          alt=""
          style={{ objectFit: 'cover', borderRadius: '10px' }}
        />
        <video src="1"></video>
      </div>
    </>
  );
};

// 容器页面
const LoginContainer = connect((state: propsType) => ({ data: state.data }), {
  login: findUserAction,
  register: addUserAction,
})(Login);
export default LoginContainer;
