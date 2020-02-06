import 'package:amar_daktar/Models/DoctorsList.dart';
import 'package:amar_daktar/UI_Views/AppDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorlistViewDetails extends StatelessWidget {
  final DoctorsList doctorsList;

  DoctorlistViewDetails(this.doctorsList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text(doctorsList.doctorid),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            _showDialog(context);
            print("get Appointment");
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          color: Colors.blue,
          child: Text(
            "get Appointment",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Alert Dialog title"),
        content: new Text("Alert Dialog body"),
        actions: <Widget>[
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a search term'),
          ),
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
