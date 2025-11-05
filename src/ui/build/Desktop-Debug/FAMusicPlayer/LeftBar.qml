import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
Rectangle{
    color: "#252526"
    height: parent.height
    //width: 196

    property int buttonHeight : 38
    property int margins : 14
    anchors.margins: 12

    component SearchBar: Item{
        anchors.horizontalCenter: parent.horizontalCenter
        width: sideBar.width - margins*2
        height: buttonHeight
        property bool focusOnBar : false
        Rectangle{
            anchors.fill: parent
            color: "#1F1F1F"
            radius: 14
            border.color: searchBarTextQuery.activeFocus ? "#A5444F" : "#404040"
            border.width: 2
            TextField{
                id: searchBarTextQuery
                placeholderText: qsTr(" yo Search me vro!")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                width: parent.width
                autoScroll: true

                background: parent
                onPressed: {

                }
            }
        }
    }


    component ListButtonText: Text{
        color: "#F9F9F9"
        //anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 16
    }
    component ListSeparatorText: Item{
        required property string separatorName

        width: sideBar.width - margins*1.2
        height: buttonHeight*0.8
        anchors.right: sideBar.right

        ListButtonText{
            text: qsTr(separatorName)
            font.pixelSize: 12
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
            color: "#B0B0B1"

        }

    }


    component ListButton: Item{
        required property string iconSourceBaseName
        required property string listButtonName


        width: sideBar.width - margins*2
        height: buttonHeight
        anchors.horizontalCenter: parent.horizontalCenter
        //Layout.margins: 12
        //ac
        MouseArea{

            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
        }
        Rectangle{

            color: "#1F1F1F"
            anchors.fill: parent
            radius: 12
            visible:mouseArea.containsMouse
        }

        RowLayout{

            anchors.verticalCenter: parent.verticalCenter
            Layout.preferredWidth: parent.width
            spacing: margins*0.3

            Image{
                id: buttonIcon
                source : iconSourceBaseName

                Layout.preferredWidth: buttonHeight*0.8
                Layout.preferredHeight: buttonHeight*0.8

            }
            ListButtonText{
                text: listButtonName
            }
        }
    }

    ColumnLayout{
        id: sideBar
        width: parent.width
        //anchors.top: parent.top
        //anchors.left : parent.left
        Layout.preferredHeight: 46
        //anchors.fill: parent
        //Layout.margins: margins
        //an
        Item{
            height: 96
            width: sideBar.width
        }
        SearchBar{

        }
        ListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "Home"
        }
        ListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "New"
        }
        ListSeparatorText{
            separatorName: "Library"
        }


        ListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "Recently added"
        }
        ListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "Artists"
        }
        ListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "Albums"
        }
        ListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "Songs"
        }

        ListSeparatorText{
            separatorName: "Playlists"
        }

        ListButton{
            iconSourceBaseName: "assets/shuffle.png"
            listButtonName: "All Playlists"
        }

    }


}
