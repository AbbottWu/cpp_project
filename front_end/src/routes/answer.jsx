import React from 'react';
import 'windi.css';
import { useNavigate, useParams } from 'react-router-dom';

export function AnswerHome() {
    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
            <h1 className='text-xl block'>看看有什么能帮上大家的：</h1>
            <QuestionList />
        </div>
    );
}

function QuestionList(props) {
    let questions = [
        { title: '一个C++报错', content: 'C++ 大作业在编译过程中出现了这个报错，貌似和编译器版本有关系，有谁能帮忙看一下嘛？', id: "asd" },
        { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asdf" },
        { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asdc" },
        { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asdd" },
        { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asda" },
    ]
    return (
        <ul className='flex flex-col gap-4 overflow-auto pb-5'>
            {questions.map(QuestionCard)}
        </ul>
    );
}

function QuestionCard(question) {
    let style = 'bg-gray-200/50 flex flex-col gap-2 rounded-lg px-4 mx-5 transition ease-out duration-300 cursor-pointer hover:(shadow-lg shadow-gray-400/60)';
    let navigate = useNavigate();
    return (
        <li key={question.id}>
            <div className={style} onClick={() => {
                api.questions.set(question.id, question);
                navigate('/home/answer_page/' + question.id);
            }}>
                <h2 className='mt-3 text-xl'>{question.title}</h2>
                <hr className='border border-gray-300/60'></hr>
                <p className='mb-4'>{question.content}</p>
            </div>
        </li>
    );
}

export function AnswerPage() {
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
                onClick={()=>{
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

export function AnswerFinished() {
    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
            <h1 className='text-2xl'>回答已提交<br />感谢您对仪科云上辅导室的支持</h1>
        </div>

    );
}