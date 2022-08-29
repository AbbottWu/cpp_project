// See the Electron documentation for details on how to use preload scripts:
// https://www.electronjs.org/docs/latest/tutorial/process-model#preload-scripts

const path = require('path');
const { contextBridge, ipcRenderer } = require("electron");
import { App as grpc_runtime } from './grpc.js'
let questions = new Map();
let state = new Map([
    ['isAnswerer',false],
    ['isLogin',false]
]);
let rpc_runtime = new grpc_runtime();

contextBridge.exposeInMainWorld(
    "api",
    {
        "node_version": process.versions.node,
        "echo": async (input_msg) => {
            const result = await ipcRenderer.invoke('rpc:echo', input_msg)
            return result;
        },
        "query": async (id) => {
            const result = await ipcRenderer.invoke('rpc:query', id)
            return result;
        },
        "questions": questions,
        "state": state, 
    }
)

contextBridge.exposeInMainWorld(
    "grpc",
    {      
        "SignUp": async(tmp_user)=>{
            return await rpc_runtime.SignUp(tmp_user);
        },  
    }
)
