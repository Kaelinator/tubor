import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorSchedule extends StatelessWidget {

  final DocumentSnapshot snapshot;
  TutorSchedule({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      // child: Text('This is the tutor profile of ${snapshot['name']}'),
      ),
    );
  }
}