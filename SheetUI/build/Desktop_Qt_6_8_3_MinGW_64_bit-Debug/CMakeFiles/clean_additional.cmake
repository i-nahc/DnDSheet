# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appSheetUI_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appSheetUI_autogen.dir\\ParseCache.txt"
  "appSheetUI_autogen"
  "includes\\pugixml\\CMakeFiles\\pugixml-static_autogen.dir\\AutogenUsed.txt"
  "includes\\pugixml\\CMakeFiles\\pugixml-static_autogen.dir\\ParseCache.txt"
  "includes\\pugixml\\pugixml-static_autogen"
  )
endif()
