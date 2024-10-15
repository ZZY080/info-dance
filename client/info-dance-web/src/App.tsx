import { useEffect } from 'react';
import './App.css';
// import 'bootstrap/dist/css/bootstrap.min.css';
import axios from 'axios';
// import Login from '@page/login/Login';
import Home from '@page/home/Home';

function App() {
  const handGetData = async () => {
    const res = await axios.get(
      'https://api.uomg.com/api/rand.music?sort=%E7%83%AD%E6%AD%8C%E6%A6%9C&format=json'
    );
    console.log(res);
  };
  useEffect(() => {
    handGetData();
  }, []);

  return (
    <>
      {/* <Login /> */}
      <Home />
    </>
  );
}

export default App;
