import 'package:flutter/material.dart';
import './pages/CreateAccount.dart';

bool loggedIn = false;

void main() => runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      
    ),
    home: CreateAccount()));
