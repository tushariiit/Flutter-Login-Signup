/*
Not stored Gender in the firestore from the signup page
Can add the same if required

*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage.dart';
enum Gender { Male, Female, Others }

class signup extends StatefulWidget{
HomePage createState()=> HomePage();
}
class HomePage extends State <signup>{
Gender _site = Gender.Male;
  String email = '';
  String password = '';
  String userName = 'Anonymous';
//  String password = '';
@override
Widget build(BuildContext context) {



  return Scaffold(
    appBar: AppBar(

        title: Text("Sign Up"),
        centerTitle:  true

    ),
    body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 50, 10, 40),
            child: Column(
                children: <Widget>[

                  Container(

                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:  Text('User Name',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.21),
                        ),
                      )
                  ),

                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                    ),
                    onChanged: (value) {
                            setState(() {
                              if(value=='' || value==null){
                                userName = 'Anonymous';
                              }
                              userName = value;
                            });
                          },
                  ),
                  SizedBox(height: 20,),
                  Row(children: <Widget>[
                    Container(

                        child: Align(
                          alignment: Alignment.centerLeft,
                          child:  Text('Gender',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.21),
                          ),
                        )
                    ),
                Expanded(child: Column(children: <Widget>[
                  RadioListTile<Gender>(
                        title: const Text('Male'),
                          value: Gender.Male,
                          groupValue: _site,
                          onChanged: (Gender value) {
                            setState(() {
                              _site = value;
                            });
                          },
                        // ),
                      ),
                  RadioListTile<Gender>(
                        title: const Text('Female'),
                          value: Gender.Female,
                          groupValue: _site,
                          onChanged: (Gender value) {
                            setState(() {
                              _site = value;
                            });
                          },
                        // ),
                      ),
                  RadioListTile<Gender>(
                        title: const Text('Others'),
                          value: Gender.Others,
                          groupValue: _site,
                          onChanged: (Gender value) {
                            setState(() {
                              _site = value;
                            });
                          },
                        // ),
                      ),

                    ])),





                  ]),
                  SizedBox(height: 20,),
                  Container(

                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:  Text('Email Address',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.21),
                        ),
                      )
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
                  SizedBox(height: 20,),
                  Container(

                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:  Text('Password',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.21),
                        ),
                      )
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
                  SizedBox(height: 30,),
                  RaisedButton(onPressed: ()=>{

                      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password)
          .then((currentUser) => FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.user.uid)
            .set({
            "uid": currentUser.user.uid,
            "fname": userName,
            // "gender": _site,
            "email": email,
            })
            .then((result) => {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(
                      title: userName+'Task ',
                      uid: currentUser.user.uid,
                    )),
                (_) => false),
              })
            .catchError((err) => print(err)))
          .catchError((err) => print(err))


                  },
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: new Text("Register")),
                  SizedBox(height: 20,),

                  Container(
                    margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child:  Row(

                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child:  Text("Already have an account?   ",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Login'),
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


