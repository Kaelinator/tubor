import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './HomePage.dart';
import './LoginPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  bool _loggedIn = false;

  @override
  void initState() {

    FirebaseAuth.instance
      .currentUser()
      .then((FirebaseUser user) {
        setState(() {
          _loggedIn = (user == null);
        });
      });

    FirebaseAuth.instance
      .onAuthStateChanged
      .listen((FirebaseUser user) {
        bool loggedIn = (user != null);
        print('log changed! $loggedIn');
        setState(() {
          _loggedIn = loggedIn;
        });
      });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print('rebuilding welcome! $_loggedIn');
    return Container(
      child: (_loggedIn) ? HomePage() : LoginPage()
    );
  }
}