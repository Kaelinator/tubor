import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Loginpage extends StatefulWidget {
  
@override
//https://flutter.io/docs/development/ui/assets-and-images
State createState() => LoginState();
}

class LoginState extends State<Loginpage> {
Widget build(BuildContext context) {
return Material(
  color: Colors.greenAccent,
 child: Scaffold(
   backgroundColor: Colors.blueGrey,
   body: Stack(fit: StackFit.expand, children: <Widget>[

     Image(
       image: AssetImage("assets/kseLogo.png"),
       fit: BoxFit.cover,
     ),
     Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
       ],
     ),
     Container(
       padding: EdgeInsets.all(40),
       child: Form(
         child: Column(
           children: <Widget>[
             TextFormField(
               keyboardType: TextInputType.emailAddress,
               decoration: InputDecoration(labelText: "Enter Email", fillColor: Colors.white),
             ),
             TextFormField(
               keyboardType: TextInputType.text,
               obscureText: true,
               decoration: InputDecoration(labelText: "Enter Password"),
             )
           ],
         )
       )
     )

   ],)

 )
);
}
}






