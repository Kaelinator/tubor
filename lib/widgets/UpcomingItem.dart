import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../pages/TutorSchedule.dart';

class UpcomingItem extends StatelessWidget {
  final DocumentSnapshot snapshot;
  final f = new NumberFormat("###.0#", "en_US");

  UpcomingItem({this.snapshot});
var  list = ["Math","Science","English","Social Studies","Spanish"];
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 80,
    child: ListTile(
      title: Text(snapshot['name']),
      subtitle: Text(list[0]),
      trailing: Text("   06/19/01\n11pm-3am"),
      
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TutorSchedule(snapshot: snapshot)));
      },
     ) 

     
     );
  }
}
