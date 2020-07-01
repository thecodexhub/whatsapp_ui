import 'package:flutter/material.dart';
import 'package:whatsappui/constants.dart';
import 'package:whatsappui/data/data.dart';
import 'package:whatsappui/model/chat_model.dart';
import 'package:whatsappui/screens/chat_room_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  Widget _buildChatItem(context, chatModelItem, index){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatRoomScreen(
          avatarImage: chatModelItem.imageUrl,
          name: chatModelItem.name,
        )));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(chatModelItem.imageUrl),
                      radius: 30.0,
                    ),
                    SizedBox(height: 20.0)
                  ],
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text(chatModelItem.name, style: kTitleTextStyle, maxLines: 1, overflow: TextOverflow.ellipsis,)),
                                Text(chatModelItem.date, style: kNumberTextStyle, maxLines: 1, overflow: TextOverflow.ellipsis,)
                              ],
                            ),
                            Text(chatModelItem.recentMessage, style: kLabelTextStyle, maxLines: 1, overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Divider(color: Colors.grey[400], thickness: 0.8,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll){
        overScroll.disallowGlow();
        return null;
      },
      child: ListView.builder(
        physics: ScrollPhysics(),
        itemCount: ChatData.itemCount,
        itemBuilder: (BuildContext context, int index) {
          ChatModel chatModelItem = ChatData.getChat(index);
          if( index == 0) {
            return Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: _buildChatItem(context, chatModelItem, index),
            );
          } else if (index == ChatData.itemCount - 1){
            return Padding(
              padding: EdgeInsets.only(bottom: 80.0),
              child: _buildChatItem(context, chatModelItem, index),
            );
          } else {
            return _buildChatItem(context, chatModelItem, index);
          }
        },
      ),
    );
  }
}
