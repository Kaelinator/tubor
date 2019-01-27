import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/SessionItem.dart';

class SessionList extends StatelessWidget {

  final subjectId;
  SessionList(this.subjectId);

  @override
  Widget build(BuildContext context) {
    CollectionReference ref = Firestore.instance
      .collection('events');
      // .where('');

    Stream<QuerySnapshot> stream = (subjectId == null)
      ? ref.snapshots()
      : ref.where('subject', isEqualTo: subjectId)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return Text('Loading...');
          default:
            return ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return SessionItem(snapshot: document);
              }).toList(),
            );
        }
      },
    );
  }
}