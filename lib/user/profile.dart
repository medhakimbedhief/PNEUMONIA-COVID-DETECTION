import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flowers_app/pages/login.dart';

class Profile extends StatefulWidget {


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final uid =  FirebaseAuth.instance.currentUser.uid;
  final email = FirebaseAuth.instance.currentUser.email;
  final creationTime = FirebaseAuth.instance.currentUser.metadata.creationTime;

  User user = FirebaseAuth.instance.currentUser;

  verifyEmail()async{
    if (user!=null && user.emailVerified){
      await user?.sendEmailVerification();
      print('Verification Email has been sent');

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor : Colors.black26,
          content : Text('Verification Email has been sent',
            style: TextStyle(fontSize: 18.0, color: Colors.amber),)
      ),
      );
    }
  }


  @override

  Widget build(BuildContext context) {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
      child:SingleChildScrollView(
        child: Column(
          children: [
            Padding(

              padding: const EdgeInsets.all(20.0),
              child: Image.asset("images/profile.jpg"),),
            SizedBox(height: 50.0,),
            Column(
              children: [
                Text(
                  'User ID:',
                  style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,),
                ),
                Text(
                  uid,
                  style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w300,),
                ),
              ],
            ),
            SizedBox(height: 50.0,),



            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Email: $email',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300,),
                ),


                user.emailVerified
                    ?

                Text( 'Verified',
                  style: TextStyle(fontSize: 22.0, color: Colors.lightBlue),
                )
                    :
                TextButton(onPressed: () => {
                  verifyEmail()
                },

                  child: Text('Verify Email',
                    style: TextStyle(fontSize: 22.0, color: Colors.lightBlue),),
                ),
              ],
            ),
            SizedBox(height: 50.0,),
            Column(

              children: [
                Text('Created :',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  creationTime.toString(),
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300,),
                ),

              ],
            ),
            SizedBox(height: 50.0,),

            ElevatedButton(onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage(),), (route) => false);

            },
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),);
  }
}
