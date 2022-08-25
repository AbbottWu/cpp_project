import React from 'react';
import ReactDOM from "react-dom/client";
import { HashRouter, Routes, Route } from "react-router-dom";
import { AppWithSidebar, App, Loading } from './routes/app.jsx'
import { AnswerHome, AnswerPage, AnswerFinished } from './routes/answer.jsx'
import { Welcome } from './routes/account.jsx';


const root = ReactDOM.createRoot(document.getElementById('root'));

root.render(
  <HashRouter>
    <Routes>
      <Route path='/' element={<App />}>
        <Route path='' element={<Welcome />}></Route>
        <Route path='/onlogin' element={<Loading introduction='登录' />}></Route>
      </Route>
      <Route path='/home' element={<AppWithSidebar />}>
        <Route path='/home/answer_home' element={<AnswerHome />}></Route>
        <Route path='/home/answer_page/:questionId' element={<AnswerPage />}></Route>
        <Route path='/home/answer_finished' element={<AnswerFinished />}></Route>
      </Route>
    </Routes>
  </HashRouter>
);
