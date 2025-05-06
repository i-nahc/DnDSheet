cmake_minimum_required(VERSION 3.16)

project(SheetUI VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Core5Compat)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appSheetUI
    main.cpp
    icons.qrc
    fonts.qrc
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
        SOURCES UI/customClasses/dnditemlist.h UI/customClasses/dnditemlist.cpp
        SOURCES UI/customClasses/dnditem.h UI/customClasses/dnditem.cpp
        SOURCES UI/customClasses/proxyitemlist.h UI/customClasses/proxyitemlist.cpp
        QML_FILES
        QML_FILES UI/settings/Style.qml
        QML_FILES UI/resNavBar/WheelMenu.qml
        QML_FILES UI/resNavBar/WheelOption.qml
        QML_FILES UI/navigation/MenuOption.qml
        QML_FILES UI/navigation/MenuPage.qml
        RESOURCES fonts.qrc
        QML_FILES UI/resNavBar/LeftHandNav.qml
        QML_FILES UI/resNavBar/LeftHandOptions.qml
        QML_FILES UI/navigation/ChangelogList.qml
        QML_FILES UI/pages/Items.qml
        QML_FILES UI/pages/ItemsComponents.qml
        SOURCES UI/customClasses/listhandler.h UI/customClasses/listhandler.cpp
        QML_FILES UI/pages/ItemsComboBox.qml
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

add_subdirectory(includes/pugixml)

target_link_libraries(appSheetUI
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Core5Compat
)

target_link_libraries(appSheetUI
    PRIVATE pugixml-static
)

include(GNUInstallDirs)
install(TARGETS appSheetUI
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

