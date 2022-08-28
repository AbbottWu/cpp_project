import * as React from 'react';
import { useNavigate } from 'react-router';

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

export function QuestionCard(question) {
  let style = 'bg-gray-200/50 flex flex-col gap-2 rounded-lg px-4 mx-5 transition ease-out duration-300 cursor-pointer hover:(shadow-lg shadow-gray-400/60)';
  let navigate = useNavigate();
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

export function QACard(question){
  let style = 'bg-gray-200/50 flex flex-col gap-2 rounded-lg px-4 mx-5 transition ease-out duration-300 cursor-pointer hover:(shadow-lg shadow-gray-400/60)';
  let navigate = useNavigate();
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
  let questions = [
    { title: '一个C++报错', content: 'C++ 大作业在编译过程中出现了这个报错，貌似和编译器版本有关系，有谁能帮忙看一下嘛？', id: "asd", answered: true, answer: "测试所用的回答测试所用的回答测试所用的回答测试所用的回答" },
    { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asdf", answered: true, answer: "测试所用的回答测试所用的回答测试所用的回答测试所用的回答" },
    { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asdc", answered: false },
    { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asdd", answered: false },
    { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asda", answered: false },
  ]
  return (
    <ul className='flex flex-col gap-4 overflow-auto pb-5'>
      {(api.state.get('isAnswerer') ? questions.filter(filter_for_not_answered) : questions.filter(filter_for_answered)).map(QuestionCard)}
    </ul>
  );
}

function filter_for_answered(question) {
  if (question.answered) {
    return true;
  } else {
    return false;
  }
}
function filter_for_not_answered(question) {
  return (!filter_for_answered(question))
}


export function HomePage(props) {
  return (
    <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
      <h1 className='text-xl block'>{props.title}</h1>
      <QuestionList />
    </div>
  );
}