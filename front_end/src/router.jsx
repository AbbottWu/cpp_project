import React from 'react';
import ReactDOM from "react-dom/client";
import { HashRouter, Routes, Route } from "react-router-dom";
import { AppWithSidebar, App, Loading } from './routes/app.jsx'
import { AnswerHome, AnswerPage, AnswerFinished } from './routes/answer.jsx'
import { AskFinished, QuestionAsk, QuestionHome, QuestionPage } from './routes/question.jsx';
import { Welcome,Myroom, MyToken, SignUp, SignUpResult } from './routes/account.jsx';


const root = ReactDOM.createRoot(document.getElementById('root'));

root.render(
  <HashRouter>
    <Routes>
      <Route path='/' element={<App />}>
        <Route path='' element={<Welcome />}></Route>
        <Route path='/onlogin' element={<Loading introduction='登录' />}></Route>
        <Route path='/signup' element={<SignUp />}></Route>
        <Route path='/signup_result' element={<SignUpResult />}></Route>

      </Route>
      <Route path='/home' element={<AppWithSidebar />}>
        <Route path='/home/answer_home' element={<AnswerHome />}></Route>
        <Route path='/home/answer_page/:questionId' element={<AnswerPage />}></Route>
        <Route path='/home/answer_finished' element={<AnswerFinished />}></Route>
        <Route path='/home/question_home' element={<QuestionHome />}></Route>
        <Route path='/home/question_page/:questionId' element={<QuestionPage />}></Route>
        <Route path='/home/ask_question' element={<QuestionAsk />}></Route>
        <Route path='/home/ask_finished' element={<AskFinished />}></Route>
        <Route path='/home/myroom' element={<Myroom />}></Route>
        <Route path='/home/my_account' element={<MyToken />}></Route>

      </Route>
    </Routes>
  </HashRouter>
);
