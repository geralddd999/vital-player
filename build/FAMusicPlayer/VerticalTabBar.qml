import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ColumnLayout{
    id: root

    property int currentIndex :0
    default property alias contentData : buttonsRepeater.model

    spacing: 5
    Repeater{
        id: buttonsRepeater
        //defining a template for every entry
        delegate: TabButton{
            id : control
            text: model.text

            Layout.fillWidth: true
            checked: root.currentIndex === index

            onClicked: {
                root.currentIndex = index
            }

            //modifying the buttons

            background: Rectangle{
                radius: 8
                Behavior on color { ColorAnimation {duration: 200}}

                color: {
                    //depending on hover, click or default

                    if (control.checked){
                        return "#202224";
                    }
                    else if(control.hovered){
                        return "#141617";
                    }
                    else{
                        return "transparent";
                    }
                }
            }

            contentItem: Text {
                text: control.text
                font: control.font

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                //font.bold: control.checked
                color: control.checked ? "#005cc5" : "#9D9D9E"
            }

        }
    }
}
