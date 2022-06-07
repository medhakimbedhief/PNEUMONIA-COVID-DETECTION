
import 'package:flutter/material.dart';
import 'package:flowers_app/user/splashscreen.dart';
import 'package:camera/camera.dart';

void main() {
  runApp(ScanImage());
}

class ScanImage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pneumonia and Covid Classifier',
      home: MySplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}


