import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccount extends StatefulWidget {
  @override
  State createState() => Create();
}

class Create extends State<CreateAccount> {
  final pass = TextEditingController();
  final email = TextEditingController();

  void _createAccount(BuildContext context) {

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text,
      password: pass.text
    ).then((FirebaseUser user) {
      if (user != null)
        Navigator.pop(context);
    });
  }

  Widget build(BuildContext context) {
    return Material(
        color: Colors.greenAccent,
        child: Scaffold(
            backgroundColor: Colors.blueGrey,
            body: SingleChildScrollView(
              child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage("assets/kseLogo.png"),
                  fit: BoxFit.cover,
                  width: (MediaQuery.of(context).size.width * 0.65),
                  height: (MediaQuery.of(context).size.width * 0.65),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[],
                ),
                Container(
                    padding: EdgeInsets.all(40),
                    child: Form(
                        child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: InputDecoration(
                              labelText: "Email", fillColor: Colors.white),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: pass,
                          decoration: InputDecoration(labelText: "Password"),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration:
                              InputDecoration(labelText: "Confirm Password"),
                        ), Scaffold(
appBar: AppBar(
  
),
                        ),
                        MaterialButton(
                          height: 50.0,
                          minWidth: 300.0,
                          color: Colors.green,
                          splashColor: Colors.teal,
                          textColor: Colors.white,
                          child: new Container(
                            child: new Text("Create Account"),
                          ),
                          onPressed: () => _createAccount(context),
                        )
                      ], 
                    )))
              ],
            ))));
  }
}