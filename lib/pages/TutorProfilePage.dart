import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorProfilePage extends StatelessWidget {
  final DocumentSnapshot snapshot;
  TutorProfilePage({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.greenAccent,
        child: Scaffold(
            appBar: AppBar(
              title: Text('${snapshot['name']}\'s Profile'),
            ),
            // backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: 
                          (snapshot['photo'] != null)
                            ? NetworkImage("${snapshot['photo']}")
                            : AssetImage('assets/DefaultGuy.png'),
                        minRadius: 50,
                        maxRadius: 100,
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
