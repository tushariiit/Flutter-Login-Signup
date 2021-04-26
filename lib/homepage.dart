import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';


class Home extends StatelessWidget {
 Home({Key key, this.title, this.uid}) : super(key: key); //update this to include the uid in the constructor
  final String uid;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                      (Route<dynamic> route) => false);
                });
              },
            )
          ],
        ),
        body: 
        Container(
        child: Container(
            ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: ()=>{
          print("TITLE "+title)

        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 50.0),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    }
}