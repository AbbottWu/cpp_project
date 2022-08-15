// See the Electron documentation for details on how to use preload scripts:
// https://www.electronjs.org/docs/latest/tutorial/process-model#preload-scripts

const path = require('path');
const { contextBridge,ipcRenderer } = require("electron");

contextBridge.exposeInMainWorld(
    "api",
    {
        "node_version": process.versions.node,
        "echo": async (input_msg) =>{
            const result = await ipcRenderer.invoke('rpc:echo',input_msg)
            return result;
        },
        "query": async (id) =>{
            const result = await ipcRenderer.invoke('rpc:query',id)
            return result;
        },
    }
)
