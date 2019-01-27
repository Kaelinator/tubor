import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './CreateAccount.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final email = TextEditingController();
  final pass = TextEditingController();
  String errorMsg = "you suck";
  final _formKey = GlobalKey<FormState>();

  void _login() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: pass.text);
  }

  Widget build(BuildContext context) {
    return Material(
        color: Colors.greenAccent,
        child: Scaffold(
            backgroundColor: Colors.blueGrey,
            body: SingleChildScrollView(
              child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/logo.png"),
                        fit: BoxFit.scaleDown,
                        width: (MediaQuery.of(context).size.width * 0.65),
                        height: (MediaQuery.of(context).size.width * 0.65),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 40,right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Login Failed: $errorMsg",style: TextStyle(color: Colors.redAccent, fontSize: 20, ),),
                      ],
                      )
                ),
                Container(
                    padding: EdgeInsets.only(left:40,right:40,bottom:40),
                    child: Form(
                        child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) => (val.isEmpty) ? 'Please enter your email' : null,
                          decoration: InputDecoration(
                              labelText: "Email",
                              fillColor: Colors.white,
                              ),
                        ),
                        TextFormField(
                          controller: pass,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: (val) => (val.isEmpty) ? 'Please enter your password' : null,
                          decoration:
                              InputDecoration(labelText: "Password"),
                        ),
                        
                        Container(
                          padding: EdgeInsets.only(top:40),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          RaisedButton(
                                child: Text("Login"),
                                onPressed: _login,
                              ),
                              RaisedButton(
                                  child: Text("Create Account"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                    builder: (context) => CreateAccount()
                                  ));
                              }
                          )
                          ],),
                        )
                      ],
                    )))
              ],
            ))));
  }
}
