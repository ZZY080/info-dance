import { ADDUSER, FINDUSER } from '@redux/user/user-constant';
import { payloadType, actionType } from '@redux/user/type';

export const addUserAction = (data: payloadType): actionType => {
  return {
    type: ADDUSER,
    payload: {
      ...data,
    },
  };
};

export const findUserAction = (data: payloadType): actionType => {
  return {
    type: FINDUSER,
    payload: {
      ...data,
    },
  };
};
