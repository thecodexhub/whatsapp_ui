import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StatusViewScreen extends StatefulWidget {
  final String avatarImage;
  final String name;

  StatusViewScreen({this.avatarImage, this.name});

  @override
  _StatusViewScreenState createState() => _StatusViewScreenState();
}

class _StatusViewScreenState extends State<StatusViewScreen> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          StoryView(
            [
              StoryItem.text("Hello Everyone! This is my first status story...",
                  Colors.pinkAccent,
                  fontSize: 35.0),
              StoryItem.pageImage(
                AssetImage(widget.avatarImage),
                caption: "In London",
              )
            ],
            onStoryShow: (s) {
              print("Showing a Story");
            },
            onComplete: () {
              print("Completed a cycle");
            },
            progressPosition: ProgressPosition.top,
            repeat: true,
            controller: storyController,
          ),
          Positioned(
            left: 0.0,
            top: 40.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 28.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Container(
                        padding: EdgeInsets.all(1.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(widget.avatarImage),
                          radius: 20.0,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("7 hours ago", style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),)
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          size: 28.0,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
