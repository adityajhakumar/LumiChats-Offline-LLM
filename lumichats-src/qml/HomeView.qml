import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import llm
import chatlistmodel
import download
import modellist
import network
import gpt4all
import mysettings

Rectangle {
    id: homeView

    Theme {
        id: theme
    }

    color: theme.viewBackground
    signal chatViewRequested()
    signal localDocsViewRequested()
    signal settingsViewRequested(int page)
    signal addModelViewRequested()
    property bool shouldShowFirstStart: false

    ColumnLayout {
        id: mainArea
        anchors.fill: parent
        anchors.margins: 30
        spacing: 30

        ColumnLayout {
            Layout.fillWidth: true
            Layout.maximumWidth: 1530
            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: 20
            spacing: 30

            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 10

                // LumiChats title with orange accent word
                Row {
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 0

                    Text {
                        text: qsTr("Welcome to ")
                        font.pixelSize: theme.fontSizeBannerLarge
                        font.bold: true
                        color: theme.titleTextColor
                    }
                    Text {
                        text: qsTr("LumiChats")
                        font.pixelSize: theme.fontSizeBannerLarge
                        font.bold: true
                        color: "#F97316"
                    }
                }

                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Run powerful AI models offline — private, fast, and free.")
                    font.pixelSize: theme.fontSizeLarge
                    color: theme.titleInfoTextColor
                }

                // Orange accent divider line
                Rectangle {
                    Layout.alignment: Qt.AlignHCenter
                    width: 48
                    height: 3
                    radius: 2
                    color: "#F97316"
                    opacity: 0.8
                }
            }

            MyButton {
                id: startChat
                visible: shouldShowFirstStart
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Start chatting")
                onClicked: {
                    chatViewRequested()
                }
            }

            RowLayout {
                spacing: 15
                visible: !startChat.visible
                Layout.alignment: Qt.AlignHCenter

                MyWelcomeButton {
                    Layout.fillWidth: true
                    Layout.maximumWidth: 150 + 200 * theme.fontScale
                    Layout.preferredHeight: 40 + 90 * theme.fontScale
                    text: qsTr("Start Chatting")
                    description: qsTr("Chat with any LLM")
                    imageSource: "qrc:/gpt4all/icons/chat.svg"
                    onClicked: {
                        chatViewRequested()
                    }
                }
                MyWelcomeButton {
                    Layout.fillWidth: true
                    Layout.maximumWidth: 150 + 200 * theme.fontScale
                    Layout.preferredHeight: 40 + 90 * theme.fontScale
                    text: qsTr("LocalDocs")
                    description: qsTr("Chat with your local files")
                    imageSource: "qrc:/gpt4all/icons/db.svg"
                    onClicked: {
                        localDocsViewRequested()
                    }
                }
                MyWelcomeButton {
                    Layout.fillWidth: true
                    Layout.maximumWidth: 150 + 200 * theme.fontScale
                    Layout.preferredHeight: 40 + 90 * theme.fontScale
                    text: qsTr("Find Models")
                    description: qsTr("Explore and download models")
                    imageSource: "qrc:/gpt4all/icons/models.svg"
                    onClicked: {
                        addModelViewRequested()
                    }
                }
            }

            Item {
                visible: !startChat.visible && Download.latestNews !== ""
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumHeight: 120
                Layout.maximumHeight: textAreaNews.height

                Rectangle {
                    id: roundedFrameNews // latest news
                    anchors.fill: parent
                    z: 299
                    radius: 10
                    border.width: 1
                    border.color: theme.controlBorder
                    color: "transparent"
                    clip: true
                }

                Item {
                    anchors.fill: parent
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: Rectangle {
                            width: roundedFrameNews.width
                            height: roundedFrameNews.height
                            radius: 10
                        }
                    }

                    RowLayout {
                        spacing: 0
                        anchors.fill: parent
                        Rectangle {
                            color: "transparent"
                            width: 82
                            height: 100
                            Image {
                                id: newsImg
                                anchors.centerIn: parent
                                sourceSize: Qt.size(48, 48)
                                mipmap: true
                                visible: false
                                source: "qrc:/gpt4all/icons/gpt4all-48.png"
                            }

                            ColorOverlay {
                                anchors.fill: newsImg
                                source: newsImg
                                color: theme.styledTextColor
                            }
                        }

                        Item {
                            id: myItem
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Rectangle {
                                anchors.fill: parent
                                color: theme.conversationBackground
                            }

                            ScrollView {
                                id: newsScroll
                                anchors.fill: parent
                                clip: true
                                ScrollBar.vertical.policy: ScrollBar.AsNeeded
                                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                                Text {
                                    id: textAreaNews
                                    width: myItem.width
                                    padding: 20
                                    color: theme.styledTextColor
                                    font.pixelSize: theme.fontSizeLarger
                                    textFormat: TextEdit.MarkdownText
                                    wrapMode: Text.WordWrap
                                    text: Download.latestNews !== "" ? Download.latestNews :
                                        "## LumiChats Offline v1.0 Released\n\n" +
                                        "We are excited to announce **LumiChats Offline** — run powerful AI models entirely on your device, privately and for free.\n\n" +
                                        "**Highlights:**\n" +
                                        "- Fully offline — zero data sent anywhere, ever\n" +
                                        "- Supports Qwen, LLaMA, Mistral, DeepSeek and more\n" +
                                        "- LocalDocs: chat directly with your own PDF, Word and text files\n" +
                                        "- CPU-only mode — no GPU required\n" +
                                        "- Clean, minimal interface built for focus\n\n" +
                                        "Visit [lumichats.com](https://lumichats.com) to learn more."
                                    focus: false
                                    Accessible.role: Accessible.Paragraph
                                    Accessible.name: qsTr("Latest news")
                                    Accessible.description: qsTr("Latest news from LumiChats")
                                    onLinkActivated: function(link) {
                                        Qt.openUrlExternally(link);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: linkBar
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
            border.width: 1
            border.color: theme.dividerColor
            radius: 6
            z: 200
            height: 30
            color: theme.conversationBackground

            RowLayout {
                anchors.fill: parent
                spacing: 0
                RowLayout {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    spacing: 4

                    MyFancyLink {
                        text: qsTr("LumiChats Changelog")
                        imageSource: "qrc:/gpt4all/icons/notes.svg"
                        onClicked: { Qt.openUrlExternally("https://lumichats.com/changelog") }
                    }

                    MyFancyLink {
                        text: qsTr("Documentation")
                        imageSource: "qrc:/gpt4all/icons/info.svg"
                        onClicked: { Qt.openUrlExternally("https://lumichats.com/docs/offline") }
                    }

                    MyFancyLink {
                        visible: false
                        text: qsTr("Discord")
                        imageSource: "qrc:/gpt4all/icons/discord.svg"
                        onClicked: { Qt.openUrlExternally("https://discord.gg/4M2QFmTt2k") }
                    }

                    MyFancyLink {
                        visible: false
                        text: qsTr("X (Twitter)")
                        imageSource: "qrc:/gpt4all/icons/twitter.svg"
                        onClicked: { Qt.openUrlExternally("https://twitter.com/nomic_ai") }
                    }

                    MyFancyLink {
                        text: qsTr("Github")
                        imageSource: "qrc:/gpt4all/icons/github.svg"
                        onClicked: { Qt.openUrlExternally("https://github.com/adityajhakumar") }
                    }
                }

                RowLayout {
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    spacing: 40

                    MyFancyLink {
                        text: qsTr("lumichats.com")
                        imageSource: "qrc:/gpt4all/icons/globe.svg"
                        onClicked: { Qt.openUrlExternally("https://lumichats.com") }
                        rightPadding: 15
                    }
                }
            }
        }
    }

    Rectangle {
        anchors.top: mainArea.top
        anchors.right: mainArea.right
        border.width: 1
        border.color: theme.dividerColor
        radius: 6
        z: 200
        height: 30
        color: theme.conversationBackground
        width: subscribeLink.width
        RowLayout {
            anchors.centerIn: parent
            MyFancyLink {
                id: subscribeLink
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Visit LumiChats")
                imageSource: "qrc:/gpt4all/icons/email.svg"
                onClicked: { Qt.openUrlExternally("https://lumichats.com") }
            }
        }
    }
}
