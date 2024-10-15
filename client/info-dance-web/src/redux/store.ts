import { createStore } from 'redux';
import reducer from '@redux/root-reducer';

// 持久的store 持久的reducer
import { persistStore, persistReducer } from 'redux-persist';
// 存储机制，可换成其他机制，当前使用sessionStorage机制
import storage from 'redux-persist/lib/storage';
const persistConfig = {
  key: 'root', //必须有
  storage: storage, //缓存机制
  whitelist: ['data'],
};

// 持久的reducer
const persistedReducer = persistReducer(persistConfig, reducer);

const store = createStore(persistedReducer);

// 持久化store
export const persistor = persistStore(store);

export default store;
