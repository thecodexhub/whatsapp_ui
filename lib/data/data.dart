import 'package:flutter/material.dart';
import 'package:whatsappui/model/call_model.dart';
import 'package:whatsappui/model/chat_model.dart';
import 'package:whatsappui/model/status_model.dart';

class ChatData {
  static var chatDataList = [
    ChatModel(
        name: "Alex",
        imageUrl: "assets/boy1.jpg",
        recentMessage: "Hey, are you free now?",
        date: "9:49 pm"),
    ChatModel(
        name: "Illeana",
        imageUrl: "assets/girl4.jpg",
        recentMessage: "Hey, are you free now?",
        date: "9:34 pm"),
    ChatModel(
        name: "Sean Kong",
        imageUrl: "assets/girl1.jpg",
        recentMessage: "Hey, are you free now?",
        date: "5:16 pm"),
    ChatModel(
        name: "Elijah Heitt",
        imageUrl: "assets/boy2.jpg",
        recentMessage: "Hey, are you free now?",
        date: "Yesterday"),
    ChatModel(
        name: "Robert",
        imageUrl: "assets/boy3.jpg",
        recentMessage: "Hey, are you free now?",
        date: "Yesterday"),
    ChatModel(
        name: "Matheus Ferrero",
        imageUrl: "assets/girl2.jpg",
        recentMessage: "Hey, are you free now?",
        date: "06/05/2020"),
    ChatModel(
        name: "Oliver",
        imageUrl: "assets/girl3.jpg",
        recentMessage: "Hey, are you free now?",
        date: "06/05/2020"),
    ChatModel(
        name: "Milan",
        imageUrl: "assets/boy4.jpg",
        recentMessage: "Hey, are you free now?",
        date: "06/05/2020"),
    ChatModel(
        name: "Imansyah",
        imageUrl: "assets/boy5.jpg",
        recentMessage: "Hey, are you free now?",
        date: "06/05/2020"),
    ChatModel(
        name: "Godwin Robert",
        imageUrl: "assets/boy6.jpg",
        recentMessage: "Hey, are you free now?",
        date: "06/05/2020"),
  ];

  static ChatModel getChat(int index) {
    return chatDataList[index];
  }

  static var itemCount = chatDataList.length;
}

class StatusData {
  static var statusDataList = [
    StatusModel(name: "Godwin Robert",
        imageUrl: "assets/boy6.jpg", dateTime: "Today, 9:49 pm"),
    StatusModel(name: "Imansyah",
        imageUrl: "assets/boy5.jpg", dateTime: "Today, 9:19 pm"),
    StatusModel(name: "Milan",
        imageUrl: "assets/boy4.jpg", dateTime: "Today, 7:49 pm"),
    StatusModel(name: "Oliver",
        imageUrl: "assets/girl3.jpg", dateTime: "Today, 6:32 pm"),
    StatusModel(name: "Matheus Ferrero",
        imageUrl: "assets/girl2.jpg", dateTime: "Today, 5:18 pm"),
    StatusModel(name: "Robert",
        imageUrl: "assets/boy3.jpg", dateTime: "Today, 2:15 pm"),
    StatusModel(name: "Elijah Heitt",
        imageUrl: "assets/boy2.jpg", dateTime: "Today, 12:10 pm"),
    StatusModel(name: "Sean Kong",
        imageUrl: "assets/girl1.jpg", dateTime: "Today, 11:48 am"),
    StatusModel(name: "Illeana",
        imageUrl: "assets/girl4.jpg", dateTime: "Today, 9:25 am"),
    StatusModel(name: "Alex",
        imageUrl: "assets/boy1.jpg", dateTime: "Today, 7:49 am"),
  ];

  static StatusModel getStatus(int index) {
    return statusDataList[index];
  }

  static var statusItemCount = statusDataList.length;
}

class CallData {
  static var callDataList = [
    CallModel(
        name: "Sean Kong",
        imageUrl: "assets/girl1.jpg",
        dateTime: "Yesterday, 8:56 am",
        callVideoIcon: Icons.call,
        incomingOutgoing: Icons.call_made,
        iconColor: Colors.green),
    CallModel(
        name: "Robert",
        imageUrl: "assets/boy3.jpg",
        dateTime: "(2) 24th April, 6:18 pm",
        callVideoIcon: Icons.videocam,
        incomingOutgoing: Icons.call_received,
        iconColor: Colors.red),
    CallModel(
        name: "Matheus Ferrero",
        imageUrl: "assets/girl2.jpg",
        dateTime: "Yesterday, 9:26 pm",
        callVideoIcon: Icons.call,
        incomingOutgoing: Icons.call_made,
        iconColor: Colors.green),
    CallModel(
        name: "Imansyah",
        imageUrl: "assets/boy5.jpg",
        dateTime: "6 May, 11:15 am",
        callVideoIcon: Icons.call,
        incomingOutgoing: Icons.call_made,
        iconColor: Colors.green),
    CallModel(
        name: "Godwin Robert",
        imageUrl: "assets/boy6.jpg",
        dateTime: "6 May, 8:25 am",
        callVideoIcon: Icons.videocam,
        incomingOutgoing: Icons.call_made,
        iconColor: Colors.green),
    CallModel(
        name: "Milan",
        imageUrl: "assets/boy4.jpg",
        dateTime: "5 May, 8:40 pm",
        callVideoIcon: Icons.videocam,
        incomingOutgoing: Icons.call_received,
        iconColor: Colors.red),
    CallModel(
        name: "Matheus Ferrero",
        imageUrl: "assets/girl2.jpg",
        dateTime: "26 April, 5:10 pm",
        callVideoIcon: Icons.call,
        incomingOutgoing: Icons.call_received,
        iconColor: Colors.red),
    CallModel(
        name: "Illeana",
        imageUrl: "assets/girl4.jpg",
        dateTime: "22 April, 10:25 pm",
        callVideoIcon: Icons.call,
        incomingOutgoing: Icons.call_made,
        iconColor: Colors.green),
    CallModel(
        name: "Elijah Heitt",
        imageUrl: "assets/boy2.jpg",
        dateTime: "14 April, 12:05 pm",
        callVideoIcon: Icons.call,
        incomingOutgoing: Icons.call_made,
        iconColor: Colors.green),
  ];

  static CallModel getCall(int index) {
    return callDataList[index];
  }

  static var callItemCount = callDataList.length;
}
