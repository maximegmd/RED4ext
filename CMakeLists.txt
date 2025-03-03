cmake_minimum_required(VERSION 3.23)

project(RED4ext LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include(ConfigureVersionFromGit)
include(ConfigureDefaultOutputDirectories)
include(TargetOutputDirectory)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

configure_version_from_git()
configure_default_output_directories()

add_compile_definitions(
  # Support Windows 7 and above.
  WINVER=0x0601
  _WIN32_WINNT=0x0601

  # Exclude unnecessary APIs.
  WIN32_LEAN_AND_MEAN

  # Use Unicode charset.
  UNICODE
  _UNICODE
)

add_compile_options(
  # Enable correct reporting of C++ version, see https://docs.microsoft.com/en-us/cpp/build/reference/zc-cplusplus.
  $<$<BOOL:MSVC>:/Zc:__cplusplus>
)

include(ConfigureAndIncludeDetours)
include(ConfigureAndIncludeFmt)
include(ConfigureAndIncludeRED4extSdk)
include(ConfigureAndIncludeSimdjson)
include(ConfigureAndIncludeSpdlog)
include(ConfigureAndIncludeToml11)
include(ConfigureAndIncludeTslOrderedMap)
include(ConfigureAndIncludeWil)
include(ConfigureAndIncludeRedscript)

add_subdirectory(src)
