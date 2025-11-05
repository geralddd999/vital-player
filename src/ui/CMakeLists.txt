cmake_minimum_required(VERSION 3.16)

project(FAMusicPlayer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appFAMusicPlayer
    main.cpp
)

qt_add_qml_module(appFAMusicPlayer
    URI FAMusicPlayer
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES
        QML_FILES MediaBar.qml
        RESOURCES assets/music-icon.png
        RESOURCES assets/ab1.jpg
        RESOURCES assets/ab1.png
        QML_FILES ConfigWindow.qml
        RESOURCES assets/fast-forward.png assets/music-icon.png assets/pause.png assets/play.png assets/shuffle.png
        QML_FILES LeftBar.qml
        QML_FILES CompactLeftBar.qml
        RESOURCES settings.json
        QML_FILES VerticalTabBar.qml
        QML_FILES AlbumGrid.qml

)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appFAMusicPlayer PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appFAMusicPlayer
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appFAMusicPlayer
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appFAMusicPlayer
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
