import 'package:flutter/material.dart';
import '../widgets/UpcomingItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpcomingList extends StatelessWidget {
  Widget _renderTiles(List<DocumentSnapshot> documents) {

    return ListView(
      children: documents.map((DocumentSnapshot document) {
        return UpcomingItem(snapshot: document);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading...');
            default:
              return _renderTiles(snapshot.data.documents);
          }
        },
      ),
    );
  }
}
