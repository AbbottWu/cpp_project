import { promisify } from 'util';
import path, { dirname } from 'path';
/* grpc 处理类，在整个函数中仅存在单一实例（单例模式）*/
export class App {
    constructor() {
        this.prepare_grpc();  // 准备 stub
        this.promisify_grpc();
    }

    prepare_grpc = () => {
        console.log(__dirname)
        let PROTO_PATH = path.join(__dirname,'app.proto')
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
        this.stub = new protoDescriptor.app.RPCRoute('127.0.0.1:12345', grpc.credentials.createInsecure());
    }

    promisify_grpc = () => {
        this.SignUp = promisify(this.stub.SignUp.bind(this.stub));
        this.Login = promisify(this.stub.Login.bind(this.stub));
        this.AllQuestions = promisify(this.stub.AllQuestions.bind(this.stub));
        this.MyQuestions = promisify(this.stub.MyQuestions.bind(this.stub));
        this.AskQuestion = promisify(this.stub.AskQuestion.bind(this.stub));
        this.AnswerQuestion = promisify(this.stub.AnswerQuestion.bind(this.stub));
    }

}

let runtime_app = new App(); // 准备实例