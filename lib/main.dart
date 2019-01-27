import 'package:flutter/material.dart';
import './pages/HomePage.dart';
import './pages/LoginPage.dart';

bool loggedIn = false;

void main() => runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: (!loggedIn) ? LoginPage() : HomePage(title: 'hi')));
