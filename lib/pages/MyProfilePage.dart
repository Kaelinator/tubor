import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProfilePage extends StatelessWidget {

  final DocumentSnapshot snapshot;
  MyProfilePage({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.greenAccent,
        child: Scaffold(
            appBar: AppBar(
              title: Text('My Profile'),
            ),
            backgroundColor: Colors.blueGrey,
            body: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/DefaultGuy.png'),
                        minRadius: 50,
                        maxRadius: 100,
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
