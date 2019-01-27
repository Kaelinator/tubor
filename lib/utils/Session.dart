import 'package:flutter/material.dart';

class Session {
  
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String cost;
  final String subject;

  Session({this.startTime, this.endTime,  this.cost,  this.subject });

}