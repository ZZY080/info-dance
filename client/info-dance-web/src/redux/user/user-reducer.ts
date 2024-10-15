import { actionType, stateType } from './type';
import { ADDUSER, FINDUSER } from './user-constant';

const initState = { email: '', password: '' };
const userReducer = (state = initState, action: actionType): stateType => {
  const { type, payload } = action;
  switch (type) {
    case FINDUSER:
      return { ...state, ...payload };
    case ADDUSER:
      return { ...state, ...payload };
    default:
      return state;
  }
};

export default userReducer;
