import 'package:flutter/material.dart';
import 'package:whatsappui/constants.dart';

class SettingsScreen extends StatelessWidget {
  Widget _buildListTile(String title, String subTitle, IconData icon) {
    return ListTile(
      leading: IconButton(
        icon: Icon(icon, color: kWhatsAppGreen.withOpacity(0.7)),
        onPressed: () {},
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhatsAppGreen,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 33.0,
                      backgroundImage: AssetImage("assets/me.jpg"),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Sandip",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 3.0),
                          Text(
                            "Can't talk, WhatsApp only.",
                            style: TextStyle(fontSize: 16.0),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Divider(color: Colors.grey[400]),
              _buildListTile(
                  "Account", "Privacy, security, change number", Icons.lock),
              _buildListTile(
                  "Chats", "Theme, wallpapers, chat history", Icons.message),
              _buildListTile("Notifications", "Message, group & call tones",
                  Icons.notifications),
              _buildListTile("Data and storage usage",
                  "Network usage, auto-download", Icons.sync),
              _buildListTile("Help", "FAQ, contact us, privacy policy",
                  Icons.help_outline),
              SizedBox(height: 8.0),
              Divider(color: Colors.grey[400]),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.people,
                      color: kWhatsAppGreen.withOpacity(0.7)),
                  onPressed: () {},
                ),
                title: Text(
                  "Invite a friend",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "from",
                      style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      "FACEBOOK",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.2
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
