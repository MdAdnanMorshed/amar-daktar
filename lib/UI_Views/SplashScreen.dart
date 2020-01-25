import 'dart:async';

import 'package:flutter/material.dart';

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
                child: Container(width: 100, child: LinearProgressIndicator()))
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

  goTo() {

    Navigator.pushReplacementNamed(context, '/user_login');
    print(" go to the login Page ");
  }
}
