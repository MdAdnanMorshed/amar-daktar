import 'package:amar_daktar/RestApi/UserLoginApi.dart';
import 'package:amar_daktar/UI_Views/UserRegister.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'DashboardUI.dart';

ProgressDialog pr;

class UserLogin extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<UserLogin> {
  static String uEmail = '';
  static String uPassword = '';
  bool visible = false;
  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);

    pr.style(
        message: 'Please Waiting...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600));

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
                padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
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
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                child: TextField(
                  obscureText: true,
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
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ButtonTheme(
                  minWidth: 250,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () async {
                      pr.show();
                      UserLoginApi(uEmail, uPassword)
                          .fetchData()
                          .whenComplete(_goToDashboard);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.red,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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

  _goToDashboard() async {
    if (UserLoginApi.status == true) {
      print(UserLoginApi.status);

      print("Login is successfull!");
      pr.hide();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else {
      print(UserLoginApi.status);
      // Dailog  successful
      pr.hide();
      print("login is not successfull!");
    }
  }
}
// ------------------- Login UI ---------------------------

Widget _builLoginHeader() {
  return Image.asset(
    'images/amardaktar_logo.png',
    width: 250,
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
    padding: const EdgeInsets.only(left: 40, right: 40, top: 8),
    child: Text(
      "If you are not register? Register here",
      style: TextStyle(fontSize: 12),
    ),
  );
}
