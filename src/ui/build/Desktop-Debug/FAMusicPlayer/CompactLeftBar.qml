import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
Rectangle {
    id: compactLeftBar
    property int buttonHeight : 38
    property alias compactLeftBarWidth: compactLeftBar.width

    component ListButtonText: Text{
        color: "#F9F9F9"
        font.pixelSize: 13
        wrapMode : Text.WordWrap
        elide: Text.ElideMiddle

    }
    component ListSeparatorText: Item{
        required property string separatorName
        Layout.alignment: Qt.AlignCenter

        width: parent.width

        //width: compactSideBar.width - margins*1.2
        height: buttonHeight*0.8
        //anchors.right: compactSideBar.right

        ListButtonText{
            text: qsTr(separatorName)
            font.pixelSize: 12
            font.bold: true
            anchors.centerIn: parent
            color: "#B0B0B1"

        }
    }

    component CompactListButton: Item{
        required property string iconSourceBaseName
        required property string listButtonName
        width: parent.width - margins*2
        height: buttonHeight*2

        Layout.alignment: Qt.AlignCenter

        //anchors.horizontalCenter: parent.horizontalCenter

        MouseArea{
            id: compactMouseArea
            anchors.fill: parent
            hoverEnabled: true
        }
        Rectangle{
            color: "#1F1F1F"
            anchors.fill: parent
            radius: 12
            visible: compactMouseArea.containsMouse
        }
        ColumnLayout{
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            //width: parent.width
            //Layout.preferredWidth: parent.width
            spacing: margins*0.3

            Image{
                id: compactButtonIcon
                source : iconSourceBaseName
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: buttonHeight*0.8
                Layout.preferredHeight: buttonHeight*0.8

            }
            ListButtonText{
                Layout.alignment: Qt.AlignCenter
                text: listButtonName
                width : compactButtonIcon.width
            }
        }
    }

    component CompactSearchBar: Item{
        id: compactSearchBar
        //anchors.horizontalCenter: parent.horizontalCenter

        width: parent.width
        height: buttonHeight*2
        property bool searchToggled : false

        ColumnLayout{
            id: compactSearchLayout
            anchors.horizontalCenter: parent.horizontalCenter
            Layout.preferredWidth: parent.width
            spacing: 4

            Image{
                id: compactSearchBarIcon
                Layout.alignment: Qt.AlignCenter
                source: "assets/shuffle.png"
                Layout.preferredWidth: buttonHeight*0.8
                //anchors.horizontalCenter: parent.horizontalCenter
                Layout.preferredHeight: buttonHeight*0.8
            }
            ListButtonText{
                //anchors.horizontalCenter: parent.horizontalCenter
                text: "Search"
                Layout.alignment: Qt.AlignCenter
            }
        }


        MouseArea{
            anchors.fill: parent

            onClicked: {
                //show the searchbar
                searchPopup.open()
            }

        }
        Popup{
            id: searchPopup
            parent : Overlay.overlay
            //positioning to the left [h] and v.center
            x: compactSearchBar.width + 8
            y: compactSearchBar.mapToItem(Overlay.overlay,0,0).y + (compactSearchBar.height - height)/2


            width: compactSearchBar.width *2.25 ; height: buttonHeight
            padding: 0
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
            focus: true

            background: Rectangle {
               color: "#1F1F1F"
               border.color: "#A5444F"
               border.width: 2
               radius: 10

            }

            TextField {
                id: searchInput
                anchors.fill: parent
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                placeholderText: qsTr("Search...")
                color: "#F9F9F9"
                font.pixelSize: 14
                Component.onCompleted: forceActiveFocus()

                background: Rectangle { color: "transparent" }
            }


        }

    }

    // Actual Compact Layout settings
    color: "#252526"
    height: parent.height
    //width: 72
    property int margins : 14


    ColumnLayout{
        id: compactSideBar
        Layout.preferredWidth: 72
        //a
        width: parent.width
        Item{
            height: 144
            width: compactSideBar.width
        }
        CompactSearchBar{
            Layout.alignment: Qt.AlignCenter
        }

        CompactListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "Home"
        }
        CompactListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "New"
        }
        ListSeparatorText{
            separatorName: "Library"
        }


        CompactListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "Recently added"
        }
        CompactListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "Artists"
        }
        CompactListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "Albums"
        }
        CompactListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "Songs"
        }

        ListSeparatorText{
            separatorName: "Playlists"
        }

        CompactListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "All Playlists"
        }


    }

}
