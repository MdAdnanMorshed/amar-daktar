import 'package:amar_daktar/Models/DoctorsList.dart';
import 'package:amar_daktar/UI_Views/AppDrawer.dart';
import 'package:amar_daktar/UI_Views/DoctorContactUI.dart';
import 'package:amar_daktar/UI_Views/GetAppointmentUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorlistViewDetails extends StatefulWidget {
  DoctorsList doctorsList;

  DoctorlistViewDetails(DoctorsList doctorsList) {
    this.doctorsList = doctorsList;
  }

  @override
  _DoctorlistViewDetailsState createState() =>
      _DoctorlistViewDetailsState(this.doctorsList);
}

class _DoctorlistViewDetailsState extends State<DoctorlistViewDetails> {
  DoctorsList doctorsList;
  String profileIamge;

  @override
  void initState() {
    print('init');
    doctorInfoToSF(doctorsList);
    super.initState();
  }

  _DoctorlistViewDetailsState(this.doctorsList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text(doctorsList.doctorName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.only(top: 5),
                width: 110.0,
                height: 110.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'http://amardaktar24.com/uploads/profile/${profileIamge}'),
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
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 7, right: 0, bottom: 7),
                      child: Text("Doctor Name  :",
                          style:
                          TextStyle(color: Colors.white, fontSize: 12.5)),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(doctorsList.doctorName,
                          style:
                          TextStyle(color: Colors.white, fontSize: 15.5)),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
              color: Colors.blueGrey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 7, right: 0, bottom: 7),
                      child: Text("Doctor Gender  :",
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.5)),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(doctorsList.doctorGender,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.5)),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
              color: Colors.blueGrey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 7, right: 0, bottom: 7),
                      child: Text("Designation  :",
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.5)),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(doctorsList.doctorDesignation,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.5)),
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
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 7, right: 0, bottom: 7),
                      child: Text("Doctor Frees  :",
                          style:
                          TextStyle(color: Colors.white, fontSize: 12.5)),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(doctorsList.doctorFees,
                          style:
                          TextStyle(color: Colors.white, fontSize: 15.5)),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
              color: Colors.blueGrey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 10, right: 0, bottom: 7),
                      child: Text(
                        "Register No :",
                        style: TextStyle(color: Colors.white, fontSize: 12.5),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        doctorsList.doctorRegNo,
                        style: TextStyle(color: Colors.white, fontSize: 15.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
              color: Colors.blueGrey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 10, right: 0, bottom: 7),
                      child: Text(
                        "Specification :",
                        style: TextStyle(color: Colors.white, fontSize: 12.5),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        doctorsList.doctorSpecification,
                        style: TextStyle(color: Colors.white, fontSize: 15.5),
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
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 2, right: 10, bottom: 5),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.red,
                      child: Text(
                        "Get Appointment",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
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
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 2, right: 10, bottom: 5),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.red,
                      child: Text(
                        "Contact",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
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
      ),
    );
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

  doctorInfoToSF(DoctorsList doctorsList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      //------------- Doctor Profile info list ---------------------------
      print('-----------Doctor Profile info list -------------------------');

      prefs.setString('doctorId', doctorsList.doctorid);
      prefs.setString('doctorName', doctorsList.doctorName);
      prefs.setString('doctorFrees', doctorsList.doctorFees);
      prefs.setString('doctorGender', doctorsList.doctorGender);

      prefs.setString('doctorRegNo', doctorsList.doctorRegNo);
      prefs.setString('doctorSpecification', doctorsList.doctorSpecification);
      prefs.setString('doctorDesignation', doctorsList.doctorDesignation);
      prefs.setString('doctorCountryId', doctorsList.doctorCountryId);
      prefs.setString('doctorCityId', doctorsList.doctorCityId);
      prefs.setString('doctorAreaId', doctorsList.doctorAreaId);
      prefs.setString('doctorImage', doctorsList.doctorImage);

      print('doctorId :' + prefs.getString('doctorId'));
      print('doctorName :' + prefs.getString('doctorName'));
      print('doctorFrees :' + prefs.getString('doctorFrees'));
      print('doctorGender :' + prefs.getString('doctorGender'));

      print('doctorRegNo :' + prefs.getString('doctorRegNo'));
      print('doctorSpecification :' + prefs.getString('doctorSpecification'));
      print('doctorDesignation :' + prefs.getString('doctorDesignation'));
      print('doctorCityId :' + prefs.getString('doctorCityId'));
      print('doctorAreaId :' + prefs.getString('doctorAreaId'));

      print('doctorImage:' + prefs.getString('doctorImage'));
      profileIamge = prefs.getString('doctorImage');
    });
  }
}
