import 'package:flutter/material.dart';
import 'package:whatsappui/constants.dart';
import 'package:bubble/bubble.dart';
import 'package:whatsappui/screens/whatsapp_calling_screen.dart';

class ChatRoomScreen extends StatefulWidget {
  final String avatarImage;
  final String name;

  ChatRoomScreen({this.avatarImage, this.name});

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final avatarRadius = 20.0;

  Widget buildChatMessages(bool isFirstMessage, bool isMe, bool isSeen,
      bool isReceived, bool isSent, bool isImage, String string, String time) {
    return Bubble(
      alignment: isMe ? Alignment.topRight : Alignment.topLeft,
      margin: isMe
          ? BubbleEdges.only(top: 4.0, left: 120.0)
          : BubbleEdges.only(top: 4.0, right: 120.0),
      color: isMe ? Colors.white : Color.fromRGBO(225, 255, 199, 1.0),
      nip: isFirstMessage
          ? isMe ? BubbleNip.rightTop : BubbleNip.leftTop
          : BubbleNip.no,
      child: Stack(
        children: <Widget>[
          isImage
              ? Image(
                  image: AssetImage(string),
                  fit: BoxFit.cover,
                )
              : Text(
                  "$string                   \b",
                  style: kChatTextStyle,
                ),
          Positioned(
            bottom: isImage ? 2.0 : 0.0,
            right: isImage ? 2.0 : 0.0,
            child: Row(
              children: <Widget>[
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 12.5,
                      color: isImage ? Colors.grey[200] : Colors.grey[500]),
                ),
                isMe ? SizedBox(width: 1.0) : Container(),
                isMe
                    ? isSeen
                        ? Icon(
                            Icons.done_all,
                            color: Colors.blueAccent,
                            size: 16.0,
                          )
                        : isReceived
                            ? Icon(
                                Icons.done_all,
                                size: 16.0,
                                color: isImage
                                    ? Colors.grey[200]
                                    : Colors.grey[700],
                              )
                            : isSent
                                ? Icon(
                                    Icons.done,
                                    size: 16.0,
                                    color: isImage
                                        ? Colors.grey[200]
                                        : Colors.grey[700],
                                  )
                                : Icon(
                                    Icons.access_time,
                                    size: 16.0,
                                    color: isImage
                                        ? Colors.grey[200]
                                        : Colors.grey[700],
                                  )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhatsAppGreen,
        title: MediaQuery.removePadding(
          context: context,
          removeLeft: true,
          child: Row(
            children: <Widget>[
              ButtonTheme(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                child: FlatButton(
                  padding: EdgeInsets.all(1.8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  highlightColor: kWhatsAppStatusGreen,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      SizedBox(width: 2.0),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          widget.avatarImage,
                        ),
                        radius: avatarRadius,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        "yesterday at 9:57 pm",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[200],
                        ),
                      ),
                      SizedBox(height: 3.0),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: Icon(Icons.call), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => WhatsAppCallingScreen(
              name: widget.name,
              imageUrl: widget.avatarImage,
            )));
          }),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/background.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: ListView(
                  padding: EdgeInsets.all(8.0),
                  children: <Widget>[
                    Bubble(
                      color: Color.fromRGBO(212, 234, 244, 1.0),
                      alignment: Alignment.center,
                      child: Text(
                        "YESTERDAY",
                        style: kChatTextStyle,
                      ),
                    ),
                    buildChatMessages(
                      true,
                      false,
                      true,
                      false,
                      false,
                      false,
                      "Hey bro, are you there?",
                      "9:23 pm",
                    ),
                    buildChatMessages(
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      "🤔",
                      "9:24 pm",
                    ),
                    buildChatMessages(
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      "Ya, what happened? Is everything okay?",
                      "9:27 pm",
                    ),
                    buildChatMessages(
                      false,
                      true,
                      true,
                      false,
                      false,
                      true,
                      "assets/image1.jpg",
                      "9:42 pm",
                    ),
                    buildChatMessages(
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      "Wow, you're good in Photoshop!.",
                      "9:55 pm",
                    ),
                    buildChatMessages(
                      true,
                      true,
                      false,
                      true,
                      true,
                      false,
                      "😂😂😂😂😂😂",
                      "9:57 pm",
                    ),
                    buildChatMessages(
                      false,
                      true,
                      false,
                      false,
                      true,
                      false,
                      "You're very funny",
                      "9:58 pm",
                    ),
                    buildChatMessages(
                      false,
                      true,
                      false,
                      false,
                      false,
                      false,
                      "See you soon",
                      "10:00 pm",
                    )
                  ],
                ),
              )),
              Container(
                height: 60.0,
                padding: EdgeInsets.all(4.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.insert_emoticon,
                              size: 28.0,
                              color: Colors.grey[600],
                            ),
                            onPressed: () {},
                          ),
                          Expanded(
                            child: Container(
                              child: TextField(
                                enabled: true,
                                showCursor: true,
                                cursorColor: kWhatsAppStatusGreen,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type a message",
                                  hintStyle: kHintTextStyle,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.attach_file,
                              size: 28.0,
                              color: Colors.grey[600],
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              size: 28.0,
                              color: Colors.grey[600],
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )),
                    SizedBox(width: 5.0),
                    ButtonTheme(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minWidth: 0,
                      height: 0,
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        color: kWhatsAppGreen,
                        shape: CircleBorder(),
                        highlightColor: kWhatsAppStatusGreen,
                        onPressed: () {},
                        child: Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
