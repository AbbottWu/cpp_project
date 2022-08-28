import React, { useState } from 'react';
import 'windi.css'
import { createSearchParams, useNavigate,useSearchParams } from 'react-router-dom';
import { QACard } from './components.jsx';
import { nanoid } from 'nanoid'


export function Welcome() {
    let navigate = useNavigate();
    let button_style = 'p-4 h-10 rounded-md flex items-center justify-center border ';
    return (
        <div className='h-10/11 flex flex-col pt-5 items-center bg-white gap-12 animated animate-fade-in'>
            <h1 className='text-3xl pt-4'>欢迎来到仪科云上辅导室</h1>
            <div>
                <div className='flex gap-x-4 mb-8 items-center'>
                    <label className='text-lg'>请输入用户名</label>
                    <input className='border rounded-md p-2 border-sky-400'></input>
                </div>
                <div className='flex gap-x-4 items-center'>
                    <label className='text-lg'>请输入token</label>
                    <input className='border rounded-md p-2 border-sky-400'></input>
                </div>
            </div>
            <div className='flex w-full justify-center gap-10'>
                <button className={button_style + 'border-blue-600  hover:(bg-blue-200)'}
                    onClick={() => {
                        api.state.set('isAnswerer', false);
                        api.state.set('isLogin', true)
                        navigate('/home/question_home');
                    }}>我要提问！！</button>
                <button className={button_style + 'border-emerald-600  hover:(bg-emerald-200)'}
                    onClick={() => {
                        api.state.set('isAnswerer', true);
                        api.state.set('isLogin', true)
                        navigate('/onlogin');
                    }}>我能回答！！</button>
            </div>
            <button className={'-mt-8   px-10 py-2 h-10 rounded-md flex items-center justify-center border ' +'border-pink-600  hover:(bg-pink-200)'}
                    onClick={() => {
                        api.state.set('isAnswerer', false);
                        api.state.set('isLogin', true)
                        navigate('/signup');
                    }}>我要注册</button>
        </div>
    );
}

export function Myroom(props) {
    let questions = [
        { title: '一个C++报错', content: 'C++ 大作业在编译过程中出现了这个报错，貌似和编译器版本有关系，有谁能帮忙看一下嘛？', id: "asd", answered: true, answer: "测试所用的回答测试所用的回答测试所用的回答测试所用的回答" },
        { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asdf", answered: true, answer: "测试所用的回答测试所用的回答测试所用的回答测试所用的回答" },
        { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asdc", answered: false },
        { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asdd", answered: false },
        { title: '标题', content: '内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试', id: "asda", answered: false },
    ]
    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
            <h1 className='text-xl block'>与我有关的问题们：</h1>
            <ul className='flex flex-col gap-4 overflow-auto pb-5'>
                {questions.map(QACard)}
            </ul>
        </div>
    );
}

export function MyToken(props) {
    let username = 'awu';
    let token = 'trsindg';
    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
            <h1 className='text-2xl'>我的信息</h1>
            <hr></hr>
            <ul>
                <li className='mb-2'>我的昵称：{username}</li>
                <li>我的Token：{token}</li>
            </ul>
        </div>
    );
}

export function SignUp(props) {
    const [username, useUsername] = useState('');
    let navigate = useNavigate();
    return (
        <div className='h-10/11 flex flex-col pt-5 items-center bg-white gap-12 animated animate-fade-in'>
            <h1 className='text-2xl pt-4'>欢迎你加入仪科云上辅导室</h1>
            <label className='text-xl'>请输入一个合适的昵称吧：</label>
            <input className='border rounded-lg p-3' onChange={(e)=>{
                useUsername(e.target.value);
            }}></input>
            <button className='p-4 h-10 rounded-md flex items-center justify-center border px-20' onClick={()=>{
                let token = nanoid(8);
                let params = [['username',username],['token',token]]
                navigate({pathname:'/signup_result',
                search:`?${createSearchParams(params)}`,
                })
            }}>提交</button>
        </div>
    );
}

export function SignUpResult(params) {
    let navigate = useNavigate();
    const [searchParams,setSearchParams] = useSearchParams();
    let username = searchParams.get('username');
    let token = searchParams.get('token');
    return(
        <div className='h-10/11 flex flex-col pt-5 items-center bg-white gap-5 animated animate-fade-in'>
            <h1 className='text-2xl'>你的信息</h1>
            <hr></hr>
            <ul className='text-xl'>
                <li className='mb-2'>昵称：{username}</li>
                <li>Token：{token}</li>
            </ul>
            <p className='text-md'> 请在可靠的地方记录你的Token<br></br>Token将用于后续登录。如丢失则无法登录。</p>
            <button className='p-4 h-10 rounded-md flex items-center justify-center border px-20' onClick={()=>{
                api.state.set('isLogin',false);
                navigate('/');
            }}>返回登录界面</button>
        </div>
    );
}