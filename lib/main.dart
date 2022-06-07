import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flowers_app/pages/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp>_initialization=Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context,snapshot){
        if(snapshot.hasError){
          print("something went wrong");
        }
        if(snapshot.connectionState== ConnectionState.waiting){
          return Center (child : CircularProgressIndicator());
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Email & Password',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage(),

        );

      },
    )
    ;


  }

}

