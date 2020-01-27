import 'package:flutter/material.dart';

import 'UI_Views/SplashScreen.dart';
import 'UI_Views/UserLogin.dart';
import 'UI_Views/DashboardUI.dart';
import 'UI_Views/UserRegister.dart';

void main() => runApp(MyDoctorApps());

class MyDoctorApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/user_login': (context) => UserLogin(),
        '/user_register': (context) => UserRegister(),
        '/dashboard': (context) => Dashboard(),
        '/': (context) => SplashScreen(),
      },
    );
  }
}
