import React from 'react';
import 'windi.css'
import { useNavigate } from 'react-router-dom';

export function Welcome() {
    let navigate = useNavigate();
    let button_style = 'p-4 h-10 rounded-md flex items-center justify-center border ';
    return (
        <div className='h-10/11 flex flex-col pt-5 items-center bg-white gap-16 animated animate-fade-in'>
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
                <button className={button_style + 'border-blue-600  hover:(bg-blue-200)'}>我要提问！！</button>
                <button className={button_style + 'border-emerald-600  hover:(bg-emerald-200)'}
                    onClick={() => {
                        api.state.set('isAnswerer',true);
                        api.state.set('isLogin',true)
                        navigate('/onlogin');
                    }}>我能回答！！</button>
            </div>
        </div>
    );
}