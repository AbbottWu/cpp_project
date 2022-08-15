include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS SUFFIX BUILD_TYPE)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            set(_BTYPE ${CMAKE_BUILD_TYPE})
        elseif(NOT BUILD_TYPE STREQUAL "")
            set(_BTYPE ${BUILD_TYPE})
        endif()
        if(_BTYPE)
            if(${_BTYPE} MATCHES "Debug|_DEBUG")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "Release|_RELEASE")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "RelWithDebInfo|_RELWITHDEBINFO")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "MinSizeRel|_MINSIZEREL")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            endif()
        endif()
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAMES ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS${SUFFIX}} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS${SUFFIX}}")
            endif()
        endforeach()
    endif()
endmacro()


#################
###  GRPC
#################
set(CONAN_GRPC_ROOT "C:/.conan/6de739/1")
set(CONAN_INCLUDE_DIRS_GRPC "C:/.conan/6de739/1/include")
set(CONAN_LIB_DIRS_GRPC "C:/.conan/6de739/1/lib")
set(CONAN_BIN_DIRS_GRPC "C:/.conan/6de739/1/bin")
set(CONAN_RES_DIRS_GRPC "C:/.conan/6de739/1/res")
set(CONAN_SRC_DIRS_GRPC )
set(CONAN_BUILD_DIRS_GRPC "C:/.conan/6de739/1/")
set(CONAN_FRAMEWORK_DIRS_GRPC )
set(CONAN_LIBS_GRPC grpc++_alts grpc++_error_details grpc_plugin_support grpc++_unsecure grpc_unsecure grpc++_reflection grpcpp_channelz grpc++ grpc address_sorting gpr upb)
set(CONAN_PKG_LIBS_GRPC grpc++_alts grpc++_error_details grpc_plugin_support grpc++_unsecure grpc_unsecure grpc++_reflection grpcpp_channelz grpc++ grpc address_sorting gpr upb)
set(CONAN_SYSTEM_LIBS_GRPC crypt32 ws2_32 wsock32)
set(CONAN_FRAMEWORKS_GRPC )
set(CONAN_FRAMEWORKS_FOUND_GRPC "")  # Will be filled later
set(CONAN_DEFINES_GRPC )
set(CONAN_BUILD_MODULES_PATHS_GRPC )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GRPC )

set(CONAN_C_FLAGS_GRPC "")
set(CONAN_CXX_FLAGS_GRPC "")
set(CONAN_SHARED_LINKER_FLAGS_GRPC "")
set(CONAN_EXE_LINKER_FLAGS_GRPC "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GRPC_LIST "")
set(CONAN_CXX_FLAGS_GRPC_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GRPC_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GRPC_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GRPC "${CONAN_FRAMEWORKS_GRPC}" "_GRPC" "")
# Append to aggregated values variable
set(CONAN_LIBS_GRPC ${CONAN_PKG_LIBS_GRPC} ${CONAN_SYSTEM_LIBS_GRPC} ${CONAN_FRAMEWORKS_FOUND_GRPC})


#################
###  NINJA
#################
set(CONAN_NINJA_ROOT "C:/Users/Awu/.conan/data/ninja/1.11.0/_/_/package/63c5d5dc6eb958dab897e143053e17f583d55879")
set(CONAN_INCLUDE_DIRS_NINJA )
set(CONAN_LIB_DIRS_NINJA )
set(CONAN_BIN_DIRS_NINJA "C:/Users/Awu/.conan/data/ninja/1.11.0/_/_/package/63c5d5dc6eb958dab897e143053e17f583d55879/bin")
set(CONAN_RES_DIRS_NINJA )
set(CONAN_SRC_DIRS_NINJA )
set(CONAN_BUILD_DIRS_NINJA "C:/Users/Awu/.conan/data/ninja/1.11.0/_/_/package/63c5d5dc6eb958dab897e143053e17f583d55879/")
set(CONAN_FRAMEWORK_DIRS_NINJA )
set(CONAN_LIBS_NINJA )
set(CONAN_PKG_LIBS_NINJA )
set(CONAN_SYSTEM_LIBS_NINJA )
set(CONAN_FRAMEWORKS_NINJA )
set(CONAN_FRAMEWORKS_FOUND_NINJA "")  # Will be filled later
set(CONAN_DEFINES_NINJA )
set(CONAN_BUILD_MODULES_PATHS_NINJA )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_NINJA )

set(CONAN_C_FLAGS_NINJA "")
set(CONAN_CXX_FLAGS_NINJA "")
set(CONAN_SHARED_LINKER_FLAGS_NINJA "")
set(CONAN_EXE_LINKER_FLAGS_NINJA "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_NINJA_LIST "")
set(CONAN_CXX_FLAGS_NINJA_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_NINJA_LIST "")
set(CONAN_EXE_LINKER_FLAGS_NINJA_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_NINJA "${CONAN_FRAMEWORKS_NINJA}" "_NINJA" "")
# Append to aggregated values variable
set(CONAN_LIBS_NINJA ${CONAN_PKG_LIBS_NINJA} ${CONAN_SYSTEM_LIBS_NINJA} ${CONAN_FRAMEWORKS_FOUND_NINJA})


#################
###  GTEST
#################
set(CONAN_GTEST_ROOT "C:/Users/Awu/.conan/data/gtest/cci.20210126/_/_/package/68a060fdd97b62cfc15d770518cafb06fe311849")
set(CONAN_INCLUDE_DIRS_GTEST "C:/Users/Awu/.conan/data/gtest/cci.20210126/_/_/package/68a060fdd97b62cfc15d770518cafb06fe311849/include")
set(CONAN_LIB_DIRS_GTEST "C:/Users/Awu/.conan/data/gtest/cci.20210126/_/_/package/68a060fdd97b62cfc15d770518cafb06fe311849/lib")
set(CONAN_BIN_DIRS_GTEST )
set(CONAN_RES_DIRS_GTEST )
set(CONAN_SRC_DIRS_GTEST )
set(CONAN_BUILD_DIRS_GTEST "C:/Users/Awu/.conan/data/gtest/cci.20210126/_/_/package/68a060fdd97b62cfc15d770518cafb06fe311849/")
set(CONAN_FRAMEWORK_DIRS_GTEST )
set(CONAN_LIBS_GTEST gtest_main gmock_main gmock gtest)
set(CONAN_PKG_LIBS_GTEST gtest_main gmock_main gmock gtest)
set(CONAN_SYSTEM_LIBS_GTEST )
set(CONAN_FRAMEWORKS_GTEST )
set(CONAN_FRAMEWORKS_FOUND_GTEST "")  # Will be filled later
set(CONAN_DEFINES_GTEST )
set(CONAN_BUILD_MODULES_PATHS_GTEST )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GTEST )

set(CONAN_C_FLAGS_GTEST "")
set(CONAN_CXX_FLAGS_GTEST "")
set(CONAN_SHARED_LINKER_FLAGS_GTEST "")
set(CONAN_EXE_LINKER_FLAGS_GTEST "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GTEST_LIST "")
set(CONAN_CXX_FLAGS_GTEST_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GTEST_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GTEST_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GTEST "${CONAN_FRAMEWORKS_GTEST}" "_GTEST" "")
# Append to aggregated values variable
set(CONAN_LIBS_GTEST ${CONAN_PKG_LIBS_GTEST} ${CONAN_SYSTEM_LIBS_GTEST} ${CONAN_FRAMEWORKS_FOUND_GTEST})


#################
###  ABSEIL
#################
set(CONAN_ABSEIL_ROOT "C:/.conan/39e0389/1")
set(CONAN_INCLUDE_DIRS_ABSEIL "C:/.conan/39e0389/1/include")
set(CONAN_LIB_DIRS_ABSEIL "C:/.conan/39e0389/1/lib")
set(CONAN_BIN_DIRS_ABSEIL )
set(CONAN_RES_DIRS_ABSEIL )
set(CONAN_SRC_DIRS_ABSEIL )
set(CONAN_BUILD_DIRS_ABSEIL "C:/.conan/39e0389/1/")
set(CONAN_FRAMEWORK_DIRS_ABSEIL )
set(CONAN_LIBS_ABSEIL absl_scoped_set_env absl_strerror absl_failure_signal_handler absl_examine_stack absl_leak_check_disable absl_leak_check absl_flags_parse absl_flags_usage absl_flags_usage_internal absl_flags absl_flags_reflection absl_raw_hash_set absl_hashtablez_sampler absl_flags_private_handle_accessor absl_flags_internal absl_flags_config absl_flags_program_name absl_flags_marshalling absl_flags_commandlineflag absl_flags_commandlineflag_internal absl_hash absl_city absl_low_level_hash absl_periodic_sampler absl_random_distributions absl_random_seed_sequences absl_random_internal_pool_urbg absl_random_seed_gen_exception absl_random_internal_seed_material absl_random_internal_randen absl_random_internal_randen_slow absl_random_internal_randen_hwaes absl_random_internal_randen_hwaes_impl absl_random_internal_platform absl_random_internal_distribution_test_util absl_statusor absl_status absl_str_format_internal absl_cordz_sample_token absl_cord absl_cordz_info absl_cord_internal absl_cordz_functions absl_exponential_biased absl_cordz_handle absl_synchronization absl_stacktrace absl_symbolize absl_debugging_internal absl_demangle_internal absl_graphcycles_internal absl_malloc_internal absl_time absl_strings absl_int128 absl_strings_internal absl_base absl_spinlock_wait absl_civil_time absl_time_zone absl_bad_any_cast_impl absl_throw_delegate absl_bad_optional_access absl_bad_variant_access absl_raw_logging_internal absl_log_severity)
set(CONAN_PKG_LIBS_ABSEIL absl_scoped_set_env absl_strerror absl_failure_signal_handler absl_examine_stack absl_leak_check_disable absl_leak_check absl_flags_parse absl_flags_usage absl_flags_usage_internal absl_flags absl_flags_reflection absl_raw_hash_set absl_hashtablez_sampler absl_flags_private_handle_accessor absl_flags_internal absl_flags_config absl_flags_program_name absl_flags_marshalling absl_flags_commandlineflag absl_flags_commandlineflag_internal absl_hash absl_city absl_low_level_hash absl_periodic_sampler absl_random_distributions absl_random_seed_sequences absl_random_internal_pool_urbg absl_random_seed_gen_exception absl_random_internal_seed_material absl_random_internal_randen absl_random_internal_randen_slow absl_random_internal_randen_hwaes absl_random_internal_randen_hwaes_impl absl_random_internal_platform absl_random_internal_distribution_test_util absl_statusor absl_status absl_str_format_internal absl_cordz_sample_token absl_cord absl_cordz_info absl_cord_internal absl_cordz_functions absl_exponential_biased absl_cordz_handle absl_synchronization absl_stacktrace absl_symbolize absl_debugging_internal absl_demangle_internal absl_graphcycles_internal absl_malloc_internal absl_time absl_strings absl_int128 absl_strings_internal absl_base absl_spinlock_wait absl_civil_time absl_time_zone absl_bad_any_cast_impl absl_throw_delegate absl_bad_optional_access absl_bad_variant_access absl_raw_logging_internal absl_log_severity)
set(CONAN_SYSTEM_LIBS_ABSEIL bcrypt dbghelp advapi32)
set(CONAN_FRAMEWORKS_ABSEIL )
set(CONAN_FRAMEWORKS_FOUND_ABSEIL "")  # Will be filled later
set(CONAN_DEFINES_ABSEIL )
set(CONAN_BUILD_MODULES_PATHS_ABSEIL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ABSEIL )

set(CONAN_C_FLAGS_ABSEIL "")
set(CONAN_CXX_FLAGS_ABSEIL "")
set(CONAN_SHARED_LINKER_FLAGS_ABSEIL "")
set(CONAN_EXE_LINKER_FLAGS_ABSEIL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ABSEIL_LIST "")
set(CONAN_CXX_FLAGS_ABSEIL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ABSEIL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ABSEIL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ABSEIL "${CONAN_FRAMEWORKS_ABSEIL}" "_ABSEIL" "")
# Append to aggregated values variable
set(CONAN_LIBS_ABSEIL ${CONAN_PKG_LIBS_ABSEIL} ${CONAN_SYSTEM_LIBS_ABSEIL} ${CONAN_FRAMEWORKS_FOUND_ABSEIL})


#################
###  C-ARES
#################
set(CONAN_C-ARES_ROOT "C:/Users/Awu/.conan/data/c-ares/1.18.1/_/_/package/104d04e27d80f90ee826c18d63336299ffadd9c8")
set(CONAN_INCLUDE_DIRS_C-ARES "C:/Users/Awu/.conan/data/c-ares/1.18.1/_/_/package/104d04e27d80f90ee826c18d63336299ffadd9c8/include")
set(CONAN_LIB_DIRS_C-ARES "C:/Users/Awu/.conan/data/c-ares/1.18.1/_/_/package/104d04e27d80f90ee826c18d63336299ffadd9c8/lib")
set(CONAN_BIN_DIRS_C-ARES "C:/Users/Awu/.conan/data/c-ares/1.18.1/_/_/package/104d04e27d80f90ee826c18d63336299ffadd9c8/bin")
set(CONAN_RES_DIRS_C-ARES )
set(CONAN_SRC_DIRS_C-ARES )
set(CONAN_BUILD_DIRS_C-ARES "C:/Users/Awu/.conan/data/c-ares/1.18.1/_/_/package/104d04e27d80f90ee826c18d63336299ffadd9c8/")
set(CONAN_FRAMEWORK_DIRS_C-ARES )
set(CONAN_LIBS_C-ARES cares)
set(CONAN_PKG_LIBS_C-ARES cares)
set(CONAN_SYSTEM_LIBS_C-ARES ws2_32 advapi32 iphlpapi)
set(CONAN_FRAMEWORKS_C-ARES )
set(CONAN_FRAMEWORKS_FOUND_C-ARES "")  # Will be filled later
set(CONAN_DEFINES_C-ARES "-DCARES_STATICLIB")
set(CONAN_BUILD_MODULES_PATHS_C-ARES )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_C-ARES "CARES_STATICLIB")

set(CONAN_C_FLAGS_C-ARES "")
set(CONAN_CXX_FLAGS_C-ARES "")
set(CONAN_SHARED_LINKER_FLAGS_C-ARES "")
set(CONAN_EXE_LINKER_FLAGS_C-ARES "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_C-ARES_LIST "")
set(CONAN_CXX_FLAGS_C-ARES_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_C-ARES_LIST "")
set(CONAN_EXE_LINKER_FLAGS_C-ARES_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_C-ARES "${CONAN_FRAMEWORKS_C-ARES}" "_C-ARES" "")
# Append to aggregated values variable
set(CONAN_LIBS_C-ARES ${CONAN_PKG_LIBS_C-ARES} ${CONAN_SYSTEM_LIBS_C-ARES} ${CONAN_FRAMEWORKS_FOUND_C-ARES})


#################
###  OPENSSL
#################
set(CONAN_OPENSSL_ROOT "C:/Users/Awu/.conan/data/openssl/1.1.1o/_/_/package/70711aff723b218b02483e600038031bf91007bc")
set(CONAN_INCLUDE_DIRS_OPENSSL "C:/Users/Awu/.conan/data/openssl/1.1.1o/_/_/package/70711aff723b218b02483e600038031bf91007bc/include")
set(CONAN_LIB_DIRS_OPENSSL "C:/Users/Awu/.conan/data/openssl/1.1.1o/_/_/package/70711aff723b218b02483e600038031bf91007bc/lib")
set(CONAN_BIN_DIRS_OPENSSL "C:/Users/Awu/.conan/data/openssl/1.1.1o/_/_/package/70711aff723b218b02483e600038031bf91007bc/bin")
set(CONAN_RES_DIRS_OPENSSL )
set(CONAN_SRC_DIRS_OPENSSL )
set(CONAN_BUILD_DIRS_OPENSSL "C:/Users/Awu/.conan/data/openssl/1.1.1o/_/_/package/70711aff723b218b02483e600038031bf91007bc/")
set(CONAN_FRAMEWORK_DIRS_OPENSSL )
set(CONAN_LIBS_OPENSSL libssl libcrypto)
set(CONAN_PKG_LIBS_OPENSSL libssl libcrypto)
set(CONAN_SYSTEM_LIBS_OPENSSL crypt32 ws2_32 advapi32 user32 bcrypt)
set(CONAN_FRAMEWORKS_OPENSSL )
set(CONAN_FRAMEWORKS_FOUND_OPENSSL "")  # Will be filled later
set(CONAN_DEFINES_OPENSSL )
set(CONAN_BUILD_MODULES_PATHS_OPENSSL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENSSL )

set(CONAN_C_FLAGS_OPENSSL "")
set(CONAN_CXX_FLAGS_OPENSSL "")
set(CONAN_SHARED_LINKER_FLAGS_OPENSSL "")
set(CONAN_EXE_LINKER_FLAGS_OPENSSL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENSSL_LIST "")
set(CONAN_CXX_FLAGS_OPENSSL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENSSL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENSSL "${CONAN_FRAMEWORKS_OPENSSL}" "_OPENSSL" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENSSL ${CONAN_PKG_LIBS_OPENSSL} ${CONAN_SYSTEM_LIBS_OPENSSL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL})


#################
###  RE2
#################
set(CONAN_RE2_ROOT "C:/Users/Awu/.conan/data/re2/20220201/_/_/package/70711aff723b218b02483e600038031bf91007bc")
set(CONAN_INCLUDE_DIRS_RE2 "C:/Users/Awu/.conan/data/re2/20220201/_/_/package/70711aff723b218b02483e600038031bf91007bc/include")
set(CONAN_LIB_DIRS_RE2 "C:/Users/Awu/.conan/data/re2/20220201/_/_/package/70711aff723b218b02483e600038031bf91007bc/lib")
set(CONAN_BIN_DIRS_RE2 )
set(CONAN_RES_DIRS_RE2 )
set(CONAN_SRC_DIRS_RE2 )
set(CONAN_BUILD_DIRS_RE2 "C:/Users/Awu/.conan/data/re2/20220201/_/_/package/70711aff723b218b02483e600038031bf91007bc/")
set(CONAN_FRAMEWORK_DIRS_RE2 )
set(CONAN_LIBS_RE2 re2)
set(CONAN_PKG_LIBS_RE2 re2)
set(CONAN_SYSTEM_LIBS_RE2 )
set(CONAN_FRAMEWORKS_RE2 )
set(CONAN_FRAMEWORKS_FOUND_RE2 "")  # Will be filled later
set(CONAN_DEFINES_RE2 )
set(CONAN_BUILD_MODULES_PATHS_RE2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_RE2 )

set(CONAN_C_FLAGS_RE2 "")
set(CONAN_CXX_FLAGS_RE2 "")
set(CONAN_SHARED_LINKER_FLAGS_RE2 "")
set(CONAN_EXE_LINKER_FLAGS_RE2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_RE2_LIST "")
set(CONAN_CXX_FLAGS_RE2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_RE2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_RE2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_RE2 "${CONAN_FRAMEWORKS_RE2}" "_RE2" "")
# Append to aggregated values variable
set(CONAN_LIBS_RE2 ${CONAN_PKG_LIBS_RE2} ${CONAN_SYSTEM_LIBS_RE2} ${CONAN_FRAMEWORKS_FOUND_RE2})


#################
###  GRPC-PROTO
#################
set(CONAN_GRPC-PROTO_ROOT "C:/Users/Awu/.conan/data/grpc-proto/cci.20220627/_/_/package/ad53281cef49d392d3f3253e30d23b67500c80c6")
set(CONAN_INCLUDE_DIRS_GRPC-PROTO "C:/Users/Awu/.conan/data/grpc-proto/cci.20220627/_/_/package/ad53281cef49d392d3f3253e30d23b67500c80c6/include")
set(CONAN_LIB_DIRS_GRPC-PROTO "C:/Users/Awu/.conan/data/grpc-proto/cci.20220627/_/_/package/ad53281cef49d392d3f3253e30d23b67500c80c6/lib")
set(CONAN_BIN_DIRS_GRPC-PROTO )
set(CONAN_RES_DIRS_GRPC-PROTO "C:/Users/Awu/.conan/data/grpc-proto/cci.20220627/_/_/package/ad53281cef49d392d3f3253e30d23b67500c80c6/res")
set(CONAN_SRC_DIRS_GRPC-PROTO )
set(CONAN_BUILD_DIRS_GRPC-PROTO "C:/Users/Awu/.conan/data/grpc-proto/cci.20220627/_/_/package/ad53281cef49d392d3f3253e30d23b67500c80c6/")
set(CONAN_FRAMEWORK_DIRS_GRPC-PROTO )
set(CONAN_LIBS_GRPC-PROTO grpc_alts_handshaker_proto grpc_benchmark_service_proto grpc_binarylog_proto grpc_channelz_proto grpc_control_proto grpc_grpclb_load_balancer_proto grpc_grpclb_load_reporter_proto grpc_health_proto grpc_messages_proto grpc_reflection_proto grpc_reflection_proto_deprecated grpc_report_qps_scenario_service_proto grpc_rls_config_proto grpc_rls_proto grpc_service_config_proto grpc_stats_proto grpc_worker_service_proto)
set(CONAN_PKG_LIBS_GRPC-PROTO grpc_alts_handshaker_proto grpc_benchmark_service_proto grpc_binarylog_proto grpc_channelz_proto grpc_control_proto grpc_grpclb_load_balancer_proto grpc_grpclb_load_reporter_proto grpc_health_proto grpc_messages_proto grpc_reflection_proto grpc_reflection_proto_deprecated grpc_report_qps_scenario_service_proto grpc_rls_config_proto grpc_rls_proto grpc_service_config_proto grpc_stats_proto grpc_worker_service_proto)
set(CONAN_SYSTEM_LIBS_GRPC-PROTO )
set(CONAN_FRAMEWORKS_GRPC-PROTO )
set(CONAN_FRAMEWORKS_FOUND_GRPC-PROTO "")  # Will be filled later
set(CONAN_DEFINES_GRPC-PROTO )
set(CONAN_BUILD_MODULES_PATHS_GRPC-PROTO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GRPC-PROTO )

set(CONAN_C_FLAGS_GRPC-PROTO "")
set(CONAN_CXX_FLAGS_GRPC-PROTO "")
set(CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO "")
set(CONAN_EXE_LINKER_FLAGS_GRPC-PROTO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GRPC-PROTO_LIST "")
set(CONAN_CXX_FLAGS_GRPC-PROTO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GRPC-PROTO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GRPC-PROTO "${CONAN_FRAMEWORKS_GRPC-PROTO}" "_GRPC-PROTO" "")
# Append to aggregated values variable
set(CONAN_LIBS_GRPC-PROTO ${CONAN_PKG_LIBS_GRPC-PROTO} ${CONAN_SYSTEM_LIBS_GRPC-PROTO} ${CONAN_FRAMEWORKS_FOUND_GRPC-PROTO})


#################
###  GOOGLEAPIS
#################
set(CONAN_GOOGLEAPIS_ROOT "C:/.conan/3cc72e8/1")
set(CONAN_INCLUDE_DIRS_GOOGLEAPIS "C:/.conan/3cc72e8/1/include")
set(CONAN_LIB_DIRS_GOOGLEAPIS "C:/.conan/3cc72e8/1/lib")
set(CONAN_BIN_DIRS_GOOGLEAPIS )
set(CONAN_RES_DIRS_GOOGLEAPIS "C:/.conan/3cc72e8/1/res")
set(CONAN_SRC_DIRS_GOOGLEAPIS )
set(CONAN_BUILD_DIRS_GOOGLEAPIS "C:/.conan/3cc72e8/1/")
set(CONAN_FRAMEWORK_DIRS_GOOGLEAPIS )
set(CONAN_LIBS_GOOGLEAPIS google_actions_type_date_range_proto google_actions_type_datetime_range_proto google_analytics_data_v1alpha_data_proto google_api_annotations_proto google_api_auth_proto google_api_backend_proto google_api_billing_proto google_api_client_proto google_api_config_change_proto google_api_consumer_proto google_api_context_proto google_api_control_proto google_api_distribution_proto google_api_documentation_proto google_api_endpoint_proto google_api_expr_conformance_v1alpha1_conformance_proto google_api_expr_v1alpha1_checked_proto google_api_expr_v1alpha1_eval_proto google_api_expr_v1alpha1_explain_proto google_api_expr_v1alpha1_syntax_proto google_api_expr_v1alpha1_value_proto google_api_expr_v1beta1_decl_proto google_api_expr_v1beta1_eval_proto google_api_expr_v1beta1_expr_proto google_api_expr_v1beta1_source_proto google_api_expr_v1beta1_value_proto google_api_field_behavior_proto google_api_http_proto google_api_httpbody_proto google_api_label_proto google_api_launch_stage_proto google_api_log_proto google_api_logging_proto google_api_metric_proto google_api_monitored_resource_proto google_api_monitoring_proto google_api_quota_proto google_api_resource_proto google_api_routing_proto google_api_service_proto google_api_servicecontrol_v1_servicecontrol_proto google_api_servicecontrol_v2_servicecontrol_proto google_api_servicemanagement_v1_servicemanagement_proto google_api_serviceusage_v1_serviceusage_proto google_api_source_info_proto google_api_system_parameter_proto google_api_usage_proto google_api_visibility_proto google_appengine_legacy_legacy_proto google_appengine_logging_v1_logging_proto google_appengine_v1_appengine_proto google_apps_script_type_calendar_calendar_proto google_apps_script_type_docs_docs_proto google_apps_script_type_drive_drive_proto google_apps_script_type_gmail_gmail_proto google_apps_script_type_sheets_sheets_proto google_apps_script_type_slides_slides_proto google_apps_script_type_type_proto google_bigtable_admin_v2_admin_proto google_bigtable_v2_bigtable_proto google_chat_logging_v1_logging_proto google_chromeos_uidetection_v1_uidetection_proto google_cloud_accessapproval_v1_accessapproval_proto google_cloud_aiplatform_logging_logging_proto google_cloud_aiplatform_v1_aiplatform_proto google_cloud_aiplatform_v1_schema_predict_instance_instance_proto google_cloud_aiplatform_v1_schema_predict_params_params_proto google_cloud_aiplatform_v1_schema_predict_prediction_prediction_proto google_cloud_aiplatform_v1_schema_trainingjob_definition_definition_proto google_cloud_apigateway_v1_apigateway_proto google_cloud_apigeeconnect_v1_apigeeconnect_proto google_cloud_apigeeregistry_v1_apigeeregistry_proto google_cloud_asset_v1_asset_proto google_cloud_assuredworkloads_regulatoryintercept_logging_v1_logging_proto google_cloud_assuredworkloads_v1_assuredworkloads_proto google_cloud_assuredworkloads_v1beta1_assuredworkloads_proto google_cloud_audit_audit_proto google_cloud_automl_v1_automl_proto google_cloud_baremetalsolution_v2_baremetalsolution_proto google_cloud_batch_v1alpha1_batch_proto google_cloud_bigquery_connection_v1_connection_proto google_cloud_bigquery_dataexchange_common_common_proto google_cloud_bigquery_dataexchange_v1beta1_dataexchange_proto google_cloud_bigquery_datatransfer_v1_datatransfer_proto google_cloud_bigquery_logging_v1_logging_proto google_cloud_bigquery_migration_v2_migration_proto google_cloud_bigquery_reservation_v1_reservation_proto google_cloud_bigquery_storage_v1_storage_proto google_cloud_bigquery_storage_v1beta1_storage_proto google_cloud_bigquery_storage_v1beta2_storage_proto google_cloud_bigquery_v2_bigquery_proto google_cloud_billing_budgets_v1_budgets_proto google_cloud_billing_v1_billing_proto google_cloud_binaryauthorization_v1_binaryauthorization_proto google_cloud_certificatemanager_v1_certificatemanager_proto google_cloud_clouddms_logging_v1_logging_proto google_cloud_clouddms_v1_clouddms_proto google_cloud_common_common_proto google_cloud_contactcenterinsights_v1_contactcenterinsights_proto google_cloud_datacatalog_v1_datacatalog_proto google_cloud_dataform_v1alpha2_dataform_proto google_cloud_datafusion_v1_datafusion_proto google_cloud_dataplex_v1_dataplex_proto google_cloud_dataproc_logging_logging_proto google_cloud_dataproc_v1_dataproc_proto google_cloud_datastream_v1_datastream_proto google_cloud_deploy_v1_deploy_proto google_cloud_dialogflow_cx_v3_cx_proto google_cloud_dialogflow_cx_v3beta1_cx_proto google_cloud_dialogflow_v2_dialogflow_proto google_cloud_dialogflow_v2beta1_dialogflow_proto google_cloud_documentai_v1_documentai_proto google_cloud_domains_v1_domains_proto google_cloud_essentialcontacts_v1_essentialcontacts_proto google_cloud_eventarc_publishing_v1_publishing_proto google_cloud_eventarc_v1_eventarc_proto google_cloud_extended_operations_proto google_cloud_filestore_v1_filestore_proto google_cloud_functions_v1_functions_proto google_cloud_gaming_v1_gaming_proto google_cloud_gkebackup_logging_v1_logging_proto google_cloud_gkebackup_v1_gkebackup_proto google_cloud_gkeconnect_gateway_v1_gateway_proto google_cloud_gkehub_v1_configmanagement_configmanagement_proto google_cloud_gkehub_v1_gkehub_proto google_cloud_gkehub_v1_multiclusteringress_multiclusteringress_proto google_cloud_gkehub_v1alpha2_gkehub_proto google_cloud_gkehub_v1beta1_gkehub_proto google_cloud_gkemulticloud_v1_gkemulticloud_proto google_cloud_gsuiteaddons_logging_v1_logging_proto google_cloud_gsuiteaddons_v1_gsuiteaddons_proto google_cloud_iap_v1_iap_proto google_cloud_identitytoolkit_v2_identitytoolkit_proto google_cloud_ids_v1_ids_proto google_cloud_iot_v1_iot_proto google_cloud_kms_v1_kms_proto google_cloud_language_v1_language_proto google_cloud_location_location_proto google_cloud_managedidentities_v1_managedidentities_proto google_cloud_managedidentities_v1beta1_managedidentities_proto google_cloud_memcache_v1_memcache_proto google_cloud_metastore_logging_v1_logging_proto google_cloud_metastore_v1_metastore_proto google_cloud_metastore_v1alpha_metastore_proto google_cloud_networkconnectivity_v1_networkconnectivity_proto google_cloud_networkmanagement_v1_networkmanagement_proto google_cloud_networkservices_v1_networkservices_proto google_cloud_networkservices_v1beta1_networkservices_proto google_cloud_notebooks_logging_v1_logging_proto google_cloud_notebooks_v1_notebooks_proto google_cloud_optimization_v1_optimization_proto google_cloud_orchestration_airflow_service_v1_service_proto google_cloud_orgpolicy_v1_orgpolicy_proto google_cloud_orgpolicy_v2_orgpolicy_proto google_cloud_osconfig_agentendpoint_v1_agentendpoint_proto google_cloud_osconfig_agentendpoint_v1beta_agentendpoint_proto google_cloud_osconfig_v1_osconfig_proto google_cloud_osconfig_v1alpha_osconfig_proto google_cloud_osconfig_v1beta_osconfig_proto google_cloud_oslogin_common_common_proto google_cloud_oslogin_v1_oslogin_proto google_cloud_policytroubleshooter_v1_policytroubleshooter_proto google_cloud_pubsublite_v1_pubsublite_proto google_cloud_recaptchaenterprise_v1_recaptchaenterprise_proto google_cloud_recommender_logging_v1_logging_proto google_cloud_recommender_v1_recommender_proto google_cloud_recommender_v1beta1_recommender_proto google_cloud_redis_v1_redis_proto google_cloud_redis_v1beta1_redis_proto google_cloud_resourcemanager_v2_resourcemanager_proto google_cloud_resourcemanager_v3_resourcemanager_proto google_cloud_resourcesettings_v1_resourcesettings_proto google_cloud_retail_v2_retail_proto google_cloud_retail_v2alpha_retail_proto google_cloud_retail_v2beta_retail_proto google_cloud_run_v2_run_proto google_cloud_saasaccelerator_management_logs_v1_logs_proto google_cloud_scheduler_v1_scheduler_proto google_cloud_secretmanager_logging_v1_logging_proto google_cloud_secretmanager_v1_secretmanager_proto google_cloud_security_privateca_v1_privateca_proto google_cloud_security_publicca_v1beta1_publicca_proto google_cloud_securitycenter_v1_securitycenter_proto google_cloud_servicedirectory_v1_servicedirectory_proto google_cloud_shell_v1_shell_proto google_cloud_speech_v1_speech_proto google_cloud_sql_v1_sql_proto google_cloud_sql_v1beta4_sql_proto google_cloud_talent_v4_talent_proto google_cloud_tasks_v2_tasks_proto google_cloud_texttospeech_v1_texttospeech_proto google_cloud_tpu_v1_tpu_proto google_cloud_translate_v3_translation_proto google_cloud_video_livestream_logging_v1_logging_proto google_cloud_video_livestream_v1_livestream_proto google_cloud_video_stitcher_v1_stitcher_proto google_cloud_video_transcoder_v1_transcoder_proto google_cloud_videointelligence_v1_videointelligence_proto google_cloud_vision_v1_vision_proto google_cloud_vmmigration_v1_vmmigration_proto google_cloud_vpcaccess_v1_vpcaccess_proto google_cloud_webrisk_v1_webrisk_proto google_cloud_websecurityscanner_v1_websecurityscanner_proto google_cloud_workflows_executions_v1_executions_proto google_cloud_workflows_type_type_proto google_cloud_workflows_v1_workflows_proto google_container_v1_container_proto google_container_v1alpha1_container_proto google_container_v1beta1_container_proto google_dataflow_v1beta3_dataflow_proto google_datastore_admin_v1_admin_proto google_datastore_v1_datastore_proto google_devtools_artifactregistry_v1_artifactregistry_proto google_devtools_build_v1_build_proto google_devtools_cloudbuild_v1_cloudbuild_proto google_devtools_clouddebugger_v2_clouddebugger_proto google_devtools_cloudprofiler_v2_cloudprofiler_proto google_devtools_cloudtrace_v1_cloudtrace_proto google_devtools_cloudtrace_v2_cloudtrace_proto google_devtools_containeranalysis_v1_containeranalysis_proto google_devtools_resultstore_v2_resultstore_proto google_devtools_source_v1_source_proto google_devtools_testing_v1_testing_proto google_example_library_v1_library_proto google_firestore_admin_v1_admin_proto google_firestore_bundle_firestore_bundle_proto google_firestore_v1_firestore_proto google_geo_type_viewport_proto google_iam_admin_v1_admin_proto google_iam_credentials_v1_credentials_proto google_iam_v1_iam_policy_proto google_iam_v1_logging_audit_data_proto google_iam_v1_options_proto google_iam_v1_policy_proto google_iam_v2beta_iam_proto google_identity_accesscontextmanager_type_type_proto google_identity_accesscontextmanager_v1_accesscontextmanager_proto google_logging_type_type_proto google_logging_v2_logging_proto google_longrunning_operations_proto google_maps_roads_v1op_roads_proto google_maps_routes_v1_routes_proto google_monitoring_dashboard_v1_dashboard_proto google_monitoring_metricsscope_v1_metricsscope_proto google_monitoring_v3_monitoring_proto google_networking_trafficdirector_type_type_proto google_partner_aistreams_v1alpha1_aistreams_proto google_privacy_dlp_v2_dlp_proto google_pubsub_v1_pubsub_proto google_rpc_code_proto google_rpc_context_attribute_context_proto google_rpc_error_details_proto google_rpc_status_proto google_spanner_admin_database_v1_database_proto google_spanner_admin_instance_v1_instance_proto google_spanner_v1_spanner_proto google_storage_v1_storage_proto google_storage_v2_storage_proto google_storagetransfer_v1_storagetransfer_proto google_streetview_publish_v1_publish_proto google_type_calendar_period_proto google_type_color_proto google_type_date_proto google_type_datetime_proto google_type_dayofweek_proto google_type_decimal_proto google_type_expr_proto google_type_fraction_proto google_type_interval_proto google_type_latlng_proto google_type_money_proto google_type_month_proto google_type_phone_number_proto google_type_postal_address_proto google_type_quaternion_proto google_type_timeofday_proto grafeas_v1_grafeas_proto)
set(CONAN_PKG_LIBS_GOOGLEAPIS google_actions_type_date_range_proto google_actions_type_datetime_range_proto google_analytics_data_v1alpha_data_proto google_api_annotations_proto google_api_auth_proto google_api_backend_proto google_api_billing_proto google_api_client_proto google_api_config_change_proto google_api_consumer_proto google_api_context_proto google_api_control_proto google_api_distribution_proto google_api_documentation_proto google_api_endpoint_proto google_api_expr_conformance_v1alpha1_conformance_proto google_api_expr_v1alpha1_checked_proto google_api_expr_v1alpha1_eval_proto google_api_expr_v1alpha1_explain_proto google_api_expr_v1alpha1_syntax_proto google_api_expr_v1alpha1_value_proto google_api_expr_v1beta1_decl_proto google_api_expr_v1beta1_eval_proto google_api_expr_v1beta1_expr_proto google_api_expr_v1beta1_source_proto google_api_expr_v1beta1_value_proto google_api_field_behavior_proto google_api_http_proto google_api_httpbody_proto google_api_label_proto google_api_launch_stage_proto google_api_log_proto google_api_logging_proto google_api_metric_proto google_api_monitored_resource_proto google_api_monitoring_proto google_api_quota_proto google_api_resource_proto google_api_routing_proto google_api_service_proto google_api_servicecontrol_v1_servicecontrol_proto google_api_servicecontrol_v2_servicecontrol_proto google_api_servicemanagement_v1_servicemanagement_proto google_api_serviceusage_v1_serviceusage_proto google_api_source_info_proto google_api_system_parameter_proto google_api_usage_proto google_api_visibility_proto google_appengine_legacy_legacy_proto google_appengine_logging_v1_logging_proto google_appengine_v1_appengine_proto google_apps_script_type_calendar_calendar_proto google_apps_script_type_docs_docs_proto google_apps_script_type_drive_drive_proto google_apps_script_type_gmail_gmail_proto google_apps_script_type_sheets_sheets_proto google_apps_script_type_slides_slides_proto google_apps_script_type_type_proto google_bigtable_admin_v2_admin_proto google_bigtable_v2_bigtable_proto google_chat_logging_v1_logging_proto google_chromeos_uidetection_v1_uidetection_proto google_cloud_accessapproval_v1_accessapproval_proto google_cloud_aiplatform_logging_logging_proto google_cloud_aiplatform_v1_aiplatform_proto google_cloud_aiplatform_v1_schema_predict_instance_instance_proto google_cloud_aiplatform_v1_schema_predict_params_params_proto google_cloud_aiplatform_v1_schema_predict_prediction_prediction_proto google_cloud_aiplatform_v1_schema_trainingjob_definition_definition_proto google_cloud_apigateway_v1_apigateway_proto google_cloud_apigeeconnect_v1_apigeeconnect_proto google_cloud_apigeeregistry_v1_apigeeregistry_proto google_cloud_asset_v1_asset_proto google_cloud_assuredworkloads_regulatoryintercept_logging_v1_logging_proto google_cloud_assuredworkloads_v1_assuredworkloads_proto google_cloud_assuredworkloads_v1beta1_assuredworkloads_proto google_cloud_audit_audit_proto google_cloud_automl_v1_automl_proto google_cloud_baremetalsolution_v2_baremetalsolution_proto google_cloud_batch_v1alpha1_batch_proto google_cloud_bigquery_connection_v1_connection_proto google_cloud_bigquery_dataexchange_common_common_proto google_cloud_bigquery_dataexchange_v1beta1_dataexchange_proto google_cloud_bigquery_datatransfer_v1_datatransfer_proto google_cloud_bigquery_logging_v1_logging_proto google_cloud_bigquery_migration_v2_migration_proto google_cloud_bigquery_reservation_v1_reservation_proto google_cloud_bigquery_storage_v1_storage_proto google_cloud_bigquery_storage_v1beta1_storage_proto google_cloud_bigquery_storage_v1beta2_storage_proto google_cloud_bigquery_v2_bigquery_proto google_cloud_billing_budgets_v1_budgets_proto google_cloud_billing_v1_billing_proto google_cloud_binaryauthorization_v1_binaryauthorization_proto google_cloud_certificatemanager_v1_certificatemanager_proto google_cloud_clouddms_logging_v1_logging_proto google_cloud_clouddms_v1_clouddms_proto google_cloud_common_common_proto google_cloud_contactcenterinsights_v1_contactcenterinsights_proto google_cloud_datacatalog_v1_datacatalog_proto google_cloud_dataform_v1alpha2_dataform_proto google_cloud_datafusion_v1_datafusion_proto google_cloud_dataplex_v1_dataplex_proto google_cloud_dataproc_logging_logging_proto google_cloud_dataproc_v1_dataproc_proto google_cloud_datastream_v1_datastream_proto google_cloud_deploy_v1_deploy_proto google_cloud_dialogflow_cx_v3_cx_proto google_cloud_dialogflow_cx_v3beta1_cx_proto google_cloud_dialogflow_v2_dialogflow_proto google_cloud_dialogflow_v2beta1_dialogflow_proto google_cloud_documentai_v1_documentai_proto google_cloud_domains_v1_domains_proto google_cloud_essentialcontacts_v1_essentialcontacts_proto google_cloud_eventarc_publishing_v1_publishing_proto google_cloud_eventarc_v1_eventarc_proto google_cloud_extended_operations_proto google_cloud_filestore_v1_filestore_proto google_cloud_functions_v1_functions_proto google_cloud_gaming_v1_gaming_proto google_cloud_gkebackup_logging_v1_logging_proto google_cloud_gkebackup_v1_gkebackup_proto google_cloud_gkeconnect_gateway_v1_gateway_proto google_cloud_gkehub_v1_configmanagement_configmanagement_proto google_cloud_gkehub_v1_gkehub_proto google_cloud_gkehub_v1_multiclusteringress_multiclusteringress_proto google_cloud_gkehub_v1alpha2_gkehub_proto google_cloud_gkehub_v1beta1_gkehub_proto google_cloud_gkemulticloud_v1_gkemulticloud_proto google_cloud_gsuiteaddons_logging_v1_logging_proto google_cloud_gsuiteaddons_v1_gsuiteaddons_proto google_cloud_iap_v1_iap_proto google_cloud_identitytoolkit_v2_identitytoolkit_proto google_cloud_ids_v1_ids_proto google_cloud_iot_v1_iot_proto google_cloud_kms_v1_kms_proto google_cloud_language_v1_language_proto google_cloud_location_location_proto google_cloud_managedidentities_v1_managedidentities_proto google_cloud_managedidentities_v1beta1_managedidentities_proto google_cloud_memcache_v1_memcache_proto google_cloud_metastore_logging_v1_logging_proto google_cloud_metastore_v1_metastore_proto google_cloud_metastore_v1alpha_metastore_proto google_cloud_networkconnectivity_v1_networkconnectivity_proto google_cloud_networkmanagement_v1_networkmanagement_proto google_cloud_networkservices_v1_networkservices_proto google_cloud_networkservices_v1beta1_networkservices_proto google_cloud_notebooks_logging_v1_logging_proto google_cloud_notebooks_v1_notebooks_proto google_cloud_optimization_v1_optimization_proto google_cloud_orchestration_airflow_service_v1_service_proto google_cloud_orgpolicy_v1_orgpolicy_proto google_cloud_orgpolicy_v2_orgpolicy_proto google_cloud_osconfig_agentendpoint_v1_agentendpoint_proto google_cloud_osconfig_agentendpoint_v1beta_agentendpoint_proto google_cloud_osconfig_v1_osconfig_proto google_cloud_osconfig_v1alpha_osconfig_proto google_cloud_osconfig_v1beta_osconfig_proto google_cloud_oslogin_common_common_proto google_cloud_oslogin_v1_oslogin_proto google_cloud_policytroubleshooter_v1_policytroubleshooter_proto google_cloud_pubsublite_v1_pubsublite_proto google_cloud_recaptchaenterprise_v1_recaptchaenterprise_proto google_cloud_recommender_logging_v1_logging_proto google_cloud_recommender_v1_recommender_proto google_cloud_recommender_v1beta1_recommender_proto google_cloud_redis_v1_redis_proto google_cloud_redis_v1beta1_redis_proto google_cloud_resourcemanager_v2_resourcemanager_proto google_cloud_resourcemanager_v3_resourcemanager_proto google_cloud_resourcesettings_v1_resourcesettings_proto google_cloud_retail_v2_retail_proto google_cloud_retail_v2alpha_retail_proto google_cloud_retail_v2beta_retail_proto google_cloud_run_v2_run_proto google_cloud_saasaccelerator_management_logs_v1_logs_proto google_cloud_scheduler_v1_scheduler_proto google_cloud_secretmanager_logging_v1_logging_proto google_cloud_secretmanager_v1_secretmanager_proto google_cloud_security_privateca_v1_privateca_proto google_cloud_security_publicca_v1beta1_publicca_proto google_cloud_securitycenter_v1_securitycenter_proto google_cloud_servicedirectory_v1_servicedirectory_proto google_cloud_shell_v1_shell_proto google_cloud_speech_v1_speech_proto google_cloud_sql_v1_sql_proto google_cloud_sql_v1beta4_sql_proto google_cloud_talent_v4_talent_proto google_cloud_tasks_v2_tasks_proto google_cloud_texttospeech_v1_texttospeech_proto google_cloud_tpu_v1_tpu_proto google_cloud_translate_v3_translation_proto google_cloud_video_livestream_logging_v1_logging_proto google_cloud_video_livestream_v1_livestream_proto google_cloud_video_stitcher_v1_stitcher_proto google_cloud_video_transcoder_v1_transcoder_proto google_cloud_videointelligence_v1_videointelligence_proto google_cloud_vision_v1_vision_proto google_cloud_vmmigration_v1_vmmigration_proto google_cloud_vpcaccess_v1_vpcaccess_proto google_cloud_webrisk_v1_webrisk_proto google_cloud_websecurityscanner_v1_websecurityscanner_proto google_cloud_workflows_executions_v1_executions_proto google_cloud_workflows_type_type_proto google_cloud_workflows_v1_workflows_proto google_container_v1_container_proto google_container_v1alpha1_container_proto google_container_v1beta1_container_proto google_dataflow_v1beta3_dataflow_proto google_datastore_admin_v1_admin_proto google_datastore_v1_datastore_proto google_devtools_artifactregistry_v1_artifactregistry_proto google_devtools_build_v1_build_proto google_devtools_cloudbuild_v1_cloudbuild_proto google_devtools_clouddebugger_v2_clouddebugger_proto google_devtools_cloudprofiler_v2_cloudprofiler_proto google_devtools_cloudtrace_v1_cloudtrace_proto google_devtools_cloudtrace_v2_cloudtrace_proto google_devtools_containeranalysis_v1_containeranalysis_proto google_devtools_resultstore_v2_resultstore_proto google_devtools_source_v1_source_proto google_devtools_testing_v1_testing_proto google_example_library_v1_library_proto google_firestore_admin_v1_admin_proto google_firestore_bundle_firestore_bundle_proto google_firestore_v1_firestore_proto google_geo_type_viewport_proto google_iam_admin_v1_admin_proto google_iam_credentials_v1_credentials_proto google_iam_v1_iam_policy_proto google_iam_v1_logging_audit_data_proto google_iam_v1_options_proto google_iam_v1_policy_proto google_iam_v2beta_iam_proto google_identity_accesscontextmanager_type_type_proto google_identity_accesscontextmanager_v1_accesscontextmanager_proto google_logging_type_type_proto google_logging_v2_logging_proto google_longrunning_operations_proto google_maps_roads_v1op_roads_proto google_maps_routes_v1_routes_proto google_monitoring_dashboard_v1_dashboard_proto google_monitoring_metricsscope_v1_metricsscope_proto google_monitoring_v3_monitoring_proto google_networking_trafficdirector_type_type_proto google_partner_aistreams_v1alpha1_aistreams_proto google_privacy_dlp_v2_dlp_proto google_pubsub_v1_pubsub_proto google_rpc_code_proto google_rpc_context_attribute_context_proto google_rpc_error_details_proto google_rpc_status_proto google_spanner_admin_database_v1_database_proto google_spanner_admin_instance_v1_instance_proto google_spanner_v1_spanner_proto google_storage_v1_storage_proto google_storage_v2_storage_proto google_storagetransfer_v1_storagetransfer_proto google_streetview_publish_v1_publish_proto google_type_calendar_period_proto google_type_color_proto google_type_date_proto google_type_datetime_proto google_type_dayofweek_proto google_type_decimal_proto google_type_expr_proto google_type_fraction_proto google_type_interval_proto google_type_latlng_proto google_type_money_proto google_type_month_proto google_type_phone_number_proto google_type_postal_address_proto google_type_quaternion_proto google_type_timeofday_proto grafeas_v1_grafeas_proto)
set(CONAN_SYSTEM_LIBS_GOOGLEAPIS )
set(CONAN_FRAMEWORKS_GOOGLEAPIS )
set(CONAN_FRAMEWORKS_FOUND_GOOGLEAPIS "")  # Will be filled later
set(CONAN_DEFINES_GOOGLEAPIS )
set(CONAN_BUILD_MODULES_PATHS_GOOGLEAPIS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GOOGLEAPIS )

set(CONAN_C_FLAGS_GOOGLEAPIS "")
set(CONAN_CXX_FLAGS_GOOGLEAPIS "")
set(CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS "")
set(CONAN_EXE_LINKER_FLAGS_GOOGLEAPIS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GOOGLEAPIS_LIST "")
set(CONAN_CXX_FLAGS_GOOGLEAPIS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GOOGLEAPIS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GOOGLEAPIS "${CONAN_FRAMEWORKS_GOOGLEAPIS}" "_GOOGLEAPIS" "")
# Append to aggregated values variable
set(CONAN_LIBS_GOOGLEAPIS ${CONAN_PKG_LIBS_GOOGLEAPIS} ${CONAN_SYSTEM_LIBS_GOOGLEAPIS} ${CONAN_FRAMEWORKS_FOUND_GOOGLEAPIS})


#################
###  PROTOBUF
#################
set(CONAN_PROTOBUF_ROOT "C:/.conan/b5cc45/1")
set(CONAN_INCLUDE_DIRS_PROTOBUF "C:/.conan/b5cc45/1/include")
set(CONAN_LIB_DIRS_PROTOBUF "C:/.conan/b5cc45/1/lib")
set(CONAN_BIN_DIRS_PROTOBUF "C:/.conan/b5cc45/1/bin")
set(CONAN_RES_DIRS_PROTOBUF )
set(CONAN_SRC_DIRS_PROTOBUF )
set(CONAN_BUILD_DIRS_PROTOBUF "C:/.conan/b5cc45/1/"
			"C:/.conan/b5cc45/1/lib/cmake/protobuf")
set(CONAN_FRAMEWORK_DIRS_PROTOBUF )
set(CONAN_LIBS_PROTOBUF libprotoc libprotobuf)
set(CONAN_PKG_LIBS_PROTOBUF libprotoc libprotobuf)
set(CONAN_SYSTEM_LIBS_PROTOBUF )
set(CONAN_FRAMEWORKS_PROTOBUF )
set(CONAN_FRAMEWORKS_FOUND_PROTOBUF "")  # Will be filled later
set(CONAN_DEFINES_PROTOBUF )
set(CONAN_BUILD_MODULES_PATHS_PROTOBUF "C:/.conan/b5cc45/1/lib/cmake/protobuf/protobuf-generate.cmake"
			"C:/.conan/b5cc45/1/lib/cmake/protobuf/protobuf-module.cmake"
			"C:/.conan/b5cc45/1/lib/cmake/protobuf/protobuf-options.cmake")
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PROTOBUF )

set(CONAN_C_FLAGS_PROTOBUF "")
set(CONAN_CXX_FLAGS_PROTOBUF "")
set(CONAN_SHARED_LINKER_FLAGS_PROTOBUF "")
set(CONAN_EXE_LINKER_FLAGS_PROTOBUF "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PROTOBUF_LIST "")
set(CONAN_CXX_FLAGS_PROTOBUF_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PROTOBUF_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PROTOBUF_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PROTOBUF "${CONAN_FRAMEWORKS_PROTOBUF}" "_PROTOBUF" "")
# Append to aggregated values variable
set(CONAN_LIBS_PROTOBUF ${CONAN_PKG_LIBS_PROTOBUF} ${CONAN_SYSTEM_LIBS_PROTOBUF} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF})


#################
###  ZLIB
#################
set(CONAN_ZLIB_ROOT "C:/Users/Awu/.conan/data/zlib/1.2.12/_/_/package/70711aff723b218b02483e600038031bf91007bc")
set(CONAN_INCLUDE_DIRS_ZLIB "C:/Users/Awu/.conan/data/zlib/1.2.12/_/_/package/70711aff723b218b02483e600038031bf91007bc/include")
set(CONAN_LIB_DIRS_ZLIB "C:/Users/Awu/.conan/data/zlib/1.2.12/_/_/package/70711aff723b218b02483e600038031bf91007bc/lib")
set(CONAN_BIN_DIRS_ZLIB )
set(CONAN_RES_DIRS_ZLIB )
set(CONAN_SRC_DIRS_ZLIB )
set(CONAN_BUILD_DIRS_ZLIB "C:/Users/Awu/.conan/data/zlib/1.2.12/_/_/package/70711aff723b218b02483e600038031bf91007bc/")
set(CONAN_FRAMEWORK_DIRS_ZLIB )
set(CONAN_LIBS_ZLIB zlib)
set(CONAN_PKG_LIBS_ZLIB zlib)
set(CONAN_SYSTEM_LIBS_ZLIB )
set(CONAN_FRAMEWORKS_ZLIB )
set(CONAN_FRAMEWORKS_FOUND_ZLIB "")  # Will be filled later
set(CONAN_DEFINES_ZLIB )
set(CONAN_BUILD_MODULES_PATHS_ZLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZLIB )

set(CONAN_C_FLAGS_ZLIB "")
set(CONAN_CXX_FLAGS_ZLIB "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZLIB_LIST "")
set(CONAN_CXX_FLAGS_ZLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZLIB "${CONAN_FRAMEWORKS_ZLIB}" "_ZLIB" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZLIB ${CONAN_PKG_LIBS_ZLIB} ${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME None)
set(CONAN_PACKAGE_VERSION None)

set(CONAN_SETTINGS_ARCH "x86")
set(CONAN_SETTINGS_BUILD_TYPE "Release")
set(CONAN_SETTINGS_COMPILER "Visual Studio")
set(CONAN_SETTINGS_COMPILER_RUNTIME "MD")
set(CONAN_SETTINGS_COMPILER_VERSION "17")
set(CONAN_SETTINGS_OS "Windows")

set(CONAN_DEPENDENCIES grpc ninja gtest abseil c-ares openssl re2 grpc-proto googleapis protobuf zlib)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "C:/.conan/6de739/1/include"
			"C:/Users/Awu/.conan/data/gtest/cci.20210126/_/_/package/68a060fdd97b62cfc15d770518cafb06fe311849/include"
			"C:/.conan/39e0389/1/include"
			"C:/Users/Awu/.conan/data/c-ares/1.18.1/_/_/package/104d04e27d80f90ee826c18d63336299ffadd9c8/include"
			"C:/Users/Awu/.conan/data/openssl/1.1.1o/_/_/package/70711aff723b218b02483e600038031bf91007bc/include"
			"C:/Users/Awu/.conan/data/re2/20220201/_/_/package/70711aff723b218b02483e600038031bf91007bc/include"
			"C:/Users/Awu/.conan/data/grpc-proto/cci.20220627/_/_/package/ad53281cef49d392d3f3253e30d23b67500c80c6/include"
			"C:/.conan/3cc72e8/1/include"
			"C:/.conan/b5cc45/1/include"
			"C:/Users/Awu/.conan/data/zlib/1.2.12/_/_/package/70711aff723b218b02483e600038031bf91007bc/include" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "C:/.conan/6de739/1/lib"
			"C:/Users/Awu/.conan/data/gtest/cci.20210126/_/_/package/68a060fdd97b62cfc15d770518cafb06fe311849/lib"
			"C:/.conan/39e0389/1/lib"
			"C:/Users/Awu/.conan/data/c-ares/1.18.1/_/_/package/104d04e27d80f90ee826c18d63336299ffadd9c8/lib"
			"C:/Users/Awu/.conan/data/openssl/1.1.1o/_/_/package/70711aff723b218b02483e600038031bf91007bc/lib"
			"C:/Users/Awu/.conan/data/re2/20220201/_/_/package/70711aff723b218b02483e600038031bf91007bc/lib"
			"C:/Users/Awu/.conan/data/grpc-proto/cci.20220627/_/_/package/ad53281cef49d392d3f3253e30d23b67500c80c6/lib"
			"C:/.conan/3cc72e8/1/lib"
			"C:/.conan/b5cc45/1/lib"
			"C:/Users/Awu/.conan/data/zlib/1.2.12/_/_/package/70711aff723b218b02483e600038031bf91007bc/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "C:/.conan/6de739/1/bin"
			"C:/Users/Awu/.conan/data/ninja/1.11.0/_/_/package/63c5d5dc6eb958dab897e143053e17f583d55879/bin"
			"C:/Users/Awu/.conan/data/c-ares/1.18.1/_/_/package/104d04e27d80f90ee826c18d63336299ffadd9c8/bin"
			"C:/Users/Awu/.conan/data/openssl/1.1.1o/_/_/package/70711aff723b218b02483e600038031bf91007bc/bin"
			"C:/.conan/b5cc45/1/bin" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS "C:/.conan/6de739/1/res"
			"C:/Users/Awu/.conan/data/grpc-proto/cci.20220627/_/_/package/ad53281cef49d392d3f3253e30d23b67500c80c6/res"
			"C:/.conan/3cc72e8/1/res" ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS grpc++_alts grpc++_error_details grpc_plugin_support grpc++_unsecure grpc_unsecure grpc++_reflection grpcpp_channelz grpc++ grpc address_sorting gpr upb gtest_main gmock_main gmock gtest absl_scoped_set_env absl_strerror absl_failure_signal_handler absl_examine_stack absl_leak_check_disable absl_leak_check absl_flags_parse absl_flags_usage absl_flags_usage_internal absl_flags absl_flags_reflection absl_raw_hash_set absl_hashtablez_sampler absl_flags_private_handle_accessor absl_flags_internal absl_flags_config absl_flags_program_name absl_flags_marshalling absl_flags_commandlineflag absl_flags_commandlineflag_internal absl_hash absl_city absl_low_level_hash absl_periodic_sampler absl_random_distributions absl_random_seed_sequences absl_random_internal_pool_urbg absl_random_seed_gen_exception absl_random_internal_seed_material absl_random_internal_randen absl_random_internal_randen_slow absl_random_internal_randen_hwaes absl_random_internal_randen_hwaes_impl absl_random_internal_platform absl_random_internal_distribution_test_util absl_statusor absl_status absl_str_format_internal absl_cordz_sample_token absl_cord absl_cordz_info absl_cord_internal absl_cordz_functions absl_exponential_biased absl_cordz_handle absl_synchronization absl_stacktrace absl_symbolize absl_debugging_internal absl_demangle_internal absl_graphcycles_internal absl_malloc_internal absl_time absl_strings absl_int128 absl_strings_internal absl_base absl_spinlock_wait absl_civil_time absl_time_zone absl_bad_any_cast_impl absl_throw_delegate absl_bad_optional_access absl_bad_variant_access absl_raw_logging_internal absl_log_severity cares libssl libcrypto re2 grpc_alts_handshaker_proto grpc_benchmark_service_proto grpc_binarylog_proto grpc_channelz_proto grpc_control_proto grpc_grpclb_load_balancer_proto grpc_grpclb_load_reporter_proto grpc_health_proto grpc_messages_proto grpc_reflection_proto grpc_reflection_proto_deprecated grpc_report_qps_scenario_service_proto grpc_rls_config_proto grpc_rls_proto grpc_service_config_proto grpc_stats_proto grpc_worker_service_proto google_actions_type_date_range_proto google_actions_type_datetime_range_proto google_analytics_data_v1alpha_data_proto google_api_annotations_proto google_api_auth_proto google_api_backend_proto google_api_billing_proto google_api_client_proto google_api_config_change_proto google_api_consumer_proto google_api_context_proto google_api_control_proto google_api_distribution_proto google_api_documentation_proto google_api_endpoint_proto google_api_expr_conformance_v1alpha1_conformance_proto google_api_expr_v1alpha1_checked_proto google_api_expr_v1alpha1_eval_proto google_api_expr_v1alpha1_explain_proto google_api_expr_v1alpha1_syntax_proto google_api_expr_v1alpha1_value_proto google_api_expr_v1beta1_decl_proto google_api_expr_v1beta1_eval_proto google_api_expr_v1beta1_expr_proto google_api_expr_v1beta1_source_proto google_api_expr_v1beta1_value_proto google_api_field_behavior_proto google_api_http_proto google_api_httpbody_proto google_api_label_proto google_api_launch_stage_proto google_api_log_proto google_api_logging_proto google_api_metric_proto google_api_monitored_resource_proto google_api_monitoring_proto google_api_quota_proto google_api_resource_proto google_api_routing_proto google_api_service_proto google_api_servicecontrol_v1_servicecontrol_proto google_api_servicecontrol_v2_servicecontrol_proto google_api_servicemanagement_v1_servicemanagement_proto google_api_serviceusage_v1_serviceusage_proto google_api_source_info_proto google_api_system_parameter_proto google_api_usage_proto google_api_visibility_proto google_appengine_legacy_legacy_proto google_appengine_logging_v1_logging_proto google_appengine_v1_appengine_proto google_apps_script_type_calendar_calendar_proto google_apps_script_type_docs_docs_proto google_apps_script_type_drive_drive_proto google_apps_script_type_gmail_gmail_proto google_apps_script_type_sheets_sheets_proto google_apps_script_type_slides_slides_proto google_apps_script_type_type_proto google_bigtable_admin_v2_admin_proto google_bigtable_v2_bigtable_proto google_chat_logging_v1_logging_proto google_chromeos_uidetection_v1_uidetection_proto google_cloud_accessapproval_v1_accessapproval_proto google_cloud_aiplatform_logging_logging_proto google_cloud_aiplatform_v1_aiplatform_proto google_cloud_aiplatform_v1_schema_predict_instance_instance_proto google_cloud_aiplatform_v1_schema_predict_params_params_proto google_cloud_aiplatform_v1_schema_predict_prediction_prediction_proto google_cloud_aiplatform_v1_schema_trainingjob_definition_definition_proto google_cloud_apigateway_v1_apigateway_proto google_cloud_apigeeconnect_v1_apigeeconnect_proto google_cloud_apigeeregistry_v1_apigeeregistry_proto google_cloud_asset_v1_asset_proto google_cloud_assuredworkloads_regulatoryintercept_logging_v1_logging_proto google_cloud_assuredworkloads_v1_assuredworkloads_proto google_cloud_assuredworkloads_v1beta1_assuredworkloads_proto google_cloud_audit_audit_proto google_cloud_automl_v1_automl_proto google_cloud_baremetalsolution_v2_baremetalsolution_proto google_cloud_batch_v1alpha1_batch_proto google_cloud_bigquery_connection_v1_connection_proto google_cloud_bigquery_dataexchange_common_common_proto google_cloud_bigquery_dataexchange_v1beta1_dataexchange_proto google_cloud_bigquery_datatransfer_v1_datatransfer_proto google_cloud_bigquery_logging_v1_logging_proto google_cloud_bigquery_migration_v2_migration_proto google_cloud_bigquery_reservation_v1_reservation_proto google_cloud_bigquery_storage_v1_storage_proto google_cloud_bigquery_storage_v1beta1_storage_proto google_cloud_bigquery_storage_v1beta2_storage_proto google_cloud_bigquery_v2_bigquery_proto google_cloud_billing_budgets_v1_budgets_proto google_cloud_billing_v1_billing_proto google_cloud_binaryauthorization_v1_binaryauthorization_proto google_cloud_certificatemanager_v1_certificatemanager_proto google_cloud_clouddms_logging_v1_logging_proto google_cloud_clouddms_v1_clouddms_proto google_cloud_common_common_proto google_cloud_contactcenterinsights_v1_contactcenterinsights_proto google_cloud_datacatalog_v1_datacatalog_proto google_cloud_dataform_v1alpha2_dataform_proto google_cloud_datafusion_v1_datafusion_proto google_cloud_dataplex_v1_dataplex_proto google_cloud_dataproc_logging_logging_proto google_cloud_dataproc_v1_dataproc_proto google_cloud_datastream_v1_datastream_proto google_cloud_deploy_v1_deploy_proto google_cloud_dialogflow_cx_v3_cx_proto google_cloud_dialogflow_cx_v3beta1_cx_proto google_cloud_dialogflow_v2_dialogflow_proto google_cloud_dialogflow_v2beta1_dialogflow_proto google_cloud_documentai_v1_documentai_proto google_cloud_domains_v1_domains_proto google_cloud_essentialcontacts_v1_essentialcontacts_proto google_cloud_eventarc_publishing_v1_publishing_proto google_cloud_eventarc_v1_eventarc_proto google_cloud_extended_operations_proto google_cloud_filestore_v1_filestore_proto google_cloud_functions_v1_functions_proto google_cloud_gaming_v1_gaming_proto google_cloud_gkebackup_logging_v1_logging_proto google_cloud_gkebackup_v1_gkebackup_proto google_cloud_gkeconnect_gateway_v1_gateway_proto google_cloud_gkehub_v1_configmanagement_configmanagement_proto google_cloud_gkehub_v1_gkehub_proto google_cloud_gkehub_v1_multiclusteringress_multiclusteringress_proto google_cloud_gkehub_v1alpha2_gkehub_proto google_cloud_gkehub_v1beta1_gkehub_proto google_cloud_gkemulticloud_v1_gkemulticloud_proto google_cloud_gsuiteaddons_logging_v1_logging_proto google_cloud_gsuiteaddons_v1_gsuiteaddons_proto google_cloud_iap_v1_iap_proto google_cloud_identitytoolkit_v2_identitytoolkit_proto google_cloud_ids_v1_ids_proto google_cloud_iot_v1_iot_proto google_cloud_kms_v1_kms_proto google_cloud_language_v1_language_proto google_cloud_location_location_proto google_cloud_managedidentities_v1_managedidentities_proto google_cloud_managedidentities_v1beta1_managedidentities_proto google_cloud_memcache_v1_memcache_proto google_cloud_metastore_logging_v1_logging_proto google_cloud_metastore_v1_metastore_proto google_cloud_metastore_v1alpha_metastore_proto google_cloud_networkconnectivity_v1_networkconnectivity_proto google_cloud_networkmanagement_v1_networkmanagement_proto google_cloud_networkservices_v1_networkservices_proto google_cloud_networkservices_v1beta1_networkservices_proto google_cloud_notebooks_logging_v1_logging_proto google_cloud_notebooks_v1_notebooks_proto google_cloud_optimization_v1_optimization_proto google_cloud_orchestration_airflow_service_v1_service_proto google_cloud_orgpolicy_v1_orgpolicy_proto google_cloud_orgpolicy_v2_orgpolicy_proto google_cloud_osconfig_agentendpoint_v1_agentendpoint_proto google_cloud_osconfig_agentendpoint_v1beta_agentendpoint_proto google_cloud_osconfig_v1_osconfig_proto google_cloud_osconfig_v1alpha_osconfig_proto google_cloud_osconfig_v1beta_osconfig_proto google_cloud_oslogin_common_common_proto google_cloud_oslogin_v1_oslogin_proto google_cloud_policytroubleshooter_v1_policytroubleshooter_proto google_cloud_pubsublite_v1_pubsublite_proto google_cloud_recaptchaenterprise_v1_recaptchaenterprise_proto google_cloud_recommender_logging_v1_logging_proto google_cloud_recommender_v1_recommender_proto google_cloud_recommender_v1beta1_recommender_proto google_cloud_redis_v1_redis_proto google_cloud_redis_v1beta1_redis_proto google_cloud_resourcemanager_v2_resourcemanager_proto google_cloud_resourcemanager_v3_resourcemanager_proto google_cloud_resourcesettings_v1_resourcesettings_proto google_cloud_retail_v2_retail_proto google_cloud_retail_v2alpha_retail_proto google_cloud_retail_v2beta_retail_proto google_cloud_run_v2_run_proto google_cloud_saasaccelerator_management_logs_v1_logs_proto google_cloud_scheduler_v1_scheduler_proto google_cloud_secretmanager_logging_v1_logging_proto google_cloud_secretmanager_v1_secretmanager_proto google_cloud_security_privateca_v1_privateca_proto google_cloud_security_publicca_v1beta1_publicca_proto google_cloud_securitycenter_v1_securitycenter_proto google_cloud_servicedirectory_v1_servicedirectory_proto google_cloud_shell_v1_shell_proto google_cloud_speech_v1_speech_proto google_cloud_sql_v1_sql_proto google_cloud_sql_v1beta4_sql_proto google_cloud_talent_v4_talent_proto google_cloud_tasks_v2_tasks_proto google_cloud_texttospeech_v1_texttospeech_proto google_cloud_tpu_v1_tpu_proto google_cloud_translate_v3_translation_proto google_cloud_video_livestream_logging_v1_logging_proto google_cloud_video_livestream_v1_livestream_proto google_cloud_video_stitcher_v1_stitcher_proto google_cloud_video_transcoder_v1_transcoder_proto google_cloud_videointelligence_v1_videointelligence_proto google_cloud_vision_v1_vision_proto google_cloud_vmmigration_v1_vmmigration_proto google_cloud_vpcaccess_v1_vpcaccess_proto google_cloud_webrisk_v1_webrisk_proto google_cloud_websecurityscanner_v1_websecurityscanner_proto google_cloud_workflows_executions_v1_executions_proto google_cloud_workflows_type_type_proto google_cloud_workflows_v1_workflows_proto google_container_v1_container_proto google_container_v1alpha1_container_proto google_container_v1beta1_container_proto google_dataflow_v1beta3_dataflow_proto google_datastore_admin_v1_admin_proto google_datastore_v1_datastore_proto google_devtools_artifactregistry_v1_artifactregistry_proto google_devtools_build_v1_build_proto google_devtools_cloudbuild_v1_cloudbuild_proto google_devtools_clouddebugger_v2_clouddebugger_proto google_devtools_cloudprofiler_v2_cloudprofiler_proto google_devtools_cloudtrace_v1_cloudtrace_proto google_devtools_cloudtrace_v2_cloudtrace_proto google_devtools_containeranalysis_v1_containeranalysis_proto google_devtools_resultstore_v2_resultstore_proto google_devtools_source_v1_source_proto google_devtools_testing_v1_testing_proto google_example_library_v1_library_proto google_firestore_admin_v1_admin_proto google_firestore_bundle_firestore_bundle_proto google_firestore_v1_firestore_proto google_geo_type_viewport_proto google_iam_admin_v1_admin_proto google_iam_credentials_v1_credentials_proto google_iam_v1_iam_policy_proto google_iam_v1_logging_audit_data_proto google_iam_v1_options_proto google_iam_v1_policy_proto google_iam_v2beta_iam_proto google_identity_accesscontextmanager_type_type_proto google_identity_accesscontextmanager_v1_accesscontextmanager_proto google_logging_type_type_proto google_logging_v2_logging_proto google_longrunning_operations_proto google_maps_roads_v1op_roads_proto google_maps_routes_v1_routes_proto google_monitoring_dashboard_v1_dashboard_proto google_monitoring_metricsscope_v1_metricsscope_proto google_monitoring_v3_monitoring_proto google_networking_trafficdirector_type_type_proto google_partner_aistreams_v1alpha1_aistreams_proto google_privacy_dlp_v2_dlp_proto google_pubsub_v1_pubsub_proto google_rpc_code_proto google_rpc_context_attribute_context_proto google_rpc_error_details_proto google_rpc_status_proto google_spanner_admin_database_v1_database_proto google_spanner_admin_instance_v1_instance_proto google_spanner_v1_spanner_proto google_storage_v1_storage_proto google_storage_v2_storage_proto google_storagetransfer_v1_storagetransfer_proto google_streetview_publish_v1_publish_proto google_type_calendar_period_proto google_type_color_proto google_type_date_proto google_type_datetime_proto google_type_dayofweek_proto google_type_decimal_proto google_type_expr_proto google_type_fraction_proto google_type_interval_proto google_type_latlng_proto google_type_money_proto google_type_month_proto google_type_phone_number_proto google_type_postal_address_proto google_type_quaternion_proto google_type_timeofday_proto grafeas_v1_grafeas_proto libprotoc libprotobuf zlib ${CONAN_LIBS})
set(CONAN_PKG_LIBS grpc++_alts grpc++_error_details grpc_plugin_support grpc++_unsecure grpc_unsecure grpc++_reflection grpcpp_channelz grpc++ grpc address_sorting gpr upb gtest_main gmock_main gmock gtest absl_scoped_set_env absl_strerror absl_failure_signal_handler absl_examine_stack absl_leak_check_disable absl_leak_check absl_flags_parse absl_flags_usage absl_flags_usage_internal absl_flags absl_flags_reflection absl_raw_hash_set absl_hashtablez_sampler absl_flags_private_handle_accessor absl_flags_internal absl_flags_config absl_flags_program_name absl_flags_marshalling absl_flags_commandlineflag absl_flags_commandlineflag_internal absl_hash absl_city absl_low_level_hash absl_periodic_sampler absl_random_distributions absl_random_seed_sequences absl_random_internal_pool_urbg absl_random_seed_gen_exception absl_random_internal_seed_material absl_random_internal_randen absl_random_internal_randen_slow absl_random_internal_randen_hwaes absl_random_internal_randen_hwaes_impl absl_random_internal_platform absl_random_internal_distribution_test_util absl_statusor absl_status absl_str_format_internal absl_cordz_sample_token absl_cord absl_cordz_info absl_cord_internal absl_cordz_functions absl_exponential_biased absl_cordz_handle absl_synchronization absl_stacktrace absl_symbolize absl_debugging_internal absl_demangle_internal absl_graphcycles_internal absl_malloc_internal absl_time absl_strings absl_int128 absl_strings_internal absl_base absl_spinlock_wait absl_civil_time absl_time_zone absl_bad_any_cast_impl absl_throw_delegate absl_bad_optional_access absl_bad_variant_access absl_raw_logging_internal absl_log_severity cares libssl libcrypto re2 grpc_alts_handshaker_proto grpc_benchmark_service_proto grpc_binarylog_proto grpc_channelz_proto grpc_control_proto grpc_grpclb_load_balancer_proto grpc_grpclb_load_reporter_proto grpc_health_proto grpc_messages_proto grpc_reflection_proto grpc_reflection_proto_deprecated grpc_report_qps_scenario_service_proto grpc_rls_config_proto grpc_rls_proto grpc_service_config_proto grpc_stats_proto grpc_worker_service_proto google_actions_type_date_range_proto google_actions_type_datetime_range_proto google_analytics_data_v1alpha_data_proto google_api_annotations_proto google_api_auth_proto google_api_backend_proto google_api_billing_proto google_api_client_proto google_api_config_change_proto google_api_consumer_proto google_api_context_proto google_api_control_proto google_api_distribution_proto google_api_documentation_proto google_api_endpoint_proto google_api_expr_conformance_v1alpha1_conformance_proto google_api_expr_v1alpha1_checked_proto google_api_expr_v1alpha1_eval_proto google_api_expr_v1alpha1_explain_proto google_api_expr_v1alpha1_syntax_proto google_api_expr_v1alpha1_value_proto google_api_expr_v1beta1_decl_proto google_api_expr_v1beta1_eval_proto google_api_expr_v1beta1_expr_proto google_api_expr_v1beta1_source_proto google_api_expr_v1beta1_value_proto google_api_field_behavior_proto google_api_http_proto google_api_httpbody_proto google_api_label_proto google_api_launch_stage_proto google_api_log_proto google_api_logging_proto google_api_metric_proto google_api_monitored_resource_proto google_api_monitoring_proto google_api_quota_proto google_api_resource_proto google_api_routing_proto google_api_service_proto google_api_servicecontrol_v1_servicecontrol_proto google_api_servicecontrol_v2_servicecontrol_proto google_api_servicemanagement_v1_servicemanagement_proto google_api_serviceusage_v1_serviceusage_proto google_api_source_info_proto google_api_system_parameter_proto google_api_usage_proto google_api_visibility_proto google_appengine_legacy_legacy_proto google_appengine_logging_v1_logging_proto google_appengine_v1_appengine_proto google_apps_script_type_calendar_calendar_proto google_apps_script_type_docs_docs_proto google_apps_script_type_drive_drive_proto google_apps_script_type_gmail_gmail_proto google_apps_script_type_sheets_sheets_proto google_apps_script_type_slides_slides_proto google_apps_script_type_type_proto google_bigtable_admin_v2_admin_proto google_bigtable_v2_bigtable_proto google_chat_logging_v1_logging_proto google_chromeos_uidetection_v1_uidetection_proto google_cloud_accessapproval_v1_accessapproval_proto google_cloud_aiplatform_logging_logging_proto google_cloud_aiplatform_v1_aiplatform_proto google_cloud_aiplatform_v1_schema_predict_instance_instance_proto google_cloud_aiplatform_v1_schema_predict_params_params_proto google_cloud_aiplatform_v1_schema_predict_prediction_prediction_proto google_cloud_aiplatform_v1_schema_trainingjob_definition_definition_proto google_cloud_apigateway_v1_apigateway_proto google_cloud_apigeeconnect_v1_apigeeconnect_proto google_cloud_apigeeregistry_v1_apigeeregistry_proto google_cloud_asset_v1_asset_proto google_cloud_assuredworkloads_regulatoryintercept_logging_v1_logging_proto google_cloud_assuredworkloads_v1_assuredworkloads_proto google_cloud_assuredworkloads_v1beta1_assuredworkloads_proto google_cloud_audit_audit_proto google_cloud_automl_v1_automl_proto google_cloud_baremetalsolution_v2_baremetalsolution_proto google_cloud_batch_v1alpha1_batch_proto google_cloud_bigquery_connection_v1_connection_proto google_cloud_bigquery_dataexchange_common_common_proto google_cloud_bigquery_dataexchange_v1beta1_dataexchange_proto google_cloud_bigquery_datatransfer_v1_datatransfer_proto google_cloud_bigquery_logging_v1_logging_proto google_cloud_bigquery_migration_v2_migration_proto google_cloud_bigquery_reservation_v1_reservation_proto google_cloud_bigquery_storage_v1_storage_proto google_cloud_bigquery_storage_v1beta1_storage_proto google_cloud_bigquery_storage_v1beta2_storage_proto google_cloud_bigquery_v2_bigquery_proto google_cloud_billing_budgets_v1_budgets_proto google_cloud_billing_v1_billing_proto google_cloud_binaryauthorization_v1_binaryauthorization_proto google_cloud_certificatemanager_v1_certificatemanager_proto google_cloud_clouddms_logging_v1_logging_proto google_cloud_clouddms_v1_clouddms_proto google_cloud_common_common_proto google_cloud_contactcenterinsights_v1_contactcenterinsights_proto google_cloud_datacatalog_v1_datacatalog_proto google_cloud_dataform_v1alpha2_dataform_proto google_cloud_datafusion_v1_datafusion_proto google_cloud_dataplex_v1_dataplex_proto google_cloud_dataproc_logging_logging_proto google_cloud_dataproc_v1_dataproc_proto google_cloud_datastream_v1_datastream_proto google_cloud_deploy_v1_deploy_proto google_cloud_dialogflow_cx_v3_cx_proto google_cloud_dialogflow_cx_v3beta1_cx_proto google_cloud_dialogflow_v2_dialogflow_proto google_cloud_dialogflow_v2beta1_dialogflow_proto google_cloud_documentai_v1_documentai_proto google_cloud_domains_v1_domains_proto google_cloud_essentialcontacts_v1_essentialcontacts_proto google_cloud_eventarc_publishing_v1_publishing_proto google_cloud_eventarc_v1_eventarc_proto google_cloud_extended_operations_proto google_cloud_filestore_v1_filestore_proto google_cloud_functions_v1_functions_proto google_cloud_gaming_v1_gaming_proto google_cloud_gkebackup_logging_v1_logging_proto google_cloud_gkebackup_v1_gkebackup_proto google_cloud_gkeconnect_gateway_v1_gateway_proto google_cloud_gkehub_v1_configmanagement_configmanagement_proto google_cloud_gkehub_v1_gkehub_proto google_cloud_gkehub_v1_multiclusteringress_multiclusteringress_proto google_cloud_gkehub_v1alpha2_gkehub_proto google_cloud_gkehub_v1beta1_gkehub_proto google_cloud_gkemulticloud_v1_gkemulticloud_proto google_cloud_gsuiteaddons_logging_v1_logging_proto google_cloud_gsuiteaddons_v1_gsuiteaddons_proto google_cloud_iap_v1_iap_proto google_cloud_identitytoolkit_v2_identitytoolkit_proto google_cloud_ids_v1_ids_proto google_cloud_iot_v1_iot_proto google_cloud_kms_v1_kms_proto google_cloud_language_v1_language_proto google_cloud_location_location_proto google_cloud_managedidentities_v1_managedidentities_proto google_cloud_managedidentities_v1beta1_managedidentities_proto google_cloud_memcache_v1_memcache_proto google_cloud_metastore_logging_v1_logging_proto google_cloud_metastore_v1_metastore_proto google_cloud_metastore_v1alpha_metastore_proto google_cloud_networkconnectivity_v1_networkconnectivity_proto google_cloud_networkmanagement_v1_networkmanagement_proto google_cloud_networkservices_v1_networkservices_proto google_cloud_networkservices_v1beta1_networkservices_proto google_cloud_notebooks_logging_v1_logging_proto google_cloud_notebooks_v1_notebooks_proto google_cloud_optimization_v1_optimization_proto google_cloud_orchestration_airflow_service_v1_service_proto google_cloud_orgpolicy_v1_orgpolicy_proto google_cloud_orgpolicy_v2_orgpolicy_proto google_cloud_osconfig_agentendpoint_v1_agentendpoint_proto google_cloud_osconfig_agentendpoint_v1beta_agentendpoint_proto google_cloud_osconfig_v1_osconfig_proto google_cloud_osconfig_v1alpha_osconfig_proto google_cloud_osconfig_v1beta_osconfig_proto google_cloud_oslogin_common_common_proto google_cloud_oslogin_v1_oslogin_proto google_cloud_policytroubleshooter_v1_policytroubleshooter_proto google_cloud_pubsublite_v1_pubsublite_proto google_cloud_recaptchaenterprise_v1_recaptchaenterprise_proto google_cloud_recommender_logging_v1_logging_proto google_cloud_recommender_v1_recommender_proto google_cloud_recommender_v1beta1_recommender_proto google_cloud_redis_v1_redis_proto google_cloud_redis_v1beta1_redis_proto google_cloud_resourcemanager_v2_resourcemanager_proto google_cloud_resourcemanager_v3_resourcemanager_proto google_cloud_resourcesettings_v1_resourcesettings_proto google_cloud_retail_v2_retail_proto google_cloud_retail_v2alpha_retail_proto google_cloud_retail_v2beta_retail_proto google_cloud_run_v2_run_proto google_cloud_saasaccelerator_management_logs_v1_logs_proto google_cloud_scheduler_v1_scheduler_proto google_cloud_secretmanager_logging_v1_logging_proto google_cloud_secretmanager_v1_secretmanager_proto google_cloud_security_privateca_v1_privateca_proto google_cloud_security_publicca_v1beta1_publicca_proto google_cloud_securitycenter_v1_securitycenter_proto google_cloud_servicedirectory_v1_servicedirectory_proto google_cloud_shell_v1_shell_proto google_cloud_speech_v1_speech_proto google_cloud_sql_v1_sql_proto google_cloud_sql_v1beta4_sql_proto google_cloud_talent_v4_talent_proto google_cloud_tasks_v2_tasks_proto google_cloud_texttospeech_v1_texttospeech_proto google_cloud_tpu_v1_tpu_proto google_cloud_translate_v3_translation_proto google_cloud_video_livestream_logging_v1_logging_proto google_cloud_video_livestream_v1_livestream_proto google_cloud_video_stitcher_v1_stitcher_proto google_cloud_video_transcoder_v1_transcoder_proto google_cloud_videointelligence_v1_videointelligence_proto google_cloud_vision_v1_vision_proto google_cloud_vmmigration_v1_vmmigration_proto google_cloud_vpcaccess_v1_vpcaccess_proto google_cloud_webrisk_v1_webrisk_proto google_cloud_websecurityscanner_v1_websecurityscanner_proto google_cloud_workflows_executions_v1_executions_proto google_cloud_workflows_type_type_proto google_cloud_workflows_v1_workflows_proto google_container_v1_container_proto google_container_v1alpha1_container_proto google_container_v1beta1_container_proto google_dataflow_v1beta3_dataflow_proto google_datastore_admin_v1_admin_proto google_datastore_v1_datastore_proto google_devtools_artifactregistry_v1_artifactregistry_proto google_devtools_build_v1_build_proto google_devtools_cloudbuild_v1_cloudbuild_proto google_devtools_clouddebugger_v2_clouddebugger_proto google_devtools_cloudprofiler_v2_cloudprofiler_proto google_devtools_cloudtrace_v1_cloudtrace_proto google_devtools_cloudtrace_v2_cloudtrace_proto google_devtools_containeranalysis_v1_containeranalysis_proto google_devtools_resultstore_v2_resultstore_proto google_devtools_source_v1_source_proto google_devtools_testing_v1_testing_proto google_example_library_v1_library_proto google_firestore_admin_v1_admin_proto google_firestore_bundle_firestore_bundle_proto google_firestore_v1_firestore_proto google_geo_type_viewport_proto google_iam_admin_v1_admin_proto google_iam_credentials_v1_credentials_proto google_iam_v1_iam_policy_proto google_iam_v1_logging_audit_data_proto google_iam_v1_options_proto google_iam_v1_policy_proto google_iam_v2beta_iam_proto google_identity_accesscontextmanager_type_type_proto google_identity_accesscontextmanager_v1_accesscontextmanager_proto google_logging_type_type_proto google_logging_v2_logging_proto google_longrunning_operations_proto google_maps_roads_v1op_roads_proto google_maps_routes_v1_routes_proto google_monitoring_dashboard_v1_dashboard_proto google_monitoring_metricsscope_v1_metricsscope_proto google_monitoring_v3_monitoring_proto google_networking_trafficdirector_type_type_proto google_partner_aistreams_v1alpha1_aistreams_proto google_privacy_dlp_v2_dlp_proto google_pubsub_v1_pubsub_proto google_rpc_code_proto google_rpc_context_attribute_context_proto google_rpc_error_details_proto google_rpc_status_proto google_spanner_admin_database_v1_database_proto google_spanner_admin_instance_v1_instance_proto google_spanner_v1_spanner_proto google_storage_v1_storage_proto google_storage_v2_storage_proto google_storagetransfer_v1_storagetransfer_proto google_streetview_publish_v1_publish_proto google_type_calendar_period_proto google_type_color_proto google_type_date_proto google_type_datetime_proto google_type_dayofweek_proto google_type_decimal_proto google_type_expr_proto google_type_fraction_proto google_type_interval_proto google_type_latlng_proto google_type_money_proto google_type_month_proto google_type_phone_number_proto google_type_postal_address_proto google_type_quaternion_proto google_type_timeofday_proto grafeas_v1_grafeas_proto libprotoc libprotobuf zlib ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS wsock32 dbghelp iphlpapi crypt32 ws2_32 advapi32 user32 bcrypt ${CONAN_SYSTEM_LIBS})
set(CONAN_FRAMEWORKS  ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DCARES_STATICLIB" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS "C:/.conan/b5cc45/1/lib/cmake/protobuf/protobuf-generate.cmake"
			"C:/.conan/b5cc45/1/lib/cmake/protobuf/protobuf-module.cmake"
			"C:/.conan/b5cc45/1/lib/cmake/protobuf/protobuf-options.cmake" ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "C:/.conan/6de739/1/"
			"C:/Users/Awu/.conan/data/ninja/1.11.0/_/_/package/63c5d5dc6eb958dab897e143053e17f583d55879/"
			"C:/Users/Awu/.conan/data/gtest/cci.20210126/_/_/package/68a060fdd97b62cfc15d770518cafb06fe311849/"
			"C:/.conan/39e0389/1/"
			"C:/Users/Awu/.conan/data/c-ares/1.18.1/_/_/package/104d04e27d80f90ee826c18d63336299ffadd9c8/"
			"C:/Users/Awu/.conan/data/openssl/1.1.1o/_/_/package/70711aff723b218b02483e600038031bf91007bc/"
			"C:/Users/Awu/.conan/data/re2/20220201/_/_/package/70711aff723b218b02483e600038031bf91007bc/"
			"C:/Users/Awu/.conan/data/grpc-proto/cci.20220627/_/_/package/ad53281cef49d392d3f3253e30d23b67500c80c6/"
			"C:/.conan/3cc72e8/1/"
			"C:/.conan/b5cc45/1/"
			"C:/.conan/b5cc45/1/lib/cmake/protobuf"
			"C:/Users/Awu/.conan/data/zlib/1.2.12/_/_/package/70711aff723b218b02483e600038031bf91007bc/" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS " ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}" "" "")
# Append to aggregated values variable: Use CONAN_LIBS instead of CONAN_PKG_LIBS to include user appended vars
set(CONAN_LIBS ${CONAN_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    set(_CONAN_PKG_LIBS_GRPC_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GRPC} ${CONAN_FRAMEWORKS_FOUND_GRPC} CONAN_PKG::abseil CONAN_PKG::c-ares CONAN_PKG::openssl CONAN_PKG::protobuf CONAN_PKG::re2 CONAN_PKG::zlib CONAN_PKG::googleapis CONAN_PKG::grpc-proto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GRPC_DEPENDENCIES "${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GRPC}" "${CONAN_LIB_DIRS_GRPC}"
                                  CONAN_PACKAGE_TARGETS_GRPC "${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES}"
                                  "" grpc)
    set(_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GRPC_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GRPC_DEBUG} CONAN_PKG::abseil CONAN_PKG::c-ares CONAN_PKG::openssl CONAN_PKG::protobuf CONAN_PKG::re2 CONAN_PKG::zlib CONAN_PKG::googleapis CONAN_PKG::grpc-proto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GRPC_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GRPC_DEBUG}" "${CONAN_LIB_DIRS_GRPC_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GRPC_DEBUG "${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_DEBUG}"
                                  "debug" grpc)
    set(_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GRPC_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GRPC_RELEASE} CONAN_PKG::abseil CONAN_PKG::c-ares CONAN_PKG::openssl CONAN_PKG::protobuf CONAN_PKG::re2 CONAN_PKG::zlib CONAN_PKG::googleapis CONAN_PKG::grpc-proto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GRPC_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GRPC_RELEASE}" "${CONAN_LIB_DIRS_GRPC_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GRPC_RELEASE "${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_RELEASE}"
                                  "release" grpc)
    set(_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GRPC_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GRPC_RELWITHDEBINFO} CONAN_PKG::abseil CONAN_PKG::c-ares CONAN_PKG::openssl CONAN_PKG::protobuf CONAN_PKG::re2 CONAN_PKG::zlib CONAN_PKG::googleapis CONAN_PKG::grpc-proto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GRPC_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GRPC_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GRPC_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GRPC_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" grpc)
    set(_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GRPC_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GRPC_MINSIZEREL} CONAN_PKG::abseil CONAN_PKG::c-ares CONAN_PKG::openssl CONAN_PKG::protobuf CONAN_PKG::re2 CONAN_PKG::zlib CONAN_PKG::googleapis CONAN_PKG::grpc-proto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GRPC_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GRPC_MINSIZEREL}" "${CONAN_LIB_DIRS_GRPC_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GRPC_MINSIZEREL "${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" grpc)

    add_library(CONAN_PKG::grpc INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::grpc PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GRPC} ${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GRPC_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GRPC_RELEASE} ${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GRPC_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GRPC_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GRPC_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GRPC_MINSIZEREL} ${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GRPC_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GRPC_DEBUG} ${_CONAN_PKG_LIBS_GRPC_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GRPC_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::grpc PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GRPC}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GRPC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GRPC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GRPC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GRPC_DEBUG}>)
    set_property(TARGET CONAN_PKG::grpc PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GRPC}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GRPC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GRPC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GRPC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GRPC_DEBUG}>)
    set_property(TARGET CONAN_PKG::grpc PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GRPC_LIST} ${CONAN_CXX_FLAGS_GRPC_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GRPC_RELEASE_LIST} ${CONAN_CXX_FLAGS_GRPC_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GRPC_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GRPC_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GRPC_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GRPC_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GRPC_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GRPC_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_NINJA_DEPENDENCIES "${CONAN_SYSTEM_LIBS_NINJA} ${CONAN_FRAMEWORKS_FOUND_NINJA} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NINJA_DEPENDENCIES "${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NINJA}" "${CONAN_LIB_DIRS_NINJA}"
                                  CONAN_PACKAGE_TARGETS_NINJA "${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES}"
                                  "" ninja)
    set(_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_NINJA_DEBUG} ${CONAN_FRAMEWORKS_FOUND_NINJA_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NINJA_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NINJA_DEBUG}" "${CONAN_LIB_DIRS_NINJA_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_NINJA_DEBUG "${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_DEBUG}"
                                  "debug" ninja)
    set(_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_NINJA_RELEASE} ${CONAN_FRAMEWORKS_FOUND_NINJA_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NINJA_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NINJA_RELEASE}" "${CONAN_LIB_DIRS_NINJA_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_NINJA_RELEASE "${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_RELEASE}"
                                  "release" ninja)
    set(_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_NINJA_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_NINJA_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NINJA_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NINJA_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_NINJA_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_NINJA_RELWITHDEBINFO "${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" ninja)
    set(_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_NINJA_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_NINJA_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NINJA_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NINJA_MINSIZEREL}" "${CONAN_LIB_DIRS_NINJA_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_NINJA_MINSIZEREL "${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" ninja)

    add_library(CONAN_PKG::ninja INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::ninja PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_NINJA} ${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NINJA_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NINJA_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NINJA_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_NINJA_RELEASE} ${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NINJA_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NINJA_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NINJA_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_NINJA_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NINJA_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NINJA_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NINJA_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_NINJA_MINSIZEREL} ${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NINJA_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NINJA_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NINJA_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_NINJA_DEBUG} ${_CONAN_PKG_LIBS_NINJA_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NINJA_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NINJA_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NINJA_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::ninja PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_NINJA}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_NINJA_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_NINJA_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_NINJA_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_NINJA_DEBUG}>)
    set_property(TARGET CONAN_PKG::ninja PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_NINJA}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_NINJA_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_NINJA_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_NINJA_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_NINJA_DEBUG}>)
    set_property(TARGET CONAN_PKG::ninja PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_NINJA_LIST} ${CONAN_CXX_FLAGS_NINJA_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_NINJA_RELEASE_LIST} ${CONAN_CXX_FLAGS_NINJA_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_NINJA_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_NINJA_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_NINJA_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_NINJA_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_NINJA_DEBUG_LIST}  ${CONAN_CXX_FLAGS_NINJA_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GTEST_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GTEST} ${CONAN_FRAMEWORKS_FOUND_GTEST} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GTEST_DEPENDENCIES "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GTEST}" "${CONAN_LIB_DIRS_GTEST}"
                                  CONAN_PACKAGE_TARGETS_GTEST "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES}"
                                  "" gtest)
    set(_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GTEST_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GTEST_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GTEST_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GTEST_DEBUG}" "${CONAN_LIB_DIRS_GTEST_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GTEST_DEBUG "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_DEBUG}"
                                  "debug" gtest)
    set(_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GTEST_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GTEST_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GTEST_RELEASE}" "${CONAN_LIB_DIRS_GTEST_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GTEST_RELEASE "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELEASE}"
                                  "release" gtest)
    set(_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GTEST_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GTEST_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GTEST_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GTEST_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GTEST_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" gtest)
    set(_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GTEST_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GTEST_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GTEST_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GTEST_MINSIZEREL}" "${CONAN_LIB_DIRS_GTEST_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GTEST_MINSIZEREL "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" gtest)

    add_library(CONAN_PKG::gtest INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::gtest PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GTEST} ${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GTEST_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GTEST_RELEASE} ${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GTEST_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GTEST_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GTEST_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GTEST_MINSIZEREL} ${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GTEST_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GTEST_DEBUG} ${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GTEST_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::gtest PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GTEST}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GTEST_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GTEST_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GTEST_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GTEST_DEBUG}>)
    set_property(TARGET CONAN_PKG::gtest PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GTEST}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GTEST_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GTEST_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GTEST_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GTEST_DEBUG}>)
    set_property(TARGET CONAN_PKG::gtest PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GTEST_LIST} ${CONAN_CXX_FLAGS_GTEST_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GTEST_RELEASE_LIST} ${CONAN_CXX_FLAGS_GTEST_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GTEST_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GTEST_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GTEST_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GTEST_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GTEST_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GTEST_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ABSEIL} ${CONAN_FRAMEWORKS_FOUND_ABSEIL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES "${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ABSEIL}" "${CONAN_LIB_DIRS_ABSEIL}"
                                  CONAN_PACKAGE_TARGETS_ABSEIL "${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES}"
                                  "" abseil)
    set(_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ABSEIL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ABSEIL_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ABSEIL_DEBUG}" "${CONAN_LIB_DIRS_ABSEIL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ABSEIL_DEBUG "${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_DEBUG}"
                                  "debug" abseil)
    set(_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ABSEIL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ABSEIL_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ABSEIL_RELEASE}" "${CONAN_LIB_DIRS_ABSEIL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ABSEIL_RELEASE "${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_RELEASE}"
                                  "release" abseil)
    set(_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ABSEIL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ABSEIL_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ABSEIL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ABSEIL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ABSEIL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" abseil)
    set(_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ABSEIL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ABSEIL_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ABSEIL_MINSIZEREL}" "${CONAN_LIB_DIRS_ABSEIL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ABSEIL_MINSIZEREL "${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" abseil)

    add_library(CONAN_PKG::abseil INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::abseil PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ABSEIL} ${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ABSEIL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ABSEIL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ABSEIL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ABSEIL_RELEASE} ${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ABSEIL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ABSEIL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ABSEIL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ABSEIL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ABSEIL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ABSEIL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ABSEIL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ABSEIL_MINSIZEREL} ${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ABSEIL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ABSEIL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ABSEIL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ABSEIL_DEBUG} ${_CONAN_PKG_LIBS_ABSEIL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ABSEIL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ABSEIL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ABSEIL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::abseil PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ABSEIL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ABSEIL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ABSEIL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ABSEIL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ABSEIL_DEBUG}>)
    set_property(TARGET CONAN_PKG::abseil PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ABSEIL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ABSEIL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ABSEIL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ABSEIL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ABSEIL_DEBUG}>)
    set_property(TARGET CONAN_PKG::abseil PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ABSEIL_LIST} ${CONAN_CXX_FLAGS_ABSEIL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ABSEIL_RELEASE_LIST} ${CONAN_CXX_FLAGS_ABSEIL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ABSEIL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ABSEIL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ABSEIL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ABSEIL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ABSEIL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ABSEIL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES "${CONAN_SYSTEM_LIBS_C-ARES} ${CONAN_FRAMEWORKS_FOUND_C-ARES} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_C-ARES_DEPENDENCIES "${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_C-ARES}" "${CONAN_LIB_DIRS_C-ARES}"
                                  CONAN_PACKAGE_TARGETS_C-ARES "${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES}"
                                  "" c-ares)
    set(_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_C-ARES_DEBUG} ${CONAN_FRAMEWORKS_FOUND_C-ARES_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_C-ARES_DEBUG}" "${CONAN_LIB_DIRS_C-ARES_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_C-ARES_DEBUG "${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_DEBUG}"
                                  "debug" c-ares)
    set(_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_C-ARES_RELEASE} ${CONAN_FRAMEWORKS_FOUND_C-ARES_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_C-ARES_RELEASE}" "${CONAN_LIB_DIRS_C-ARES_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_C-ARES_RELEASE "${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_RELEASE}"
                                  "release" c-ares)
    set(_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_C-ARES_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_C-ARES_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_C-ARES_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_C-ARES_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_C-ARES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" c-ares)
    set(_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_C-ARES_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_C-ARES_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_C-ARES_MINSIZEREL}" "${CONAN_LIB_DIRS_C-ARES_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_C-ARES_MINSIZEREL "${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" c-ares)

    add_library(CONAN_PKG::c-ares INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::c-ares PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_C-ARES} ${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_C-ARES_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_C-ARES_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_C-ARES_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_C-ARES_RELEASE} ${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_C-ARES_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_C-ARES_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_C-ARES_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_C-ARES_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_C-ARES_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_C-ARES_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_C-ARES_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_C-ARES_MINSIZEREL} ${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_C-ARES_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_C-ARES_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_C-ARES_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_C-ARES_DEBUG} ${_CONAN_PKG_LIBS_C-ARES_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_C-ARES_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_C-ARES_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_C-ARES_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::c-ares PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_C-ARES}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_C-ARES_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_C-ARES_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_C-ARES_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_C-ARES_DEBUG}>)
    set_property(TARGET CONAN_PKG::c-ares PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_C-ARES}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_C-ARES_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_C-ARES_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_C-ARES_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_C-ARES_DEBUG}>)
    set_property(TARGET CONAN_PKG::c-ares PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_C-ARES_LIST} ${CONAN_CXX_FLAGS_C-ARES_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_C-ARES_RELEASE_LIST} ${CONAN_CXX_FLAGS_C-ARES_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_C-ARES_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_C-ARES_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_C-ARES_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_C-ARES_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_C-ARES_DEBUG_LIST}  ${CONAN_CXX_FLAGS_C-ARES_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENSSL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL}" "${CONAN_LIB_DIRS_OPENSSL}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}"
                                  "" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENSSL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_DEBUG}" "${CONAN_LIB_DIRS_OPENSSL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_DEBUG "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}"
                                  "debug" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENSSL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_RELEASE}" "${CONAN_LIB_DIRS_OPENSSL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_RELEASE "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}"
                                  "release" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENSSL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENSSL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENSSL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENSSL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_MINSIZEREL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" openssl)

    add_library(CONAN_PKG::openssl INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENSSL} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENSSL_RELEASE} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENSSL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENSSL_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENSSL_DEBUG} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENSSL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENSSL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENSSL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENSSL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENSSL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENSSL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENSSL_LIST} ${CONAN_CXX_FLAGS_OPENSSL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENSSL_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENSSL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENSSL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENSSL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENSSL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_RE2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_RE2} ${CONAN_FRAMEWORKS_FOUND_RE2} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RE2_DEPENDENCIES "${_CONAN_PKG_LIBS_RE2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RE2}" "${CONAN_LIB_DIRS_RE2}"
                                  CONAN_PACKAGE_TARGETS_RE2 "${_CONAN_PKG_LIBS_RE2_DEPENDENCIES}"
                                  "" re2)
    set(_CONAN_PKG_LIBS_RE2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_RE2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_RE2_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RE2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RE2_DEBUG}" "${CONAN_LIB_DIRS_RE2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_RE2_DEBUG "${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_DEBUG}"
                                  "debug" re2)
    set(_CONAN_PKG_LIBS_RE2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_RE2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_RE2_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RE2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RE2_RELEASE}" "${CONAN_LIB_DIRS_RE2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_RE2_RELEASE "${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_RELEASE}"
                                  "release" re2)
    set(_CONAN_PKG_LIBS_RE2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_RE2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_RE2_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RE2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RE2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RE2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_RE2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" re2)
    set(_CONAN_PKG_LIBS_RE2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_RE2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_RE2_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RE2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RE2_MINSIZEREL}" "${CONAN_LIB_DIRS_RE2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_RE2_MINSIZEREL "${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" re2)

    add_library(CONAN_PKG::re2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::re2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_RE2} ${_CONAN_PKG_LIBS_RE2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RE2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RE2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RE2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_RE2_RELEASE} ${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RE2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RE2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RE2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_RE2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RE2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RE2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RE2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_RE2_MINSIZEREL} ${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RE2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RE2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RE2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_RE2_DEBUG} ${_CONAN_PKG_LIBS_RE2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RE2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RE2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RE2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::re2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_RE2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RE2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RE2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_RE2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_RE2_DEBUG}>)
    set_property(TARGET CONAN_PKG::re2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_RE2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_RE2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_RE2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_RE2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_RE2_DEBUG}>)
    set_property(TARGET CONAN_PKG::re2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_RE2_LIST} ${CONAN_CXX_FLAGS_RE2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_RE2_RELEASE_LIST} ${CONAN_CXX_FLAGS_RE2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_RE2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_RE2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_RE2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_RE2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_RE2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_RE2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GRPC-PROTO} ${CONAN_FRAMEWORKS_FOUND_GRPC-PROTO} CONAN_PKG::protobuf CONAN_PKG::googleapis")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES "${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GRPC-PROTO}" "${CONAN_LIB_DIRS_GRPC-PROTO}"
                                  CONAN_PACKAGE_TARGETS_GRPC-PROTO "${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES}"
                                  "" grpc-proto)
    set(_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GRPC-PROTO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GRPC-PROTO_DEBUG} CONAN_PKG::protobuf CONAN_PKG::googleapis")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GRPC-PROTO_DEBUG}" "${CONAN_LIB_DIRS_GRPC-PROTO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GRPC-PROTO_DEBUG "${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_DEBUG}"
                                  "debug" grpc-proto)
    set(_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GRPC-PROTO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GRPC-PROTO_RELEASE} CONAN_PKG::protobuf CONAN_PKG::googleapis")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GRPC-PROTO_RELEASE}" "${CONAN_LIB_DIRS_GRPC-PROTO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GRPC-PROTO_RELEASE "${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_RELEASE}"
                                  "release" grpc-proto)
    set(_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GRPC-PROTO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GRPC-PROTO_RELWITHDEBINFO} CONAN_PKG::protobuf CONAN_PKG::googleapis")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GRPC-PROTO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GRPC-PROTO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GRPC-PROTO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" grpc-proto)
    set(_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GRPC-PROTO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GRPC-PROTO_MINSIZEREL} CONAN_PKG::protobuf CONAN_PKG::googleapis")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GRPC-PROTO_MINSIZEREL}" "${CONAN_LIB_DIRS_GRPC-PROTO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GRPC-PROTO_MINSIZEREL "${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" grpc-proto)

    add_library(CONAN_PKG::grpc-proto INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::grpc-proto PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GRPC-PROTO} ${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GRPC-PROTO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GRPC-PROTO_RELEASE} ${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GRPC-PROTO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GRPC-PROTO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GRPC-PROTO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GRPC-PROTO_MINSIZEREL} ${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GRPC-PROTO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GRPC-PROTO_DEBUG} ${_CONAN_PKG_LIBS_GRPC-PROTO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GRPC-PROTO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GRPC-PROTO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::grpc-proto PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GRPC-PROTO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GRPC-PROTO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GRPC-PROTO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GRPC-PROTO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GRPC-PROTO_DEBUG}>)
    set_property(TARGET CONAN_PKG::grpc-proto PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GRPC-PROTO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GRPC-PROTO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GRPC-PROTO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GRPC-PROTO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GRPC-PROTO_DEBUG}>)
    set_property(TARGET CONAN_PKG::grpc-proto PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GRPC-PROTO_LIST} ${CONAN_CXX_FLAGS_GRPC-PROTO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GRPC-PROTO_RELEASE_LIST} ${CONAN_CXX_FLAGS_GRPC-PROTO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GRPC-PROTO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GRPC-PROTO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GRPC-PROTO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GRPC-PROTO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GRPC-PROTO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GRPC-PROTO_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GOOGLEAPIS} ${CONAN_FRAMEWORKS_FOUND_GOOGLEAPIS} CONAN_PKG::protobuf")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES "${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GOOGLEAPIS}" "${CONAN_LIB_DIRS_GOOGLEAPIS}"
                                  CONAN_PACKAGE_TARGETS_GOOGLEAPIS "${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES}"
                                  "" googleapis)
    set(_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GOOGLEAPIS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GOOGLEAPIS_DEBUG} CONAN_PKG::protobuf")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GOOGLEAPIS_DEBUG}" "${CONAN_LIB_DIRS_GOOGLEAPIS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GOOGLEAPIS_DEBUG "${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_DEBUG}"
                                  "debug" googleapis)
    set(_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GOOGLEAPIS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GOOGLEAPIS_RELEASE} CONAN_PKG::protobuf")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GOOGLEAPIS_RELEASE}" "${CONAN_LIB_DIRS_GOOGLEAPIS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GOOGLEAPIS_RELEASE "${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_RELEASE}"
                                  "release" googleapis)
    set(_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GOOGLEAPIS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GOOGLEAPIS_RELWITHDEBINFO} CONAN_PKG::protobuf")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GOOGLEAPIS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GOOGLEAPIS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GOOGLEAPIS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" googleapis)
    set(_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GOOGLEAPIS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GOOGLEAPIS_MINSIZEREL} CONAN_PKG::protobuf")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GOOGLEAPIS_MINSIZEREL}" "${CONAN_LIB_DIRS_GOOGLEAPIS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GOOGLEAPIS_MINSIZEREL "${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" googleapis)

    add_library(CONAN_PKG::googleapis INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::googleapis PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GOOGLEAPIS} ${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GOOGLEAPIS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GOOGLEAPIS_RELEASE} ${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GOOGLEAPIS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GOOGLEAPIS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GOOGLEAPIS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GOOGLEAPIS_MINSIZEREL} ${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GOOGLEAPIS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GOOGLEAPIS_DEBUG} ${_CONAN_PKG_LIBS_GOOGLEAPIS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GOOGLEAPIS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GOOGLEAPIS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::googleapis PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GOOGLEAPIS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GOOGLEAPIS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GOOGLEAPIS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GOOGLEAPIS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GOOGLEAPIS_DEBUG}>)
    set_property(TARGET CONAN_PKG::googleapis PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GOOGLEAPIS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GOOGLEAPIS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GOOGLEAPIS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GOOGLEAPIS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GOOGLEAPIS_DEBUG}>)
    set_property(TARGET CONAN_PKG::googleapis PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GOOGLEAPIS_LIST} ${CONAN_CXX_FLAGS_GOOGLEAPIS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GOOGLEAPIS_RELEASE_LIST} ${CONAN_CXX_FLAGS_GOOGLEAPIS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GOOGLEAPIS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GOOGLEAPIS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GOOGLEAPIS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GOOGLEAPIS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GOOGLEAPIS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GOOGLEAPIS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PROTOBUF} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROTOBUF}" "${CONAN_LIB_DIRS_PROTOBUF}"
                                  CONAN_PACKAGE_TARGETS_PROTOBUF "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES}"
                                  "" protobuf)
    set(_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PROTOBUF_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF_DEBUG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROTOBUF_DEBUG}" "${CONAN_LIB_DIRS_PROTOBUF_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PROTOBUF_DEBUG "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_DEBUG}"
                                  "debug" protobuf)
    set(_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PROTOBUF_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF_RELEASE} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROTOBUF_RELEASE}" "${CONAN_LIB_DIRS_PROTOBUF_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PROTOBUF_RELEASE "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELEASE}"
                                  "release" protobuf)
    set(_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PROTOBUF_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF_RELWITHDEBINFO} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROTOBUF_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PROTOBUF_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PROTOBUF_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" protobuf)
    set(_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PROTOBUF_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF_MINSIZEREL} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROTOBUF_MINSIZEREL}" "${CONAN_LIB_DIRS_PROTOBUF_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PROTOBUF_MINSIZEREL "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" protobuf)

    add_library(CONAN_PKG::protobuf INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::protobuf PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PROTOBUF} ${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROTOBUF_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PROTOBUF_RELEASE} ${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROTOBUF_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PROTOBUF_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROTOBUF_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PROTOBUF_MINSIZEREL} ${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROTOBUF_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PROTOBUF_DEBUG} ${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROTOBUF_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::protobuf PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PROTOBUF}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PROTOBUF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PROTOBUF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PROTOBUF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PROTOBUF_DEBUG}>)
    set_property(TARGET CONAN_PKG::protobuf PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PROTOBUF}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PROTOBUF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PROTOBUF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PROTOBUF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PROTOBUF_DEBUG}>)
    set_property(TARGET CONAN_PKG::protobuf PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PROTOBUF_LIST} ${CONAN_CXX_FLAGS_PROTOBUF_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PROTOBUF_RELEASE_LIST} ${CONAN_CXX_FLAGS_PROTOBUF_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PROTOBUF_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PROTOBUF_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PROTOBUF_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PROTOBUF_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PROTOBUF_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PROTOBUF_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB}" "${CONAN_LIB_DIRS_ZLIB}"
                                  CONAN_PACKAGE_TARGETS_ZLIB "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}"
                                  "" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZLIB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZLIB_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_DEBUG}" "${CONAN_LIB_DIRS_ZLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}"
                                  "debug" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZLIB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELEASE}" "${CONAN_LIB_DIRS_ZLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}"
                                  "release" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZLIB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZLIB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZLIB_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_ZLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zlib)

    add_library(CONAN_PKG::zlib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZLIB} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZLIB_RELEASE} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZLIB_DEBUG} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZLIB_LIST} ${CONAN_CXX_FLAGS_ZLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZLIB_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::grpc CONAN_PKG::ninja CONAN_PKG::gtest CONAN_PKG::abseil CONAN_PKG::c-ares CONAN_PKG::openssl CONAN_PKG::re2 CONAN_PKG::grpc-proto CONAN_PKG::googleapis CONAN_PKG::protobuf CONAN_PKG::zlib)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()


macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()


macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()


macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        conan_get_policy(CMP0091 policy_0091)
        if(policy_0091 STREQUAL "NEW")
            if(CONAN_LINK_RUNTIME MATCHES "MTd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
            elseif(CONAN_LINK_RUNTIME MATCHES "MDd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
            elseif(CONAN_LINK_RUNTIME MATCHES "MT")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
            elseif(CONAN_LINK_RUNTIME MATCHES "MD")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
            endif()
        else()
            foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                         CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                         CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
                if(DEFINED ${flag})
                    string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
            foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
                if(DEFINED ${flag})
                    string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
        endif()
    endif()
endmacro()


macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()


function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


function(conan_get_policy policy_id policy)
    if(POLICY "${policy_id}")
        cmake_policy(GET "${policy_id}" _policy)
        set(${policy} "${_policy}" PARENT_SCOPE)
    else()
        set(${policy} "" PARENT_SCOPE)
    endif()
endfunction()


function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAMES ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAMES ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
            set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    # Add all dependencies to all targets
    string(REPLACE " " ";" deps_list "${deps}")
    foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
        set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
    endforeach()

    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()


macro(conan_set_std)
    conan_message(STATUS "Conan: Adjusting language standard")
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
        if(CONAN_STD_CXX_FLAG)
            conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
            set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
        endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()


macro(conan_set_rpath)
    conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
        # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        set(CMAKE_SKIP_RPATH 1 CACHE BOOL "rpaths" FORCE)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()


macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()


macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()


macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()


macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: \n"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}\n"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}\n"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])\n"
                        "P.S. You may set CONAN_DISABLE_CHECK_COMPILER CMake variable in order to disable this check."
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    # MATCHALL will match all, including the last one, which is the full_settings one
    string(REGEX MATCH "full_settings.*" _FULL_SETTINGS_MATCHED ${CONANINFO})
    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()


function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1930 = VS 17.0 (v143 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "17" AND NOT((MSVC_VERSION EQUAL 1930) OR (MSVC_VERSION GREATER 1930))) OR
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc" OR CONAN_COMPILER STREQUAL "mcst-lcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(${CONAN_COMPILER_MAJOR} VERSION_GREATER_EQUAL "13" AND "${CONAN_COMPILER_MINOR}" STREQUAL "" AND ${CONAN_COMPILER_MAJOR} VERSION_EQUAL ${VERSION_MAJOR})
           # This is correct,  13.X is considered 13
        elseif(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "intel")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 19.1)
            if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
               conan_error_compiler_version()
            endif()
        else()
            if(NOT ${VERSION_MAJOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR})
               conan_error_compiler_version()
            endif()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()


function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "llvm" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()


macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()


macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()


macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()


macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

