import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flowers_app/user/home.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: Home(),
      title: Text('Pneumonia and covid Classifier',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.blueGrey,
          )
      ),
      image: Image.asset(
        'images/covid.jpg',
      ),
      backgroundColor: Colors.white,
      photoSize: 60,
      loaderColor: Colors.blueGrey,
    );
  }
}
