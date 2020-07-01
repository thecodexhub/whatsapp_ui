import 'dart:ui';

import 'package:flutter/material.dart';

final Color kWhatsAppGreen = Color(0xFF075E54);
final Color kWhatsAppStatusGreen = Color(0xFF128C7E);
final Color kWhatsAppLightGreen = Color(0xFF25D366);

final TextStyle kTitleTextStyle = TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500);
final TextStyle kLabelTextStyle = TextStyle(fontSize: 16.0, color: Colors.grey[800]);
final TextStyle kNumberTextStyle = TextStyle(fontSize: 14.0, color: Colors.grey[800]);
final TextStyle kHintTextStyle = TextStyle(fontSize: 18.0, color: Colors.grey[500], fontWeight: FontWeight.w500);
final TextStyle kChatTextStyle = TextStyle(fontSize: 16.0, color: Colors.black);
final TextStyle kChatTimeTextStyle = TextStyle(fontSize: 14.5, color: Colors.grey[500]);



class MenuItems {
  static const String NewGroup = "New Group";
  static const String NewBroadcast = "New Broadcast";
  static const String WhatsAppWeb = "WhatsApp Web";
  static const String StarredMessages = "Starred messages";
  static const String Settings = "Settings";
  static const String StatusPrivacy = "Status Privacy";
  static const String ClearCallLog = "Clear Call Log";


  static const List<String> itemChoices = <String> [
    NewGroup,
    NewBroadcast,
    WhatsAppWeb,
    StarredMessages,
    Settings
  ];

  static const List<String> statusItemChoices = <String>[
    StatusPrivacy,
    Settings,
  ];

  static const List<String> callItemChoices = <String>[
    ClearCallLog,
    Settings,
  ];


}