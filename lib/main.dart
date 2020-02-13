import 'package:amar_daktar/UI_Views/AboutComapnyUI.dart';
import 'package:flutter/material.dart';

import 'UI_Views/AmbulancesListUI.dart';
import 'UI_Views/BloodDonorListUI.dart';
import 'UI_Views/ContactUI.dart';
import 'UI_Views/DoctorListUI.dart';
import 'UI_Views/HospitalsListUI.dart';
import 'UI_Views/SplashScreen.dart';
import 'UI_Views/UserLogin.dart';
import 'UI_Views/DashboardUI.dart';
import 'UI_Views/UserProfileUI.dart';
import 'UI_Views/UserRegister.dart';

void main() => runApp(MyDoctorApps());

class MyDoctorApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/user_login': (context) => UserLogin(),
        '/user_register': (context) => UserRegister(),
        '/dashboard': (context) => Dashboard(),
        '/user_profile': (context) => UserProfile(),
        '/hospitalList': (context) => HospitalListUI(),
        '/doctorList': (context) => DoctorListUI(),
        '/ambulanceList': (context) => AmbulanceListUI(),
        '/bloodDonor': (context) => BloodDonorUI(),
        '/About': (context) => About(),
        '/Contact': (context) => Contact(),
        '/': (context) => SplashScreen(),
      },
    );
  }
}
