import 'package:amar_daktar/RESTApi/UserLoginApi.dart';
import 'package:amar_daktar/UI_Views/UserRegister.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DashboardUI.dart';
import 'UserLogin.dart';

class UserLogin extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<UserLogin> {
  String uEmail = '';
  String uPassword = '';
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
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
                        borderSide: BorderSide(width: 20),
                      ),
                      hintText: "Email"),
                  onChanged: (text) {
                    //email = text;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 20),
                      ),
                      hintText: "Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ButtonTheme(
                  minWidth: 270,
                  height: 55,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.blue,
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserRegister()),
                  );
                  print("Register Here");
                },
                padding: const EdgeInsets.only(left: 60, right: 60, top: 25),
                child: Text("If you are not register? Register here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
