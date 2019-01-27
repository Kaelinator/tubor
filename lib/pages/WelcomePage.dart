import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './HomePage.dart';
import './LoginPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  bool _loggedIn = true;

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
        setState(() {
          _loggedIn = (user == null);
        });
      });

    // FirebaseAuth.instance
    //   .signInWithEmailAndPassword(
    //     email: 'kirkkael@gmail.com',
    //     password: 'ThisIsMahPassword'
    //   );

    FirebaseAuth.instance.signOut();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: (_loggedIn) ? LoginPage() : HomePage(title: 'hi')
    );
  }
}