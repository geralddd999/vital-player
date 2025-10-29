import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQml


Rectangle{
    id: topBar
    color: "#2C2C2C"
    Layout.fillWidth: true
    property alias artist : songDetailsArtist.text
    property alias album : songDetailsAlbum.text
    property alias songTitle: songDetailsTitle.text

    property int availableSpace : (topBar.width - playerDetails.width)/2

    Item{
        id: playbackButtons
        width: availableSpace ; height: parent.height
        anchors.left: parent.left
        component PlaybackControlerButton: Item{
            required property string sourceBaseName
            property int buttonSize: 28
            width: buttonSize;height:buttonSize
            anchors.verticalCenter: parent.verticalCenter
            Image{
                //width: 14;height:14
                anchors.fill: parent
                source: sourceBaseName
                MouseArea{
                    id: controlAction
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    onClicked:(mouse) => {
                        //certain action corresponding to it
                    }
                }
            }
        }

        PlaybackControlerButton{
            id: pauseplayButton
            sourceBaseName: "assets/play.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        PlaybackControlerButton{
            id: nextButton
            sourceBaseName: "assets/fast-forward.png"
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: pauseplayButton.right
        }

        PlaybackControlerButton{
            id: previousButton
            sourceBaseName: "assets/play.png"
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.right: pauseplayButton.left
        }

        PlaybackControlerButton{
            id: repeatButton
            sourceBaseName: "assets/play.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        PlaybackControlerButton{
            id: suffleButton
            sourceBaseName: "assets/play.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }

    Item{
        id: playerDetails
        anchors.horizontalCenter: parent.horizontalCenter //center in parent
        height: parent.height
        width: parent.width *0.45

        component DisplayText: Text{
            font.pixelSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
            //specify what font am i using
        }
        component TrackArtwork: Image{

        }
        Rectangle{
            color: "#4D4D4D"
            anchors.fill: parent
            anchors.topMargin: 4
            anchors.bottomMargin:4
            radius: 3
            Item{
                id: textLabels
                anchors.left: trackArtwork.right
                width: parent.width - trackArtwork.width

                DisplayText{
                    id: songDetailsTitle
                    font.bold: true
                    //x: trackArtwork.width
                    text: qsTr("Brainrot Dih")
                    anchors.top: parent.top
                }
                DisplayText{
                    id: songDetailsAlbum
                    text: qsTr("SWA")
                    anchors.top: songDetailsTitle.bottom
                }
                DisplayText{
                    id: songDetailsArtist
                    text: qsTr("Tatata sahuuur")
                    anchors.top: songDetailsAlbum.bottom
                }


            }
            ProgressBar{
                value: 0.78
                anchors.bottom: parent.bottom
                anchors.left: trackArtwork.right

                height: 4
                width: parent.width - trackArtwork.width
            }

            Image{
                id: trackArtwork
                source: "assets/ab1.png"
                width: parent.height; height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                //anchors.leftMargin: 12
            }
        }
    }
    Item{
        id: rightContainer
        width: availableSpace
        height: parent.height
        anchors.left: playerDetails.right
        anchors.bottom: parent.bottom

        Loader{
            id: configWindowLoader
            //focus: true
        }

        component VolumeBar: Rectangle{
            anchors.verticalCenter: parent.verticalCenter
            width: 42; height: 12
            color: "#ffffff"
        }
        component UserIcon: Item{
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            required property string userIconSourceName
            anchors.rightMargin: 8
            width: 50;height: 50
            Rectangle{
                radius: 180
                color: "#F2D6B3"
                anchors.fill:parent
                Image{
                    source : userIconSourceName
                    anchors.fill:parent
                }
            }

            MouseArea{
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                onClicked:(mouse) => {
                    if(mouse.button === Qt.LeftButton)
                        userIconMenu.popup()
                }
            }

            Menu{
                id: userIconMenu
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                MenuItem{
                    text: "Settings"
                    onClicked: {
                        var component = Qt.createComponent("ConfigWindow.qml")
                        var configWindowObject = component.createObject()
                        configWindowObject.show()
                    }
                }
            }
        }
        VolumeBar{
        }
        UserIcon{
            id: userProfile
            userIconSourceName: 'assets/music-icon.png'
        }
    }
}
