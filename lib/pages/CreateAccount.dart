import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccount extends StatefulWidget {
  @override
  State createState() => Create();
}

class Create extends State<CreateAccount> {
  final pass = TextEditingController();
  final confirmPass = TextEditingController();
  final email = TextEditingController();
  final errorMsg = "Form incomplete";

  void _createAccount(BuildContext context) {
    if ((pass.text == confirmPass.text) && (email.text.contains("@"))) {
      //shan said regex for contains @ . com net org
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: pass.text)
          .then((FirebaseUser user) {
        if (user != null) Navigator.pop(context);
      });
    } else {
      // show error
    }
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
                Container( //errorblock
                    padding: EdgeInsets.only(left: 40,top: 30, right: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Account Creation Failed:\n",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 20),
                        ),
                        Text(
                          "$errorMsg",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 20),
                        ),
                      ],
                    )), //error block
                Container(
                    padding: EdgeInsets.only(left:40,right:40,bottom:40),
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
                          controller: confirmPass,
                          obscureText: true,
                          decoration:
                              InputDecoration(labelText: "Confirm Password"),
                        ), Scaffold(
appBar: AppBar(
  
),
                        ),
                        Container(
                          padding: EdgeInsets.only(top:40),
                          child: MaterialButton(
                            height: 50.0,
                            minWidth: 300.0,
                            color: Colors.green,
                            splashColor: Colors.teal,
                            textColor: Colors.white,
                            child: new Container(
                              child: new Text("Create Account"),
                            ),
                            onPressed: () => _createAccount(context),
                          ),
                        )
                      ], 
                    )))
              ],
            ))));
  }
}