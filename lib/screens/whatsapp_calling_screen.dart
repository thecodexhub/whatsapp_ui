import 'package:flutter/material.dart';
import 'package:whatsappui/constants.dart';

class WhatsAppCallingScreen extends StatelessWidget {
  final String name;
  final String imageUrl;

  WhatsAppCallingScreen({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: null),
          backgroundColor: kWhatsAppGreen,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "WHATSAPP VOICE CALL",
            style: TextStyle(color: Colors.grey[300], fontSize: 15.0),
          )),
      body: Column(
        children: <Widget>[
          Container(
            height: 85.0,
            width: MediaQuery.of(context).size.width,
            color: kWhatsAppGreen,
            padding: EdgeInsets.only(bottom: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 28.0, color: Colors.white),
                ),
                Text(
                  "RINGING",
                  style: TextStyle(color: Colors.grey[300], fontSize: 15.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 33.0,
                          backgroundColor: Colors.red[800],
                          child: Center(
                            child: Icon(
                              Icons.call_end,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 70.0,
            width: MediaQuery.of(context).size.width,
            color: kWhatsAppGreen,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.volume_up,
                      size: 26.0,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.videocam,
                      size: 26.0,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.mic_off,
                      size: 26.0,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
