import 'package:flutter/material.dart';
import './pages/WelcomePage.dart';

bool loggedIn = false;

void main() => runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: WelcomePage()));
