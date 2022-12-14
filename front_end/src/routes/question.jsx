import React, { useState } from 'react';
import 'windi.css';
import { useNavigate, useParams } from 'react-router-dom';
import { HomePage } from './components.jsx';
import { nanoid } from 'nanoid';


export function QuestionHome(props) {
    let navigate=useNavigate();
    return (
        <HomePage title='看看大家都提出了哪些问题吧：' navigater={navigate} answered={true}/>
    )
}

export function QuestionPage(props) {
    let params = useParams();
    if (api.questions.get(params.questionId)) {
        let question = api.questions.get(params.questionId);
        return (
            <div className='flex flex-col p-7 w-4/5 h-full gap-3 animated animate-fade-in'>
                <h1 className='text-xl'>{question.title}</h1>
                <hr></hr>
                <p className='w-full h-5/12 overflow-auto'>{question.content}</p>
                <hr></hr>
                <p className='w-full h-7/12 overflow-auto'>{question.answer}</p>
            </div>
        )
    }
    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
            <h1>页面找不到了......</h1>
        </div>
    );
}

export function QuestionAsk(props) {
    let navigate = useNavigate();
    const [form, useForm] = useState({
        title: '',
        content: '',
    });
    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-3 animated animate-fade-in'>
            <input className='text-xl p-2' placeholder='问题简述（标题）'
                onChange={(e) => {
                    useForm({
                        title: e.target.value,
                        content: form.content,
                    })
                }}></input>
            <hr></hr>
            <textarea className='h-full border rounded-md resize-none p-3' placeholder='问题详情'
                onChange={(e) => {
                    useForm({
                        title: form.title,
                        content: e.target.value,
                    })
                }}></textarea>
            <button className='w-1/5 p-2 ring-1 ring-indigo-600 bg-white rounded-lg hover:(shadow-lg shadow-indigo-600/60) self-end transition ease-out'
                onClick={() => {
                    let tmp_question = {
                        title: form.title,
                        content: form.content,
                        id: nanoid(12),
                        category: 1,
                        answered: false,
                        answer: ''
                    }
                    grpc.AskQuestion({
                        user: api.state.get('now_user'),
                        question: tmp_question,
                    }).then(
                        (result) => {
                            api.state.get('alert')('提问成功', 'green');
                            navigate('/home/ask_finished');
                        },
                        (err) => {
                            api.state.get('alert')('服务器异常', 'red');
                        }
                    )
                }}> 提交  </button>
        </div>
    );
}

export function AskFinished(props) {
    let navigate = useNavigate();
    window.setTimeout(() => navigate('/home/question_home'), 3000);

    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
            <h1 className='text-2xl'>提问已收到</h1>
            <hr></hr>
            <h1 className='text-xl'>感谢您对仪科云上辅导室的支持，稍后会跳转回问题列表页面</h1>
        </div>
    );
}
