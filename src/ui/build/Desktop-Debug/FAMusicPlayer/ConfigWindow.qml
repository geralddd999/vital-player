import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
Window{
    id: configWindow
    minimumHeight: 480; minimumWidth: 640
    maximumHeight: minimumHeight ; maximumWidth: minimumWidth
    visible: false

    color: "#1E1E1E"

    title: qsTr("Vital Settings")

    // Playback settings
    //Appearence (Material colors or default visuals )
    //About
    // Directories/manage the database(adv)
    //
    RowLayout{
        anchors.fill: parent
        spacing : 0
        Rectangle{
            Layout.fillHeight: true
            Layout.preferredWidth: 126
            color: "#252526"
            VerticalTabBar{
                id: settingsTabBar
                anchors.horizontalCenter: parent.horizontalCenter

                Layout.minimumWidth: 126 //change it later vro

                ListModel {
                    id: tabModel
                    ListElement { text: "Playback" }
                    ListElement { text: "Appearance" }
                    ListElement { text: "Library" }
                    ListElement { text: "About" }
                }
        }


        }
        //separator
        Rectangle{
            Layout.fillHeight: true
            Layout.preferredWidth: 1
            color : "#3B3B3C"
        }
        StackLayout{
            id: stackContent
            Layout.fillHeight: true
            Layout.fillWidth: true

            currentIndex : settingsTabBar.currentIndex



            ColumnLayout{
                Item{
                    Label{
                        //anchors.centerIn: parent
                        text: "vro does this work??"
                    }
                }
            }

            ColumnLayout{
                anchors.margins: 10
                spacing: 10
                Label{
                    text: qsTr("Music search direc")
                }
            }
        }
    }


}
