import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/TimePickerItem.dart';
import '../utils/Session.dart';

class MyProfilePage extends StatelessWidget {
  final DocumentReference reference;
  final DocumentSnapshot snapshot;
  MyProfilePage({this.snapshot, this.reference});

  void _logout(BuildContext context) {
    FirebaseAuth.instance.signOut().then((void x) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (snapshot == null) return Container(child: Text('loading'));
    return Material(
        color: Colors.greenAccent,
        child: Scaffold(
            appBar: AppBar(
              title: Text('My Profile'),
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Center(
                    child: InkWell(
                  onLongPress: () => print('change profile'),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: CircleAvatar(
                      backgroundImage: (snapshot['photo'] != null)
                          ? NetworkImage("${snapshot['photo']}")
                          : AssetImage('assets/DefaultGuy.png'),
                      minRadius: 50,
                      maxRadius: 100,
                    ),
                  ),
                )),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "${snapshot['name']}\n${snapshot['email']}\n\nBio",
                    style: new TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    maxLines: 4,
                    maxLength: 150,
                    maxLengthEnforced: true,
                  ),
                ),
                Calendar(
                  isExpandable: true,
                  onDateSelected: (dateTime) {
                    showDialog<Session>(
                      context: context,
                      builder: (BuildContext ctx) {
                        return SimpleDialog(
                          title: const Text('Select assignment'),
                          children: <Widget>[
                            TimePickerItem(onDone: (Session session) {
                              Navigator.pop(ctx, session);
                            }
                            )
                          ]
                        );
                      }
                    ).then((Session s) {
                      print('${s.startTime} ${s.cost}');
                    });
                    
                  },

                ),
                RaisedButton(
                  child: Text("Sign Out"),
                  onPressed: () => _logout(context),
                ),
              ],
            ))));
  }
}
