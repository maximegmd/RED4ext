option(RED4EXT_INSTALL "" OFF)
option(RED4EXT_USE_PCH "" ON)

FetchContent_Declare(
  RED4ext.SDK
  GIT_REPOSITORY  https://github.com/maximegmd/RED4ext.SDK.git
  GIT_TAG         68f7473af0484a0b299a6f6d918c33330fd59e57
)
FetchContent_MakeAvailable(RED4ext.SDK)

set_target_properties(
  RED4ext.SDK
    PROPERTIES
      FOLDER "Dependencies"
)

mark_as_advanced(
  RED4EXT_BUILD_EXAMPLES
  RED4EXT_HEADER_ONLY
  RED4EXT_INSTALL
  RED4EXT_USE_PCH
)
