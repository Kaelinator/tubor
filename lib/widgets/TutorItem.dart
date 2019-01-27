import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../pages/TutorProfilePage.dart';

class TutorItem extends StatelessWidget {
  final DocumentSnapshot snapshot;
  final f = NumberFormat("#.0", "en_US");

  TutorItem({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(snapshot['name']),
      subtitle: Text('${snapshot['rating'] ?? 'subjects unknown'}'),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://i.imgur.com/BoN9kdC.png"))),
      ),
      trailing: Text((snapshot['rating'] != null
          ? '${f.format(snapshot['rating'])} / 5.0'
          : 'No rating')),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TutorProfilePage(snapshot: snapshot)));
      },
    );
  }
}
