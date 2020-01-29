import 'package:amar_daktar/UI_Views/AppDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorlistViewDetails extends StatelessWidget {
  TextEditingController customControl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            AlertDialog(
              title: Text('get Appointment'),
              content: TextField(
                controller: customControl,
              ),
            );
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
