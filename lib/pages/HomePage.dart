import 'package:flutter/material.dart';
import '../screens/TutorList.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _indexChange(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: InkWell(
          onTap: () => FirebaseAuth.instance.signOut(),
          child: const Text('Sign out')
        ),
      ),
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: _currentIndex != 0,
            child: TickerMode(
              enabled: _currentIndex == 0,
              child: TutorList()
            )
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: TickerMode(
              enabled: _currentIndex == 1,
              child: const Text('Forms')
            )
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child: TickerMode(
              enabled: _currentIndex == 2,
              child: const Text('Fundraising')
            )
          ),
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