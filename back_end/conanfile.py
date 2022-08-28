from conans import ConanFile

class PocoMD5(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    requires="grpc/1.48.0", "ninja/1.11.0", "gtest/cci.20210126", "gtest/cci.20210126"
    generators="cmake"
