import 'package:amar_daktar/RESTApi/UserLoginApi.dart';
import 'package:amar_daktar/UI_Views/DoctorListUI.dart';
import 'package:amar_daktar/UI_Views/UserRegister.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DashboardUI.dart';

class UserLogin extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<UserLogin> {
  static String uEmail = '';
  static String uPassword = '';
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
              _builLoginHeader(),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Enter your Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 10),
                    ),
                  ),
                  onChanged: (text) {
                    uEmail = text;
                    print(uEmail);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Enter your Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 10),
                    ),
                  ),
                  onChanged: (passwordValue) {
                    uPassword = passwordValue;
                    print(passwordValue);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ButtonTheme(
                  minWidth: 270,
                  height: 45,
                  child: RaisedButton(
                    onPressed: () async {
                      print("loginClick");
                      print('mail:' + uEmail + 'pass:' + uPassword);
                      UserLoginApi(uEmail, uPassword)
                          .fetchData()
                          .whenComplete(_goToDashboard(context));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.blue,
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                // _buildButtonLogin(context, uEmail, uPassword),
              ),
              _builRegister(context),
            ],
          ),
        ),
      ),
    );
  }
}
// ------------------- Login UI ---------------------------

Widget _builLoginHeader() {
  return Image.asset(
    'images/amardaktar_logo.png',
    width: 220,
  );
}

Widget _builRegister(BuildContext context) {
  return FlatButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserRegister()),
      );
      print("Register Here");
    },
    padding: const EdgeInsets.only(left: 60, right: 60, top: 5),
    child: Text("If you are not register? Register here"),
  );
}

// ---------------- go to the Dashboard --------
_goToDashboard(BuildContext context) async {
  if (UserLoginApi.status == true) {
    print(UserLoginApi.status);
    print("Login is successfull!");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  } else {
    print("login is not successfull!");
  }
}
