import 'package:amar_daktar/Models/DoctorsList.dart';
import 'package:amar_daktar/UI_Views/AppDrawer.dart';
import 'package:amar_daktar/UI_Views/DoctorContactUI.dart';
import 'package:amar_daktar/UI_Views/GetAppointmentUI.dart';
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
        title: Text(doctorsList.doctorName),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/profile.png'),
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            color: Colors.blueGrey,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, top: 7, right: 0, bottom: 7),
                    child: Text("Doctor Name  :",
                        style: TextStyle(color: Colors.white, fontSize: 12.5)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(doctorsList.doctorName,
                        style: TextStyle(color: Colors.white, fontSize: 12.5)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            color: Colors.blueGrey,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, top: 7, right: 0, bottom: 7),
                    child: Text("Designation  :",
                        style: TextStyle(color: Colors.white, fontSize: 12.5)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(doctorsList.doctorDesignation,
                        style: TextStyle(color: Colors.white, fontSize: 12.5)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            color: Colors.blueGrey,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, top: 7, right: 0, bottom: 7),
                    child: Text("Register No:",
                        style: TextStyle(color: Colors.white, fontSize: 12.5)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(doctorsList.doctorRegNo,
                        style: TextStyle(color: Colors.white, fontSize: 12.5)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
            color: Colors.blueGrey,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, top: 7, right: 0, bottom: 7),
                    child: Text(
                      "Specification :",
                      style: TextStyle(color: Colors.white, fontSize: 12.5),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      doctorsList.doctorSpecification,
                      style: TextStyle(color: Colors.white, fontSize: 12.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              //Appointment
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      "Get Appointment",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    onPressed: () {
                      _doctorAppointment(context);
                      print("I am Get Appointment button !");
                    },
                  ),
                ),
              ),
              // Contact
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      "Contact",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    onPressed: () {
                      _doctorContact(context);
                      print("I am Contact button !");
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// get Appointment
_doctorAppointment(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => GetAppointment()),
  );
}

// doctor Contact
_doctorContact(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ContactDoctor()),
  );
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
