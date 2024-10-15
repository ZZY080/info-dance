import { combineReducers } from 'redux';
import userReducer from '@redux/user/user-reducer';

const reducer = combineReducers({
  data: userReducer,
});

export default reducer;
