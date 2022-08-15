const { app, BrowserWindow, Menu } = require('electron');
const path = require('path')
import { ipcMain } from 'electron';
import { nanoid } from 'nanoid'


class Call_Task{
  constructor(){
    this.id = nanoid(8);
    this.msg = "";
    this.err=null;
  }
  mapping = (err,msg) => {
    this.msg=msg;
    this.err=err.code;
  }
}

class App {
  constructor(){
    let PROTO_PATH = path.join(__dirname, '../../echo.proto')
    let grpc = require('@grpc/grpc-js');
    let protoLoader = require('@grpc/proto-loader');
    // Suggested options for similarity to existing grpc.load behavior
    let packageDefinition = protoLoader.loadSync(
        PROTO_PATH,
        {
            keepCase: true,
            longs: String,
            enums: String,
            defaults: true,
            oneofs: true
        });
    let protoDescriptor = grpc.loadPackageDefinition(packageDefinition);
    // The protoDescriptor object has the full package hierarchy
    let TTry = protoDescriptor.TTry;
    this.stub = new TTry.BaseRoute('127.0.0.1:12345',grpc.credentials.createInsecure());
    this.call_list = new Object();

  }
  append_grpc_call = (grpc_name,...args) => {
    let new_call = new Call_Task();
    runtime_app.stub[grpc_name](args[0], new_call.mapping);
    this.call_list[new_call.id] = new_call;
    return new_call.id;
  }
}


let runtime_app = new App();

async function handleEcho(input_Msg) {
  let task_id = runtime_app.append_grpc_call("getFeature",{content: input_Msg});
  return task_id;
}

async function handleQuery(id){
  return [runtime_app.call_list[id].err, runtime_app.call_list[id].msg];
}

// Handle creating/removing shortcuts on Windows when installing/uninstalling.
// eslint-disable-next-line global-require
if (require('electron-squirrel-startup')) {
  app.quit();
}

const createWindow = () => {
  // Create the browser window.
  Menu.setApplicationMenu(null)
  const mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      preload: MAIN_WINDOW_PRELOAD_WEBPACK_ENTRY,
      nodeIntegration: true,
    },
  });

  // and load the index.html of the app.
  mainWindow.loadURL(MAIN_WINDOW_WEBPACK_ENTRY);

  // Open the DevTools.
  mainWindow.webContents.openDevTools();
};

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
  ipcMain.handle('rpc:echo', async (event, ...args) => {
    const result = await handleEcho(...args)
    return result;
  })
  ipcMain.handle('rpc:query', async (event, ...args) => {
    const result = await handleQuery(...args)
    return result;
  });
  createWindow();
})
// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', () => {
  // On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (BrowserWindow.getAllWindows().length === 0) {
    createWindow();
  }
});

// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and import them here.
