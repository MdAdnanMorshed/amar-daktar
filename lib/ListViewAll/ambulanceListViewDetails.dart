import 'package:amar_daktar/Models/AmbulancesList.dart';
import 'package:amar_daktar/Models/DoctorsList.dart';
import 'package:amar_daktar/UI_Views/AppDrawer.dart';
import 'package:amar_daktar/UI_Views/HireAmbulanceUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmbulancelistViewDetails extends StatelessWidget {
  final AmbulanceList ambulanceList;

  AmbulancelistViewDetails(this.ambulanceList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text(ambulanceList.ambulanceName),
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
                    child: Text("Service  :",
                        style: TextStyle(color: Colors.white, fontSize: 18.5)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(ambulanceList.ambulanceService,
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
                    child: Text(ambulanceList.ambulanceDescription,
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
                    child: Text(ambulanceList.ambulanceType,
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
                      ambulanceList.ambulanceAddress,
                      style: TextStyle(color: Colors.white, fontSize: 12.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      "Hire an Ambulances",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    onPressed: () {
                      _Hire_Ambulances(context);
                      print("I am Hire an Ambulances button !");
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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

  _Hire_Ambulances(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HireAmbulances()));
  }
}
