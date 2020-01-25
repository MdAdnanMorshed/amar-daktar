import 'package:flutter/material.dart';

import 'UI_Views/SplashScreen.dart';
import 'UI_Views/user_login.dart';
import 'UI_Views/deshboard_ui.dart';

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
