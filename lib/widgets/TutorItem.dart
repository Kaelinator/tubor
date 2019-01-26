import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorItem extends StatelessWidget {

  final DocumentSnapshot snapshot;

  TutorItem({this.snapshot})

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(snapshot['name']),
      subtitle: Text('${snapshot['count'] ?? 'unknown'}'),
    );
  }
}
