import React, { useEffect, useState } from 'react';
import 'windi.css'
import { createSearchParams, useNavigate, useSearchParams } from 'react-router-dom';
import { QACard } from './components.jsx';
import { nanoid } from 'nanoid'


export function Welcome() {
    let navigate = useNavigate();
    const [form, useForm] = useState({ username: '', token: '' });
    let button_style = 'p-4 h-10 rounded-md flex items-center justify-center border ';
    return (
        <div className='h-10/11 flex flex-col pt-5 items-center bg-white gap-12 animated animate-fade-in'>
            <h1 className='text-3xl pt-4'>欢迎来到仪科云上辅导室</h1>
            <div>
                <div className='flex gap-x-4 mb-8 items-center'>
                    <label className='text-lg'>请输入用户名</label>
                    <input className='border rounded-md p-2 border-sky-400'
                        onChange={(e) => {
                            useForm({
                                username: e.target.value,
                                token: form.token,
                            })
                        }}></input>
                </div>
                <div className='flex gap-x-4 items-center'>
                    <label className='text-lg'>请输入token</label>
                    <input className='border rounded-md p-2 border-sky-400'
                        onChange={(e) => {
                            useForm({
                                username: form.username,
                                token: e.target.value,
                            })
                        }}></input>
                </div>
            </div>
            <div className='flex w-full justify-center gap-10'>
                <button className={button_style + 'border-blue-600  hover:(bg-blue-200)'}
                    onClick={() => {
                        let tmp_user = {
                            name: form.username,
                            token: form.token,
                            is_answerer: false,
                        }
                        grpc.Login(tmp_user).then(
                            (result) => {
                                if (result.success) {
                                    api.state.set('isAnswerer', false);
                                    api.state.set('isLogin', true);
                                    api.state.set('now_user', tmp_user);
                                    navigate('/home/question_home');
                                } else {
                                    api.state.get('alert')('登录失败，请检查信息后重试', 'yellow')
                                }
                            },
                            (err) => {

                            },
                        )
                    }}>我要提问！！</button>
                <button className={button_style + 'border-emerald-600  hover:(bg-emerald-200)'}
                    onClick={() => {
                        let tmp_user = {
                            name: form.username,
                            token: form.token,
                            is_answerer: true,
                        }
                        grpc.Login(tmp_user).then(
                            (result) => {
                                if (result.success) {
                                    api.state.set('isAnswerer', true);
                                    api.state.set('isLogin', true);
                                    api.state.set('now_user', tmp_user);
                                    navigate('/home/answer_home');
                                } else {
                                    api.state.get('alert')('登录失败，请检查信息后重试', 'yellow')
                                }
                            },
                            (err) => {

                            },
                        )
                    }}>我能回答！！</button>
            </div>
            <button className={'-mt-8   px-10 py-2 h-10 rounded-md flex items-center justify-center border ' + 'border-pink-600  hover:(bg-pink-200)'}
                onClick={() => {
                    api.state.set('isAnswerer', false);
                    api.state.set('isLogin', true)
                    navigate('/signup');
                }}>我要注册</button>
        </div>
    );
}

export function Myroom(props) {
    // let questions = new Array([]);
    let navigate = useNavigate();
    const [questions, useQuestions] = useState(new Array());
    useEffect(() => {
        const fn = async () => {
            const temp = await grpc.MyQuestions(api.state.get('now_user'));
            useQuestions(temp.questions);
        };
        fn();
    }, []);
    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
            <h1 className='text-xl block'>与我有关的问题们：</h1>
            <ul className='flex flex-col gap-4 overflow-auto pb-5'>
                {questions.length!=0 ? questions.map((question)=>QACard(question,navigate)):<li key='empty'>暂无数据</li>}
            </ul>
        </div>
    );
}

export function MyToken(props) {
    return (
        <div className='flex flex-col p-7 w-4/5 h-full gap-5 animated animate-fade-in'>
            <h1 className='text-2xl'>我的信息</h1>
            <hr></hr>
            <ul>
                <li className='mb-2'>我的昵称：{api.state.get('now_user').name}</li>
                <li>我的Token：{api.state.get('now_user').token}</li>
                <li>我是回答者：{api.state.get('now_user').is_answerer ? '是' : '否'}</li>
            </ul>
        </div>
    );
}

export function SignUp(props) {
    const [form, useForm] = useState({ username: "", is_answerer: false });
    let navigate = useNavigate();
    return (
        <div className='h-10/11 flex flex-col items-center justify-center bg-white gap-5 animated animate-fade-in'>
            <h1 className='text-2xl'>欢迎你加入仪科云上辅导室</h1>
            <label className='text-xl'>请输入一个合适的昵称吧：</label>
            <input className='border rounded-lg p-3' onChange={(e) => {
                useForm({
                    username: e.target.value,
                    is_answerer: form.is_answerer,
                });
            }}></input>
            <div>
                <input className="rounded-full appearance-none h-4 w-4 border border-gray-300 rounded-sm bg-white checked:bg-blue-600 checked:border-blue-600 focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="checkbox"
                    onChange={(e) => {
                        useForm({
                            username: form.username,
                            is_answerer: !form.is_answerer,
                        });
                    }}></input>
                <label className="inline-block text-gray-800">
                    我是回答者
                </label>
            </div>
            <button className='p-4 h-10 rounded-md flex items-center justify-center border px-20' onClick={() => {
                let token = nanoid(8);
                let params = [['username', form.username,], ['token', token], ['is_answerer', form.is_answerer]];
                grpc.SignUp({
                    name: form.username,
                    token: token,
                    is_answerer: form.is_answerer,
                }).then(
                    (result) => {
                        api.state.get('alert')('注册成功', 'green');
                        navigate({
                            pathname: '/signup_result',
                            search: `?${createSearchParams(params)}`,
                        })
                    },
                    (err) => {
                        api.state.get('alert')('出现错误，请再试一次', 'red');
                    }
                )
            }}>提交</button>
        </div>
    );
}

export function SignUpResult(params) {
    let navigate = useNavigate();
    const [searchParams, setSearchParams] = useSearchParams();
    let username = searchParams.get('username');
    let token = searchParams.get('token');
    let is_answerer = searchParams.get('is_answerer');

    return (
        <div className='h-10/11 flex flex-col pt-5 items-center bg-white gap-5 animated animate-fade-in'>
            <h1 className='text-2xl'>你的信息</h1>
            <hr></hr>
            <ul className='text-xl'>
                <li className='mb-2'>昵称：{username}</li>
                <li>Token：{token}</li>
                <li>回答者：{is_answerer == "true" ? "是" : "否"}</li>
            </ul>
            <p className='text-md'> 请在可靠的地方记录你的Token<br></br>Token将用于后续登录。如丢失则无法登录。</p>
            <button className='p-4 h-10 rounded-md flex items-center justify-center border px-20' onClick={() => {
                api.state.set('isLogin', false);
                navigate('/');
            }}>返回登录界面</button>
        </div>
    );
}