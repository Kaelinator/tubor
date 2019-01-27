import 'package:flutter/material.dart';
import '../screens/TutorList.dart';
import '../screens/UpcomingList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'MyProfilePage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  DocumentSnapshot snapshot;

  @override
  void initState() {
    FirebaseAuth.instance
      .currentUser()
      .then((FirebaseUser user) {
        return Firestore.instance
          .collection('users')
          .document(user.uid)
          .get();
      })
      .then((DocumentSnapshot snap) {
        setState(() {
          snapshot = snap;
        });
      });
    super.initState();
  }

  void _indexChange(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        InkWell(
          child: Container(
              child: CircleAvatar(
                backgroundImage: 
                (snapshot != null && snapshot['photo'] != null)
                  ? NetworkImage("${snapshot['photo']}")
                  : AssetImage('assets/DefaultGuy.png'),
                minRadius: 10,
                maxRadius: 25,
              ),
              padding: EdgeInsets.all(5)),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyProfilePage(snapshot: snapshot)));
          },
          onLongPress: () => FirebaseAuth.instance.signOut(),
        )
      ]),
      body: Stack(
        children: <Widget>[
          Offstage(
              offstage: _currentIndex != 0,
              child:
                  TickerMode(enabled: _currentIndex == 0, child: TutorList())),
          Offstage(
              offstage: _currentIndex != 1,
              child: TickerMode(
                  enabled: _currentIndex == 1,
                  child: UpcomingList() // replace with page
                  )),
          Offstage(
              offstage: _currentIndex != 2,
              child: TickerMode(
                  enabled: _currentIndex == 2,
                  child: const Text('Fundraising'))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _indexChange,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Find'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.event_available),
            title: const Text('Upcoming'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            title: const Text('History'),
          ),
        ],
      ),
    );
  }
}
