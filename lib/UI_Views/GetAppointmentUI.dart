import 'dart:async';

import 'package:amar_daktar/Models/findDoctorList.dart';
import 'package:amar_daktar/RestApi/GetAppointmentApi.dart';
import 'package:amar_daktar/RestApi/UserRegisterApi.dart';
import 'package:amar_daktar/UI_Views/UserLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAppointment extends StatefulWidget {
  FindDoctor doctorsList;
  GetAppointment(this.doctorsList);

  @override
  _AppointmentPageState createState() =>
      _AppointmentPageState(this.doctorsList);
}

class _AppointmentPageState extends State<GetAppointment> {
  var _formKey = GlobalKey<FormState>();
  FindDoctor doctorsList;
  _AppointmentPageState(this.doctorsList);
  ProgressDialog pr;

  var imageURI, image;
  // time picker
  DateTime _dateTime = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picker = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: new DateTime(2010),
        lastDate: new DateTime(2025));

    print(_dateTime.toString());

    if (picker != null && picker != _dateTime) {
      print('Date:${_dateTime.toString()}');
      setState(() {
        _dateTime = picker;
      });
    } else {
      print('else');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    print('Get Appointment ::');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);

    pr.style(
        message: 'Please Waiting...',
        borderRadius: 8.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 8.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Doctor Appointment"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: <Widget>[
                Align(
                    //  child: Text("Registration", style: TextStyle(fontSize: 30)),
                    ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // Full Name
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Name of Doctor",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            hintText: doctorsList.doctorName,
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) return ("This is Required");
                            return null;
                          },
                          onSaved: (value) {
                            value = doctorsList.doctorName.toString();
                            print(value);
                          }),
                      SizedBox(height: 15),
                      // Email
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Doctor fees",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: doctorsList.doctorFees,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) return ("This is Required");
                          return null;
                        },
                        onSaved: (value) => print(value),
                      ),
                      SizedBox(height: 15),
                      // Phone Number
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "This Doctor Available In Hospitals",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                          border: OutlineInputBorder(),
                        ),
                        hint: Text("Please Choose One"),
                        items: [
                          DropdownMenuItem(
                            child: Text("Dhaka Medical Hospital"),
                            value: "Dhaka Medical Hospital",
                          ),
                          DropdownMenuItem(
                            child: Text("Islamic Hospital"),
                            value: "Islamic Hospital",
                          ),
                          DropdownMenuItem(
                            child: Text("Bangadesh Specilized Hospital"),
                            value: "Bangadesh Specilized Hospital",
                          ),
                        ],
                        // value: "Doctor",
                        onChanged: (type) {
                          print(type);
                        },
                        validator: (value) {
                          if (value.isEmpty) return ("This is Required");
                          return null;
                        },
                        onSaved: (value) => print(value),
                      ),
                      SizedBox(height: 15),
                      //Patients Status
                      Row(
                        children: <Widget>[
                          /*
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Patient Status",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              //Male
                              ListTile(
                                title: Text("Male"),
                                leading: Radio(
                                    value: 1,
                                    groupValue: 1,
                                    activeColor: Colors.green,
                                    onChanged: (val) {
                                      print('');
                                    }),
                              ),
                              //Female
                            ],
                          ),

                          */
                        ],
                      ),

                      // Appointment Date
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Appointment Date",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        onTap: () {
                          selectDate(context);
                          print("get Appointment Date here");
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: '${_dateTime.toString()}',
                          border: OutlineInputBorder(),
                        ),
                        //  keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) return ("This is Required");
                          return null;
                        },
                        onSaved: (value) => print(value),
                      ),
                      SizedBox(height: 15),

                      // Problem Description
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Problems",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Enter Your Problems",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        maxLines: 3,
                        validator: (value) {
                          if (value.isEmpty) return ("This is Required");
                          return null;
                        },
                        onSaved: (value) => print(value),
                      ),
                      SizedBox(height: 15),
                      // SignUp Button
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.green,
                          child: Text(
                            "Send",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          onPressed: () {
                            print("I am send button !");

                            _submit();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureOr goTo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserLogin()),
    );
  }

  void _submit() {
    print('submit');
    final form = _formKey.currentState;
    print(form);

    if (form.validate()) {
      form.save();
      _getAppointment();
    }
  }

  _getAppointment() {
    pr.show();
    GetAppointmentApi().fetchData().whenComplete(confimMsg);
  }

  FutureOr confimMsg() {
    pr.hide();
    // Dailog Successful Masseage
    print('Get Appointment Done');
  }
}
