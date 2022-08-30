#pragma once
#include <grpc/grpc.h>
#include <grpcpp/security/server_credentials.h>
#include <grpcpp/server.h>
#include <grpcpp/server_builder.h>
#include <grpcpp/server_context.h>
#include "extern/app.pb.h"
#include "extern/app.grpc.pb.h"
#include "app.h"
#include "user.h"
#include "question.h"


using namespace std;

class RouteImpl final : public app::RPCRoute::Service{
    grpc::Status SignUp(grpc::ServerContext* context,const app::User* input, app::IsOK* output) override;
    grpc::Status Login(grpc::ServerContext*, app::User const*, app::IsOK*) override;
    grpc::Status AllQuestions(grpc::ServerContext*, app::RequestQuestions const*, app::Questions*) override;
    grpc::Status MyQuestions(grpc::ServerContext*, app::RequestQuestions const*, app::Questions*) override;
    grpc::Status AskQuestion(grpc::ServerContext*, app::UQpair const*, app::IsOK*) override;
    grpc::Status AnswerQuestion(grpc::ServerContext*, app::UQpair const*, app::IsOK*) override;
};
