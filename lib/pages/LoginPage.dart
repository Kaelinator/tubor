import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< HEAD
=======
import 'package:firebase_auth/firebase_auth.dart';

>>>>>>> 804f094bba0fc64db4bcb1d330394eb20e262a68
import './CreateAccount.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final email = TextEditingController();
  final pass = TextEditingController();

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
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) => (val.isEmpty) ? 'Please enter text' : null,
                          decoration: InputDecoration(
<<<<<<< HEAD
                              labelText: "Enter Email",
                              fillColor: Colors.white.withAlpha(0xde),
                              ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter an email.';
                            }
                          },
=======
                              labelText: "Email", fillColor: Colors.white),
>>>>>>> 804f094bba0fc64db4bcb1d330394eb20e262a68
                        ),
                        TextFormField(
                          controller: pass,
                          keyboardType: TextInputType.text,
                          obscureText: true,
<<<<<<< HEAD
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
=======
                          validator: (val) => (val.isEmpty) ? 'Please enter text' : null,
                          decoration: InputDecoration(labelText: "Password"),
                        ),
                        Row(
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
                                          builder: (context) =>
                                              CreateAccount()));
                                })
                          ],
                        )
>>>>>>> 804f094bba0fc64db4bcb1d330394eb20e262a68
                      ],
                    )))
              ],
            ))));
  }
}
