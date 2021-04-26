/*
  It needs one improvement - 
  On login the after the splashscreen, the login page doesn't take parameter from Firestore;
  Line - 34 : Instead of title:"Home", it should take "fname" from Firestore
  

*/

import 'package:flutter/material.dart' ;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/login.dart';
import 'homepage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'login.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<IntroScreen> {
   @override
  String user ='';
  Widget build(BuildContext context) {
    User result = FirebaseAuth.instance.currentUser;

  
    
    return new SplashScreen(
        navigateAfterSeconds: result != null ? Home(uid: result.uid, title: "Home",) : login(),
        seconds: 5,
        title: new Text(
          'Welcome To Meet up!',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print(user),
        loaderColor: Colors.red);
  }

  }



