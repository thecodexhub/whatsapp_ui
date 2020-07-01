import 'package:flutter/material.dart';
import 'dart:async';
import 'package:whatsappui/landing_page.dart';
import 'package:camera/camera.dart';


List<CameraDescription> cameras;
void logError(String code, String message) => print("Error: $code \nError message: $message");

Future<void> main() async {
  runApp(MyApp());
  try {
    cameras = await availableCameras();
  } on CameraException catch(e) {
    logError(e.code, e.description);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter WhatsApp UI',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}