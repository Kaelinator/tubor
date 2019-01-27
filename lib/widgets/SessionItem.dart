import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SessionItem extends StatelessWidget {
  final subject = "Math";
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Icon(Icons.calendar_today), 
            /* (snapshot['photo'] != null)
            ? NetworkImage("${snapshot['photo']}")
            : AssetImage('assets/DefaultGuy.png'),
            width: 50,
            height: 50),*/
          title: Text("(subject) Session"),
          subtitle: Text(
              "Tutor: (tutorName) \nStarts: (start)\nEnds: (endTime)\nSlots Available: (size - enrolledStudents)\nCost: \$(cost)",
              ),
        ),
        ButtonTheme.bar(
            child: ButtonBar(
          children: <Widget>[
            FlatButton(child: Text("Cancel"), onPressed: () {/* */}),
            FlatButton(child: Text("Join Session"), onPressed: () {/* */})
          ],
        ))
      ],
    )));
  }
}
