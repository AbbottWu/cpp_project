import * as React from 'react';
import * as ReactDOM from 'react-dom';
import { List_Items } from './component.jsx';
import 'windi.css';

const root = ReactDOM.createRoot(document.getElementById('root'));

function ToolBar(props) {
  return (
    <div className='bg-white w-screen h-1/11 pl-6 border flex gap-x-4 items-center dark:(bg-black)'>
      <span className='text-gray-800 text-2xl'>测试标题栏</span>
    </div>
  );
}

function Sidebar_Items(props) {
  return List_Items(props, 'justify-center text-gray-700 flex py-3 hover:(bg-gray-100)');
};


function Message_Items(props) {
  return List_Items(props, ' justify-left py-2 px-4 border', 'md')
}

function SideBar(props) {
  const items = ['hi', 'hii', 'hiidion', api.node_version];
  return (
    <div className='w-1/5 h-full shadow-md'>
      <Sidebar_Items items={items} />
    </div>
  );
}



function Main_Window(props) {
  const [content, useContent] = React.useState('');
  const [list_content, useList] = React.useState(new Array());
  return (
    <div className='w-4/5 h-full p-8 flex flex-col gap-y-5'>
      <h1 className='text-xl self-center'>暑期实践项目：前端技术测试</h1>
      <hr></hr>
      <div className='self-center mt-10 flex'>
        <input className='border border-2 border-sky-400 rounded-lg p-4  mr-4 flex-shrink'
          onChange={(e) => useContent(e.target.value)}
          value={content}
        ></input>
        <button className='text-gray-800 text-lg border py-4 px-8 rounded-lg  hover:(bg-gray-100)'
          onClick={() => {
            if (content != '') {
              api.echo("echo").then(result => {
                useList(list_content.concat([content + " " + result]));
                useContent('');
              },
                error => console.log(error));
            }
          }}>
          提交</button>

        <button className='text-gray-800 text-lg border py-4 px-8 rounded-lg  hover:(bg-gray-100)'
          onClick={() => {
            if (content != '') {
              api.query(content).then(result => alert(result), error => alert(error));
              useContent('');
            }
          }}>
          提取</button>
      </div>
      <div className='self-center mt-6 bg-gray-200/60 w-5/6 h-1/2 rounded-md overflow-auto'>
        <div className='h-0 w-0 rounded-t-md rounded-b-md'></div>
        <Message_Items items={list_content} />
      </div>
    </div>
  );
}

root.render(
  <div className='w-screen h-screen bg-blue-500'>
    <ToolBar />
    <div className='w-screen bg-white h-10/11 flex dark:(bg-black)'>
      <SideBar />
      <Main_Window />
    </div>
  </div>
);
