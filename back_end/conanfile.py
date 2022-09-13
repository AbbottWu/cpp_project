from conans import ConanFile

class BackEnd(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    requires="grpc/1.48.0", "ninja/1.11.0", "gtest/cci.20210126", "spdlog/1.10.0", "sqlite_orm/1.7.1", "clipp/1.2.3"
    generators="cmake"
