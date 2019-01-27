import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SessionItem extends StatefulWidget {
  final DocumentSnapshot snapshot;
  SessionItem({this.snapshot});

  @override
  _SessionItemState createState() => _SessionItemState(snapshot: this.snapshot);
}

class _SessionItemState extends State<SessionItem> {
  
  final DocumentSnapshot snapshot;
  _SessionItemState({this.snapshot});

  String subject = "";

  @override
  void initState() {
    
    Firestore.instance
      .collection('subjects')
      .document(snapshot['subject'])
      .get()
      .then((DocumentSnapshot subjectSnap) {
        setState(() {
          subject = subjectSnap['subcategory'];
        });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Image(
            image: AssetImage('assets/DefaultGuy.png'), 
            /* (snapshot['photo'] != null)
            ? NetworkImage('${snapshot['photo']}')
            : AssetImage('assets/DefaultGuy.png'),*/
            width: 50,
            height: 50),
          title: Text('$subject Session'),
          subtitle: Text(
            // 'Tutor: (tutorName)\n' +
            'Starts: ${snapshot['start']}\n' +
            'Ends: ${snapshot['end']}\n' +
            'Slots Available: ${(snapshot['size'] ?? 0) - snapshot['enrolledStudents'].length}\n' +
            'Cost: \$${snapshot['cost']}'
              ),
        ),
        ButtonTheme.bar(
          child: ButtonBar(
          children: <Widget>[
            FlatButton(child: Text('Join Session'), onPressed: () {
              FirebaseAuth.instance
                .currentUser()
                .then((FirebaseUser user) {
                  
                  Firestore.instance
                    .collection('events')
                    .document(snapshot.documentID)
                    .updateData({ 'enrolledStudents': [ user.uid ] });

                });
            })
          ],
        ))
      ],
    )));
  }
}