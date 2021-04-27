import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/splashscreen.dart';
import 'login.dart';
import 'signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Application ',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the IntroScreen widget.
          '/': (context) => IntroScreen(),
          // When navigating to the "/second" route, build the login widget.
          '/second': (context) => login(),
          '/third': (context) => signup(),
        }
    );
  }
}

