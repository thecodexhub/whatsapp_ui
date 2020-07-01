import 'package:flutter/material.dart';
import 'package:whatsappui/constants.dart';
import 'package:whatsappui/data/data.dart';
import 'package:whatsappui/model/status_model.dart';
import 'package:whatsappui/screens/status_view_screen.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  Widget _buildStatusItem(context, statusItemModel, index) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatusViewScreen(
          avatarImage: statusItemModel.imageUrl,
          name: statusItemModel.name,
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
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: kWhatsAppStatusGreen, width: 3.2)),
                      padding: EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(statusItemModel.imageUrl),
                        radius: 30.0,
                      ),
                    ),
                    SizedBox(height: 16.0)
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
                            Text(
                              statusItemModel.name,
                              style: kTitleTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(statusItemModel.dateTime,
                                style: kLabelTextStyle),
                          ],
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Divider(
                        color: Colors.grey[400],
                        thickness: 0.8,
                      )
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
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return null;
      },
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 8.0, right: 12.0, top: 8.0, bottom: 12.0),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/me.jpg"),
                                radius: 30.0,
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Icon(
                                  Icons.add_circle,
                                  color: kWhatsAppLightGreen,
                                ),
                              ),
                            )
                          ],
                        )),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text("My Status", style: kTitleTextStyle),
                                      Text(
                                        "Tap to add status update",
                                        style: kLabelTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
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
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 12.0, top: 8.0, bottom: 8.0),
                    child: Text(
                      "Recent updates",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            );
          } else {
            StatusModel statusItemModel = StatusData.getStatus(index - 1);
            if (index == StatusData.statusItemCount) {
              return Padding(
                padding: EdgeInsets.only(bottom: 80.0),
                child: _buildStatusItem(context, statusItemModel, index),
              );
            } else {
              return _buildStatusItem(context, statusItemModel, index);
            }
          }
        },
        itemCount: StatusData.statusItemCount + 1,
      ),
    );
  }
}
