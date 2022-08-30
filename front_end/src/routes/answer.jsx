import React, { useState } from 'react';
import 'windi.css';
import { useNavigate, useParams } from 'react-router-dom';
import { HomePage } from './components.jsx';

export function AnswerHome(porps) {
    let navigate = useNavigate();
    return (
        <HomePage title='看看有什么能帮上大家的吧：' navigater={navigate} answered={false} />
    );
}

export function AnswerPage(props) {
    let params = useParams();
    let navigate = useNavigate();
    const [answer, useAnswer] = useState('');
    if (api.questions.get(params.questionId)) {
        let question = api.questions.get(params.questionId);
        return (
            <div className='flex flex-col p-7 w-4/5 h-full gap-3 animated animate-fade-in'>
                <h1 className='text-xl'>{question.title}</h1>
                <hr></hr>
                <p className='w-full h-4/5 overflow-auto'>{question.content}</p>
                <textarea className='h-2/5 border rounded-md resize-none p-3'
                    onChange={(e) => {
                        useAnswer(e.target.value);
                    }}
                ></textarea>
                <button className='border rounded-md py-2 hover:(shadow-sm shadow-green-300)'
                    onClick={() => {
                        let tmp_question = {
                            title: question.title,
                            content: question.content,
                            id: params.questionId,
                            category: 1,
                            answered: true,
                            answer: answer,
                        };
                        grpc.AnswerQuestion({
                            user: api.state.get('now_user'),
                            question: tmp_question,
                        }).then(
                            (result)=>{
                                api.state.get('alert')('回答成功', 'green');
                                navigate('/home/answer_finished')
                            },
                            (error)=>{
                                api.state.get('alert')('服务器异常', 'red');
                            }
                        )
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
    window.setTimeout(() => navigate('/home/answer_home'), 3000);

    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
            <h1 className='text-2xl'>回答已提交</h1>
            <hr></hr>
            <h1 className='text-xl'>感谢您对仪科云上辅导室的支持，稍后会跳转回问题列表页面</h1>
        </div>
    );
}   