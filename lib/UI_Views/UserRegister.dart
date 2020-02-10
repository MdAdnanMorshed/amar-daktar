import 'dart:async';

import 'package:amar_daktar/RestApi/UserRegisterApi.dart';
import 'package:amar_daktar/UI_Views/UserLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserRegister extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<UserRegister> {
  var _formKey = GlobalKey<FormState>();

  var imageURI;
  var image;
  String item;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Registration"),
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
                          "Your Full Name",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Enter Your Name",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) return ("This is Required");
                          return null;
                        },
                        onSaved: (value) => print(value),
                      ),
                      SizedBox(height: 15),
                      // Email
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Enter Your Email",
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
                          "Phone Number",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Enter Your Phone Number",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty) return ("This is Required");
                          return null;
                        },
                        onSaved: (value) => print(value),
                      ),
                      SizedBox(height: 15),
                      // Sign Up Type
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Select Your Sign Up Type",
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
                            child: Text("Patient"),
                            value: "Patient",
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
                      // Password
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Enter Your Password",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) return ("This is Required");
                          return null;
                        },
                        onSaved: (value) => print(value),
                      ),
                      SizedBox(height: 15),
                      // Confirm Password
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Confirm",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Repeat Password",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) return ("This is Required");
                          return null;
                        },
                        onSaved: (value) => print(value),
                      ),
                      SizedBox(height: 15),
                      // Country
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Country",
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
                        hint: Text("Please Select Your Country"),
                        items: [
                          DropdownMenuItem(
                            child: Text("Bangladesh"),
                            value: "Bangladesh",
                          ),
                          DropdownMenuItem(
                            child: Text("India"),
                            value: "India",
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
                      // City
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "City",
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
                        hint: Text("Please Select Your City"),
                        items: [
                          DropdownMenuItem(
                            child: Text("Dhaka"),
                            value: "Dhaka",
                          ),
                          DropdownMenuItem(
                            child: Text("Noakhali"),
                            value: "Noakhali",
                          ),
                          DropdownMenuItem(
                            child: Text("Chandpur"),
                            value: "Chandpur",
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
                      // Area
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Area",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Enter Your Area",
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
                      // Image
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Profile Image",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RaisedButton(
                          child: AlertDialog(
                            title: Text("Select image source",
                                style: TextStyle(fontSize: 10)),
                            actions: <Widget>[
                              MaterialButton(
                                child: Text("Camera"),
                                onPressed: () => getImage(context, "camera"),
                              ),
                              MaterialButton(
                                child: Text("Gallery"),
                                onPressed: () => getImage(context, "gallery"),
                              )
                            ],
                          ),
                          //onPressed: () => getImage(context, "gallery"),
                        ),
                      ),
                      SizedBox(height: 15),
                      // SignUp Button
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.green,
                          child: Text(
                            "Sign Me Up",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          onPressed: () {
                            print("Register is Click Button");
                            UserRegisterApi("Rocky", "0183", "rocky@gmail.com")
                                .fetchData()
                                .whenComplete(Register);
                            print("I am signup button !");
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

  Future getImage(BuildContext context, String imgSource) async {
    if (imgSource == "camera") {
      getImageFromCamera();
    } else if (imgSource == "gallery") {
      getImageFromGallery();
    }
  }

  // Camera
  Future getImageFromCamera() async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageURI = image;
    });
  }

  //Gallery
  Future getImageFromGallery() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageURI = image;
      print(imageURI);
    });
  }

  FutureOr Register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserLogin()),
    );
  }
}
