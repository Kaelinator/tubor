import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SessionItem extends StatefulWidget {
  final DocumentSnapshot snapshot;
  SessionItem({this.snapshot});

  @override
  _SessionItemState createState() => _SessionItemState(snapshot: this.snapshot);
}

class _SessionItemState extends State<SessionItem> {
  
  final DocumentSnapshot snapshot;
  _SessionItemState({this.snapshot});

  String subjects = "";

  @override
  void initState() {
    
    // snapshot['subjects'].map((String id) {
    //   return Firestore.instance
    //     .collection('subjects')
    //     .document(id)
    //     .get()
    //     .then((DocumentSnapshot snap) => snap['subcategory'])
    //     .then((dynamic sub) {
    //       setState(() {
    //         subjects = '$sub $subjects';
    //       });
    //     });
    // });

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
          title: Text('$subjects Session'),
          subtitle: Text(
            // 'Tutor: (tutorName)\n' +
            'Starts: ${snapshot['start']}\n' +
            'Ends: ${snapshot['end']}\n' +
            'Slots Available: ${(snapshot['size'] ?? 0) - snapshot['enrolledStudents'].length}\n' +
            'Cost: ${snapshot['cost']}'
              ),
        ),
        ButtonTheme.bar(
            child: ButtonBar(
          children: <Widget>[
            FlatButton(child: Text('Cancel'), onPressed: () {/* */}),
            FlatButton(child: Text('Join Session'), onPressed: () {/* */})
          ],
        ))
      ],
    )));
  }
}