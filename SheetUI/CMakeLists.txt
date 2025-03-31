cmake_minimum_required(VERSION 3.16)

project(SheetUI VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appSheetUI
    main.cpp
    icons.qrc
)

set_source_files_properties(UI/settings/Style.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(appSheetUI
    URI SheetUI
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES UI/resNavBar/NavBar.qml
        RESOURCES icons.qrc
        SOURCES backend.h backend.cpp
        QML_FILES
        QML_FILES UI/settings/Style.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appSheetUI PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appSheetUI
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appSheetUI
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appSheetUI
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
