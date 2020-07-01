import 'package:flutter/material.dart';
import 'package:whatsappui/constants.dart';
import 'package:whatsappui/painter.dart';
import 'package:whatsappui/screens/call_screen.dart';
import 'package:whatsappui/screens/camera_screen.dart';
import 'package:whatsappui/screens/chat_screen.dart';
import 'package:whatsappui/screens/settings_screen.dart';
import 'package:whatsappui/screens/status_screen.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  TabController tabController;
  var fabIcon = Icons.message;
  bool appearAppBar = false;
  bool inSearchMode = false;
  double pointerX, pointerY;
  AnimationController _controller;
  Animation _animation;


  void onSearchTapUp(TapUpDetails tapUpDetails) {
    setState(() {
      pointerX = tapUpDetails.globalPosition.dx;
      pointerY = tapUpDetails.globalPosition.dy;
    });
    print("pointer location $pointerX, $pointerY");
    appearAppBar = true;
    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    tabController.addListener(() {
      setState(() {});
    });
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 220));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addStatusListener(animationStatusListener);
  }

  animationStatusListener(AnimationStatus animationStatus) {
    if (animationStatus == AnimationStatus.completed) {
      setState(() {
        inSearchMode = true;
      });
    } else if (animationStatus == AnimationStatus.dismissed) {
      setState(() {
        appearAppBar = false;
      });
    }
  }

  void itemChoiceAction(String choices) {
    if(choices == MenuItems.Settings){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen()));
    }
    print("WORKING");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tabWidth = width / 5;
    return Scaffold(
      appBar: appearAppBar
              ? PreferredSize(
                  child: Stack(
                    children: <Widget>[
                      AppBar(
                        backgroundColor: kWhatsAppGreen,
                        title: Text(
                          "WhatsApp",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.search,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          PopupMenuButton<String>(
                            color: Colors.grey[50],
                            icon: Icon(Icons.more_vert, size: 30.0),
                            itemBuilder: (BuildContext context) {
                              return null;
                            },
                          ),
                        ],
                      ),
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return CustomPaint(
                            painter: MyPainter(
                              containerHeight: 56.0,
                              center: Offset(pointerX ?? 0.0, pointerY ?? 0.0),
                              radius: _animation.value * width,
                              context: context,
                            ),
                          );
                        },
                      ),
                      inSearchMode
                          ? SafeArea(
                              child: Container(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_back,
                                        size: 28.0,
                                        color: kWhatsAppGreen,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          inSearchMode = false;
                                        });
                                        _controller.reverse();
                                      },
                                    ),
                                    Expanded(
                                      child: TextField(
                                        autofocus: true,
                                        cursorColor: kWhatsAppGreen,
                                        style: kLabelTextStyle,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Search...",
                                            hintStyle: kHintTextStyle),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                          : Container()
                    ],
                  ),
                  preferredSize: Size.fromHeight(56.0),
                )
              : null,
      floatingActionButton: buildFloatingActionButton(),
      body: appearAppBar
          ? TabBarView(controller: tabController, children: [
              CameraScreen(),
              ChatScreen(),
              StatusScreen(),
              CallScreen(),
            ])
          : NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    child: tabController.index == 0 ? null : SliverSafeArea(
                      top: false,
                      sliver: SliverAppBar(
                        floating: true,
                        pinned: true,
                        snap: true,
                        forceElevated: true,
                        elevation: 5.0,
                        backgroundColor: kWhatsAppGreen,
                        title: Text(
                          "WhatsApp",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: GestureDetector(
                              child: Icon(
                                Icons.search,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              onTapUp: onSearchTapUp,
                            ),
                          ),
                          PopupMenuButton<String>(
                            color: Colors.grey[50],
                            icon: Icon(Icons.more_vert, size: 30.0),
                            onSelected: itemChoiceAction,
                            itemBuilder: (BuildContext context) {
                              if (tabController.index == 1) {
                                return MenuItems.itemChoices.map((String item) {
                                  return PopupMenuItem<String>(
                                    value: item,
                                    child: Container(
                                      width: 140.0,
                                      child: Text(item),
                                    ),
                                  );
                                }).toList();
                              } else if (tabController.index == 2) {
                                return MenuItems.statusItemChoices
                                    .map((String item) {
                                  return PopupMenuItem<String>(
                                    value: item,
                                    child: Container(
                                      width: 140.0,
                                      child: Text(item),
                                    ),
                                  );
                                }).toList();
                              } else {
                                return MenuItems.callItemChoices
                                    .map((String item) {
                                  return PopupMenuItem<String>(
                                    value: item,
                                    child: Container(
                                      width: 140.0,
                                      child: Text(item),
                                    ),
                                  );
                                }).toList();
                              }
                            },
                          ),
                        ],
                        bottom: TabBar(
                          controller: tabController,
                          indicatorColor: Colors.white,
                          indicatorSize: TabBarIndicatorSize.tab,
                          isScrollable: true,
                          labelStyle: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                          tabs: <Widget>[
                            Container(
                              width: 20.0,
                              child: Tab(icon: Icon(Icons.camera_alt)),
                            ),
                            Container(
                              width: tabWidth,
                              child: Tab(text: "CHATS"),
                            ),
                            Container(
                              width: tabWidth,
                              child: Tab(text: "STATUS"),
                            ),
                            Container(
                              width: tabWidth,
                              child: Tab(text: "CALLS"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ];
              },
              body: appearAppBar
                  ? Container()
                  : MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: TabBarView(controller: tabController, children: [
                        SafeArea(
                            top: false, bottom: false, child: CameraScreen()),
                        SafeArea(
                            top: false, bottom: false, child: ChatScreen()),
                        SafeArea(
                            top: false, bottom: false, child: StatusScreen()),
                        SafeArea(
                            top: false, bottom: false, child: CallScreen()),
                      ]),
                    )),
    );
  }

  Widget buildFloatingActionButton() {
    if (tabController.index == 1) {
      return FloatingActionButton(
        onPressed: null,
        shape: StadiumBorder(),
        backgroundColor: kWhatsAppLightGreen,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      );
    } else if (tabController.index == 2) {
      return FloatingActionButton(
        onPressed: null,
        shape: StadiumBorder(),
        backgroundColor: kWhatsAppLightGreen,
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
      );
    } else if (tabController.index == 3) {
      return FloatingActionButton(
        onPressed: null,
        shape: StadiumBorder(),
        backgroundColor: kWhatsAppLightGreen,
        child: Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      );
    } else {
      return null;
    }
  }
}
