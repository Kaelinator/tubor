import 'package:flutter/material.dart';
import '../utils/Session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimePickerItem extends StatefulWidget {
  final Function onDone;
  TimePickerItem({Key key, this.onDone}) : super(key: key);
  @override
  _TimePickerItemState createState() => _TimePickerItemState(onDone: onDone);
}

class _TimePickerItemState extends State<TimePickerItem> {
  
  final Function onDone;
  _TimePickerItemState({this.onDone});

  final cost = TextEditingController(text: '0');

  String subjectQuery;
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  void _chooseTime(BuildContext context, bool isStart) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((time) {
      if (isStart) {
        setState(() {
          startTime = time;
        });
      } else {
        setState(() {
          endTime = time;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Start Time: ${startTime.format(context)}'),
            Text('End Time: ${endTime.format(context)}'),
            RaisedButton(
              child: Text("Choose Start Time"),
              onPressed: () => _chooseTime(context, true),
            ),
            RaisedButton(
              child: Text("Choose End Time"),
              onPressed: () => _chooseTime(context, false),
            ),
            Column(
              children: <Widget>[
                Text("Cost:"),
                Container(
                  child: TextFormField(
                    // initialValue: "0",
                    controller: cost,
                    textDirection: TextDirection.rtl,
                  ),
                  width: 100,
                ),
                RaisedButton(
                  child: const Text('Done'),
                  onPressed: () => widget.onDone(Session(
                    cost: cost.text,
                    endTime: endTime,
                    subject: subjectQuery,
                    startTime: startTime)),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('subjects').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text('Loading...');
                      default:
                        return DropdownButton(
                          onChanged: (subj) => setState(() {print(subj); subjectQuery = subj; }),
                          value: subjectQuery,
                          items: snapshot.data.documents.map((DocumentSnapshot document) {

                            return DropdownMenuItem(
                              value: document.documentID,
                              child: Text('${document['subcategory']}')
                            );
                          }
                        ).toList()
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


// class TimePickerItem extends StatefulWidget {
//   final DateTime dateTime;

//   TimePickerItem(this.dateTime, );

//   @override
//   _TimePickerItemState createState() => _TimePickerItemState(dateTime);
// }

// class _TimePickerItemState extends State<TimePickerItem> {
//   final DateTime dateTime;
//   TimeOfDay startTime = TimeOfDay.now();
//   TimeOfDay endTime = TimeOfDay.now();

//   _TimePickerItemState(this.dateTime);


//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(4),
//       child: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text('Start Time: ${startTime.format(context)}'),
//             Text('End Time: ${endTime.format(context)}'),
//             RaisedButton(
//               child: Text("Choose Start Time"),
//               onPressed: () => _chooseTime(context, true),
//             ),
//             RaisedButton(
//               child: Text("Choose End Time"),
//               onPressed: () => _chooseTime(context, false),
//             ),
//             Column(
//               children: <Widget>[
//                 Text("Cost: "),
//                 Container(
//                   child: TextFormField(
//                     initialValue: "   0",
//                     maxLength: 4,
//                     textDirection: TextDirection.rtl,
//                   ),
//                   width: 100,
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
