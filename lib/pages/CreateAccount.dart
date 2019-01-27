import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomePage.dart';

class CreateAccount extends StatefulWidget {
  @override
  State createState() => Create();
}

class Create extends State<CreateAccount> {
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
                          decoration: InputDecoration(
                              labelText: "Enter Email",
                              fillColor: Colors.white),
                        ),
                       
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration:
                              InputDecoration(labelText: "Enter Password"),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration:
                              InputDecoration(labelText: "Confirm Password"),
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
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: 'hi')));
                          },
                        )
                      ],
                    )))
              ],
            ))));
  }
}
