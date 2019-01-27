import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorSchedule extends StatelessWidget {

  final DocumentSnapshot snapshot;
  TutorSchedule({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Material(
  
     child: Container(
       

       color: Colors.white,
       
      child: ListView(
  //shrinkWrap: true,
 
  padding: const EdgeInsets.all(1),
  children: <Widget>[
     const Text("Teacher Name:",style: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
    
    )),
    const Text("Date:",style: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
    
    )),
    const Text('Time:',style: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
    
    )),
    const Text('Email:',style: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
    
    )),
    const Text('Location:',style: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
    
    ),
    
    ),
     MaterialButton(
                          height: 50.0,
                          minWidth: 300.0,
                          color: Colors.green,
                          splashColor: Colors.teal,
                          textColor: Colors.white,
                          child: new Container(
                            child: new Text("Cancle Appointment"),
                          ),
                          onPressed: () => print("Helllo"),
                        ),
                        
                          ],
  
    ),
     
     )
    );
  }
}