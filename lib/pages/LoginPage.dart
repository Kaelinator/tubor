import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './CreateAccount.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginState();
}

class LoginState extends State<LoginPage> {
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
                        image: AssetImage("assets/kseLogo.png"),
                        fit: BoxFit.scaleDown,
                        width: (MediaQuery.of(context).size.width * 0.65),
                        height: (MediaQuery.of(context).size.width * 0.65),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(40),
                    child: Form(
                        child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Enter Email",
                              fillColor: Colors.white.withAlpha(0xde),
                              ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter an email.';
                            }
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration:
                              InputDecoration(labelText: "Enter Password"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a password.';
                            }
                          },
                        ),
                        RaisedButton(
                            child: Text("Create Account"),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreateAccount()));
                            })
                      ],
                    )))
              ],
            ))));
  }
}
