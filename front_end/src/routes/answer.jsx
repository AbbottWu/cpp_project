import React from 'react';
import 'windi.css';
import { useNavigate, useParams } from 'react-router-dom';
import { HomePage } from './components.jsx';

export function AnswerHome(porps) {
    return (
        <HomePage title='看看有什么能帮上大家的吧：' />
    );
}

export function AnswerPage(props) {
    let params = useParams();
    let navigate = useNavigate();
    if (api.questions.get(params.questionId)) {
        let question = api.questions.get(params.questionId);
        return (
            <div className='flex flex-col p-7 w-4/5 h-full gap-3 animated animate-fade-in'>
                <h1 className='text-xl'>{question.title}</h1>
                <hr></hr>
                <p className='w-full h-4/5 overflow-auto'>{question.content}</p>
                <textarea className='h-2/5 border rounded-md resize-none p-3'></textarea>
                <button className='border rounded-md py-2 hover:(shadow-sm shadow-green-300)'
                    onClick={() => {
                        navigate('/home/answer_finished')
                    }}>提交</button>
            </div>
        )
    }
    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
            <h1>页面找不到了......</h1>
        </div>
    );
}

export function AnswerFinished(props) {
    let navigate = useNavigate();
    window.setTimeout(() => navigate('/home/answer_home'), 2000);

    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
            <h1 className='text-2xl'>回答已提交</h1>
            <hr></hr>
            <h1 className='text-xl'>感谢您对仪科云上辅导室的支持，稍后会跳转回问题列表页面</h1>
        </div>
    );
}   