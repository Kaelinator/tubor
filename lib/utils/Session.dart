import 'package:flutter/material.dart';

class Session {
  
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  DateTime startTimeDT;
  DateTime endTimeDT;
  final DateTime day;
  final String cost;
  final String subject;

  Session({this.startTime, this.endTime,  this.cost,  this.subject, this.day}){

    this.startTimeDT = day.add(Duration(hours: startTime.hour, minutes:startTime.minute));
    this.endTimeDT = day.add(Duration(hours: endTime.hour, minutes:endTime.minute));

  }

}