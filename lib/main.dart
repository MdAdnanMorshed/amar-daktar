
import 'package:flutter/material.dart';

import 'UI_Views/SplashScreen.dart';
import 'UI_Views/user_login.dart';


void main() => runApp(MyDoctorApps());

class MyDoctorApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/user_login':(context)=>UserLogin(),
        '/': (context) => SplashScreen(),
      },
    );
  }
}
