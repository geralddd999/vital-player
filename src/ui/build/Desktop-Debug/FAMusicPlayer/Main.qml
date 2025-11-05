import QtQuick
import QtQuick.Layouts

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("GPlaya")
    color: "#1F1F1F"

    property bool iscompactSize: width <= 520
    property bool isreducedSize: width <= 720 && !iscompactSize
    property bool isnormalSize: !isreducedSize && !iscompactSize

    RowLayout{//normalView
        anchors.fill: parent
        spacing : 0
        visible: isnormalSize
        LayoutItemProxy{
            target: normalLeftSideBar
            width: 186
            Layout.fillHeight: true
        }
        ColumnLayout{
            Layout.fillHeight: true
            Layout.fillWidth: true

            LayoutItemProxy{
                target: mediaPlayer
                Layout.fillWidth: true
            }
            LayoutItemProxy{
                target: musicContent
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
    RowLayout{
        anchors.fill: parent
        spacing: 0
        visible: isreducedSize
        LayoutItemProxy{
            target: reducedSideBar
            width: 76
            Layout.fillHeight: true
        }
        ColumnLayout{
            Layout.fillHeight: true; Layout.fillWidth: true
            LayoutItemProxy{
                target: musicContent
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
            LayoutItemProxy{
                target: mediaPlayer
                Layout.fillWidth: true
            }
        }
    }
    ColumnLayout{//reducedView | no sidebar
        anchors.fill: parent
        spacing: 0
        visible: iscompactSize
        LayoutItemProxy{
            target: musicContent
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        LayoutItemProxy{
            target: mediaPlayer
            Layout.fillWidth: true
        }
    }


    LeftBar{
        id: normalLeftSideBar
        Layout.preferredWidth: 195
        //Layout.fillHeight: true
        //color: "#452536"
        //border: #39393A

    }
    CompactLeftBar{
        id: reducedSideBar
        compactLeftBarWidth: 86
        //Layout.preferredWidth: 96
        //ayout.fillHeight: true
        //color: "#452536"
    }

    MediaBar{
        id: mediaPlayer
        anchors.bottom: parent.bottom
        Layout.fillWidth: true
        Layout.preferredHeight: 64
    }

    Rectangle{
        id: musicContent
        color: "#524F4B"
        anchors.fill: parent
    }

}
