import React, { useEffect, useState } from 'react';
import { Outlet, useLocation, useNavigate } from 'react-router-dom'
import 'windi.css'


function Alerts(props) {
    let base_style = "flex flex-col items-center absolute top-0 right-0 m-4 p-3 w-3/13 ring-2 shadow-xl rounded-lg z-50 "
    const [border_color, useColor] = useState("ring-blue-400 bg-blue-200 ");
    const [animate_style, useAnimate] = useState("hidden");
    const [content, useContent] = useState();
    function sendAlert(content, color) {
        useColor("ring-" + color + "-400 bg-" + color + "-200 ");
        useContent(content);
        useAnimate('animate-animated animate-fadeInUp');
        setTimeout(() => {
            useAnimate('animate-animated animate-delay-1s animate animate-fadeOutRight animate-fast')
        }, 1000);
        setTimeout(() => {
            useAnimate('hidden')
        }, 2500);
    }
    api.state.set('alert', sendAlert);
    return (
        <div className={base_style + border_color + animate_style}>
            {content}
        </div>
    )
}

function ToolBar(props) {
    return (
        <div className='bg-white w-screen h-1/11 pl-6 border flex gap-x-4 items-center dark:(bg-black)'>
            <span className='text-gray-800 text-xl'>云上辅导室</span>
            <Alerts />
            <div className='ring-blue-400 bg-blue-200 ring-red-400 bg-red-200 ring-green-400 bg-green-200 ring-yellow-400 bg-yellow-200 h-0 w-0'></div>
        </div>
    );
}


function SideBar(props) {
    let navigate = useNavigate();
    let block_style = 'w-1/5 h-full shadow-md';
    let items_style = 'flex justify-center text-gray-800 flex py-3 hover:(bg-gray-100) cursor-pointer transition duaration-200 ease-linear';
    return (
        <div className={block_style}>
            <ul className='flex flex-col'>
                <li className={items_style} onClick={() => {
                    api.state.get('isAnswerer') ? navigate('/home/answer_home') : navigate('/home/question_home')
                }}>问题列表</li>
                <li className={items_style + (api.state.get('isAnswerer') ? ' hidden' : '')} onClick={() => { navigate('/home/ask_question') }}>我要提问</li>
                <li className={items_style} onClick={() => {
                    navigate('/home/myroom');
                }}>{api.state.get('isAnswerer') ? '我的回答' : '我的提问'}</li>
                <li className={items_style} onClick={() => {
                    navigate('/home/my_account')
                }}> 账户信息 </li>
            </ul>
        </div>
    );
}


export function AppWithSidebar() {
    let navigate = useNavigate();
    let location = useLocation();
    useEffect(() => {
        if (!api.state.get('isLogin') && location.pathname != '/') {
            navigate('/')
        }
    })
    return (
        <div className='w-screen h-screen'>
            <ToolBar />
            <div className='w-screen bg-white h-10/11 flex dark:(bg-black) animated animate-fade-in'>
                <SideBar />
                <Outlet />
            </div>
        </div>

    );
}

export function App() {
    let navigate = useNavigate();
    let location = useLocation();

    useEffect(() => {
        if (!api.state.get('isLogin') && location.pathname != '/') {
            navigate('/')
        }
    })
    return (
        <div className='w-screen h-screen'>
            <ToolBar />
            <Outlet />
        </div>

    );
}

export function Loading(props) {
    let navigate = useNavigate();
    window.setTimeout(() => navigate('/home/answer_home'), 500);
    return (
        <div className='h-10/11 flex flex-col pt-5 items-center bg-white gap-16 animated animate-fade-in'>
            <h1 className='text-4xl'>正在{props.introduction}，请稍后......</h1>
        </div>
    );
}