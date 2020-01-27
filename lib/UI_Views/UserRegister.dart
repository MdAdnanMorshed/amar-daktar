import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UserRegister.dart';

class UserRegister extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<UserRegister> {
  String dropdownValue = 'Hospitals';
  String dropdownCountry = 'Bangladesh';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Rgister "),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: 400.0,
                height: 60.0,
                padding: const EdgeInsets.only(left: 5, right: 10, top: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 10),
                      ),
                      hintText: "Enter your Name "),
                  onChanged: (text) {
                    //email = text;
                  },
                ),
              ),
              Container(
                width: 400.0,
                height: 60.0,
                padding: const EdgeInsets.only(left: 5, right: 10, top: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 10),
                      ),
                      hintText: "Enter your Email Address"),
                  onChanged: (text) {
                    //email = text;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("Select Your Sign Up Type    "),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 15,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Hospitals', 'Doctors', 'Patient']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("Country  :"),
                  ),
                  DropdownButton<String>(
                    value: dropdownCountry,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 15,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownCountry = newValue;
                      });
                    },
                    items: <String>['Bangladesh', 'India']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Container(
                width: 400.0,
                height: 60.0,
                padding: const EdgeInsets.only(left: 5, right: 10, top: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 10),
                      ),
                      hintText: "Enter your Name"),
                  onChanged: (text) {
                    //email = text;
                  },
                ),
              ),
              Container(
                width: 400.0,
                height: 60.0,
                padding: const EdgeInsets.only(left: 5, right: 10, top: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 10),
                      ),
                      hintText: "Enter your Name"),
                  onChanged: (text) {
                    //email = text;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ButtonTheme(
                  minWidth: 250,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      print("ok");
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.blueAccent,
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
