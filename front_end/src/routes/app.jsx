import React, { useEffect } from 'react';
import { Outlet, useLocation, useNavigate } from 'react-router-dom'
import 'windi.css'


function ToolBar(props) {
    return (
        <div className='bg-white w-screen h-1/11 pl-6 border flex gap-x-4 items-center dark:(bg-black)'>
            <span className='text-gray-800 text-xl'>云上辅导室</span>
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
                    navigate('/home/answer_home')
                }}>问题列表</li>
                <li className={items_style}>{api.state.get('isAnswerer') ? '我的回答' : '我的提问'}</li>
            </ul>
        </div>
    );
}



export function Main_Window(props) {
    let block_style = 'w-4/5 h-full bg-blue-200 flex flex-col items-center';
    return (
        <div className={block_style}>
            <h1 className='text-2xl justify-self-center'>占位符</h1>
        </div>
    );
}

export function AppWithSidebar() {
    let navigate = useNavigate();
    let location = useLocation();
    useEffect(()=>{
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

    useEffect(()=>{
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

export function Loading(props){
    let navigate = useNavigate();
    window.setTimeout(()=>navigate('/home/answer_home'),2000);
    return(
        <div className='h-10/11 flex flex-col pt-5 items-center bg-white gap-16 animated animate-fade-in'>
            <h1 className='text-4xl'>正在{props.introduction}，请稍后......</h1>
        </div>
    );
}