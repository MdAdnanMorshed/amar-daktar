import 'package:flutter/material.dart';

import 'UI_Views/SplashScreen.dart';
import 'UI_Views/UserLogin.dart';
import 'UI_Views/DeshboardUI.dart';

void main() => runApp(MyDoctorApps());

class MyDoctorApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/user_login': (context) => UserLogin(),
        '/deshboard_ui': (context) => Dashboard(),
        '/': (context) => SplashScreen(),
      },
    );
  }
}
