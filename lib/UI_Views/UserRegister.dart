import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UserRegister.dart';

class UserRegister extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Rgister "),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/amardaktar_logo.png',
                width: 280,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 10),
                      ),
                      hintText: "Enter your Name "),
                  onChanged: (text) {
                    //email = text;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 20),
                      ),
                      hintText: "Enter your Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 20),
                      ),
                      hintText: "Enter your Phone Number "),
                  onChanged: (text) {
                    //email = text;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 20),
                      ),
                      hintText: "Choose your Play Role "),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 20),
                      ),
                      hintText: "Password"),
                  onChanged: (text) {
                    //email = text;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 20),
                      ),
                      hintText: "Confirm password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 20),
                      ),
                      hintText: "Country "),
                  onChanged: (text) {
                    //email = text;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ButtonTheme(
                  minWidth: 270,
                  height: 55,
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
