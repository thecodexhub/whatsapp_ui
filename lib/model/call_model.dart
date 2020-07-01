import 'package:flutter/material.dart';

class CallModel {

  final String name;
  final String imageUrl;
  final String dateTime;
  final IconData callVideoIcon;
  final IconData incomingOutgoing;
  final Color iconColor;

  CallModel({
    this.name,
    this.imageUrl,
    this.dateTime,
    this.callVideoIcon,
    this.incomingOutgoing,
    this.iconColor
});

}