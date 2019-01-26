import 'package:flutter/material.dart';
import './pages/LoginPage.dart';
import './pages/HomePage.dart';

void main() => runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'hi'),
    ));
