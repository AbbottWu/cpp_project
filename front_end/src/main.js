const { app, BrowserWindow, Menu } = require('electron');
const path = require('path')
import { ipcMain } from 'electron';
import { nanoid } from 'nanoid'

/* 在异步调用 gRPC 过程中记录调用结果、异常与状态 */
class Call_Task {
  constructor() {
    this.id = nanoid(8);
    this.msg = "";
    this.err = null;
    this.ok = false;
  }

  /* 交给 gRPC 的 stub 的回调函数，更新状态与值 */
  mapping = (err, msg) => {
    this.msg = msg;
    this.err = err;
    this.ok = true;
  }

  /* 利用 getter 构造可经过 IPC 传递的数据 */
  get clone_able() {
    return [this.err ? this.err.code : null, this.msg];
  }
}

/* grpc 处理类，在整个函数中仅存在单一实例（单例模式）*/
class App {
  constructor() {
    this.prepare_grpc();  // 准备 stub
    this.call_list = new Object();  // 准备事件记录表，记录异步过程
  }

  prepare_grpc = () => {
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
    this.stub = new TTry.BaseRoute('127.0.0.1:12345', grpc.credentials.createInsecure());
  }

  /* 调用并追加异步 gRPC 调用
    grpc_name：grpc 函数名（camel 命名）
    args：所有所需参数
  */
  append_grpc_call = async (grpc_name, ...args) => {
    let new_call = new Call_Task();  // 创建记录
    this.call_list[new_call.id] = new_call;  // 登记记录
    runtime_app.stub[grpc_name](args[0], new_call.mapping);  // 传递记录的回调函数
    return new_call.id;  // 返回记录 ID
  }

  handleQuery = async (id) => {
    return this.call_list[id].clone_able;
  }
}

let runtime_app = new App(); // 准备实例

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
  console.log(MAIN_WINDOW_WEBPACK_ENTRY);
  // and load the index.html of the app.
  mainWindow.loadURL(MAIN_WINDOW_WEBPACK_ENTRY);

  // Open the DevTools.
  mainWindow.webContents.openDevTools();
};

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
  ipcMain.handle('rpc:echo',
    async (event, ...args) => runtime_app.append_grpc_call("getFeature", { content: args }));

  ipcMain.handle('rpc:query',
    async (event, id) => runtime_app.handleQuery(id));

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
