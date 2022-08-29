import * as React from 'react';
import { useState,useEffect } from 'react';

export function List_Items(props, style, rounded = 'none') {
  const baseStyle = ' flex items-center ';
  switch (props.items.length) {
    case 0:
      return (<ul className='flex flex-col'></ul>);
    case 1:
      return (<ul className='flex flex-col'>
        <li key={0} className={style + baseStyle + 'rounded-' + rounded}>
          {props.items[0]}
        </li>
      </ul>);

    case 2:
      return (
        <ul className='flex flex-col'>
          <li key={0} className={style + baseStyle + 'rounded-t-' + rounded}>
            {props.items[0]}
          </li>
          <li key={1} className={style + baseStyle + 'rounded-b-' + rounded}>
            {props.items[1]}
          </li>
        </ul>);
    default:
      const first = (
        <li key={0} className={style + baseStyle + 'rounded-t-' + rounded}>
          {props.items[0]}
        </li>
      );
      const others = props.items.slice(1, -1);

      const last = (
        <li key={props.items.length} className={style + baseStyle + 'rounded-b-' + rounded}>
          {props.items[props.items.length - 1]}
        </li>
      );

      const listItems = others.map((item, index) =>
        <li key={index + 1} className={style + baseStyle}>
          {item}
        </li>
      )
      return (
        <ul className='flex flex-col'>{[first, ...listItems, last]}</ul>
      )
  }
}

export function QuestionCard(question,navigate) {
  let style = 'bg-gray-200/50 flex flex-col gap-2 rounded-lg px-4 mx-5 transition ease-out duration-300 cursor-pointer hover:(shadow-lg shadow-gray-400/60)';
  return (
    <li key={question.id}>
      <div className={style} onClick={() => {
        api.questions.set(question.id, question);
        navigate('/home/' + (api.state.get('isAnswerer') ? 'answer_page/' : 'question_page/') + question.id);
      }}>
        <h2 className='mt-3 text-xl'>{question.title}</h2>
        <hr className='border border-gray-300/60'></hr>
        <p className='mb-4'>{question.content}</p>
      </div>
    </li>
  );
}

export function QACard(question,navigate){
  let style = 'bg-gray-200/50 flex flex-col gap-2 rounded-lg px-4 mx-5 transition ease-out duration-300 cursor-pointer hover:(shadow-lg shadow-gray-400/60)';

  let answer_content;
  if (question.answered) {
    answer_content = question.answer;
  }else{
    answer_content= '暂无回答';
  }
  return (
    <li key={question.id}>
      <div className={style} onClick={() => {
        api.questions.set(question.id, question);
        navigate('/home/question_page/' + question.id);
      }}>
        <h2 className='mt-3 text-xl'>{question.title}</h2>
        <hr className='border border-gray-300/60'></hr>
        <p className='mb-4'>{question.content}</p>
        <hr className='border border-gray-300/60'></hr>
        <p className='mb-4'>{answer_content}</p>
      </div>
    </li>
  )
}

function QuestionList(props) {
  const [questions, useQuestions] = useState(new Array());
  useEffect(() => {
      const fn = async () => {
          const temp = await grpc.AllQuestions(props.answered);
          useQuestions(temp.questions);
      };
      fn();
  }, []);
  return (
    <ul className='flex flex-col gap-4 overflow-auto pb-5'>
      {console.log(questions.length)}
      {questions.length!=0 ? questions.map((question)=>QuestionCard(question,props.navigater)):<li key='empty'>暂无数据</li>}
    </ul>
  );
}

export function HomePage(props) {
  return (
    <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
      <h1 className='text-xl block'>{props.title}</h1>
      <QuestionList navigater={props.navigater} answered={props.answered}/>
    </div>
  );
}