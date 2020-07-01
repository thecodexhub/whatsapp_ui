import 'package:flutter/material.dart';
import 'package:whatsappui/constants.dart';
import 'package:whatsappui/data/data.dart';
import 'package:whatsappui/model/call_model.dart';

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {

  Widget _buildChatItem(context, callModelItem, index){
    return Padding(
      padding: EdgeInsets.only(left: 12.0, right: 16.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(callModelItem.imageUrl),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(callModelItem.name, style: kTitleTextStyle, maxLines: 1, overflow: TextOverflow.ellipsis,),
                                Row(
                                  children: <Widget>[
                                    Icon(callModelItem.incomingOutgoing, color: callModelItem.iconColor, size: 22.0,),
                                    SizedBox(width: 5.0),
                                    Expanded(child: Text(callModelItem.dateTime, style: kLabelTextStyle, maxLines: 1, overflow: TextOverflow.ellipsis,))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Icon(callModelItem.callVideoIcon, size: 30.0, color: kWhatsAppGreen,)
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
        itemCount: CallData.callItemCount,
        itemBuilder: (BuildContext context, int index) {
          CallModel callModelItem = CallData.getCall(index);
          if( index == 0) {
            return Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: _buildChatItem(context, callModelItem, index),
            );
          } else if (index == CallData.callItemCount - 1) {
            return Padding(
              padding: EdgeInsets.only(bottom: 80.0),
              child: _buildChatItem(context, callModelItem, index),
            );
          } else {
            return _buildChatItem(context, callModelItem, index);
          }
        },
      ),
    );
  }
}
