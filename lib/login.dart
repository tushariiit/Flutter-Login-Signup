import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage.dart';

class login extends StatefulWidget{
LoginPage createState()=> LoginPage();
}
class LoginPage extends State <login>{
@override

String email = '';
String password = '';
var errorMessage;
var uid_val;
// var message = 'An error occurred, please check your credentials!';
final databaseReference = FirebaseFirestore.instance;

Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(

title: Text("Login"),
    centerTitle:  true

),
body: ListView(
  children: <Widget>[
    Container(
      margin: EdgeInsets.fromLTRB(10, 80, 10, 40),
      child: Column(
          children: <Widget>[
            Image.asset('assets/images/login_img.jpg',
              height: 120,),
            SizedBox(height: 20,),
            Container(

                child: Align(
                  alignment: Alignment.centerLeft,
                  child:  Text('Email Address',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.21),
                  ),
                )
            ),
            Container(
              height: 10,
            ),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Email',

              ),
              onChanged: ( value) {
                        setState(() {
                          email = value;
                        });
                      },
      
            ),
            Container(
              height: 20,
            ),
            Container(

                child: Align(
                  alignment: Alignment.centerLeft,
                  child:  Text('Password',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.21),
                  ),
                )
            ),
            Container(
              height: 10,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              onChanged: ( value) {
                        setState(() {
                          password = value;
                        });
                      },
            ),
            Container(
                height: 30
            ),
            ElevatedButton(onPressed:  () {
                
                FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email,
                          password: password)
                      .then((authResult) => FirebaseFirestore.instance
                            .collection("users")
                          .doc(authResult.user.uid)
                          .get()
                          .then((DocumentSnapshot result) =>
                          {
                                              
                            Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>   Home(
                                            title: (result["fname"]!=null || result["fname"]!='')?result["fname"] +
                                                    "'s Tasks":'Anoynmous Task',

                                            uid: authResult.user.uid,
                                          )))

                          }
                              )
                          .catchError((err) => print("First catch")))
                      .catchError((err) => {
                        errorMessage = err.message,

                        showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
    title: Text("Alert!!!"),
    content: Text(errorMessage),
    actions: <Widget>[
      FlatButton(
      onPressed: () {
        Navigator.of(ctx).pop();
      },
      child: Text("okay"),
      ),
    ],
    ),
  )
                });

            },
              child: new Text("Login")),
            SizedBox(height: 20,),

            Container(
                margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                child:  Row(

                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child:  Text("Don't have an account?   ",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () =>{
                          Navigator.pushNamed(context, '/third')

                        },
                        child: Text('Get Started!'),
                      )


                    ]
                ),
            ),






          ]
      ),





    )

  ]
),


);


}

}
