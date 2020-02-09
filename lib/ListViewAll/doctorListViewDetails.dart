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
        title: Text(doctorsList.doctorName),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Container(
              margin: EdgeInsets.only(top: 50),
              width: 150.0,
              height: 150.0,
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
                        style: TextStyle(color: Colors.white, fontSize: 18.5)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(doctorsList.doctorName,
                        style: TextStyle(color: Colors.white, fontSize: 18.5)),
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
                        style: TextStyle(color: Colors.white, fontSize: 18.5)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(doctorsList.doctorDesignation,
                        style: TextStyle(color: Colors.white, fontSize: 18.5)),
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
                        style: TextStyle(color: Colors.white, fontSize: 18.5)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(doctorsList.doctorRegNo,
                        style: TextStyle(color: Colors.white, fontSize: 18.5)),
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
                      style: TextStyle(color: Colors.white, fontSize: 18.5),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      doctorsList.doctorSpecification,
                      style: TextStyle(color: Colors.white, fontSize: 18.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 10, top: 10, bottom: 5),
                    child: RaisedButton(
                      onPressed: () {
                        print("get Appointment");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      color: Colors.blue,
                      child: Text(
                        "get Appointment",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {
                    print("Contact");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  color: Colors.blue,
                  child: Text(
                    " Contact",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ],
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
