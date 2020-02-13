import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 300),
              child: Image.asset(
                'images/amardaktar_logo.png',
                width: 280,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                    width: 100,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    )))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => goTo());
  }

  goTo() async {
    // login or Deshboard

//----------------------
    print('goto the next page ');
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool userId = prefs.containsKey('userId');
    bool role = prefs.containsKey('userRoleId');
    bool name = prefs.containsKey('userName');

    print('UserName');
    print(name);
    String mail = prefs.getString('userEmail');
    print(mail);

    bool phone = prefs.containsKey('userPhone');
    //prefs.containsKey('userMailverfiy');
    // prefs.containsKey('userIamge');

    bool token = prefs.containsKey('userToken');

    if (token) {
      print('Deshboard session');
      print(token);
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      print('login session');
      Navigator.pushReplacementNamed(context, '/user_login');
      print(" go to the login Page ");
    }
  }
}
