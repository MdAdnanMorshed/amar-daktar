import 'package:amar_daktar/UI_Views/AboutComapnyUI.dart';
import 'package:amar_daktar/UI_Views/AppDrawer.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'InternetCheck/InterntCheckConection.dart';
import 'UI_Views/AmbulancesListUI.dart';
import 'UI_Views/BloodDonorListUI.dart';
import 'UI_Views/ContactUI.dart';
import 'UI_Views/DoctorListUI.dart';
import 'UI_Views/HospitalsListUI.dart';
import 'UI_Views/SplashScreen.dart';
import 'UI_Views/UserLogin.dart';
import 'UI_Views/UserProfileUI.dart';
import 'UI_Views/UserRegister.dart';
import 'app_themes/home.dart';
import 'app_themes/theme_manager.dart';

void main() => runApp(MyDoctorApps());

class MyDoctorApps extends StatelessWidget {
  bool darkTheme = false;
  @protected
  @mustCallSuper
  void initState() {
    print('thems' + darkTheme.toString());
    _isThems();
  }

  @override
  Widget build(BuildContext context) {
    return  StreamProvider<ConnectivityResult>.value(
      value: CheckInternet().connectivityResult.stream,
      child: MaterialApp(
        theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
        //theme: ThemeData(primaryColor: Colors.red),
        debugShowCheckedModeBanner: false,
        routes: {
          '/user_login': (context) => UserLogin(),
          '/user_register': (context) => UserRegister(),
          '/dashboard': (context) => AppDrawer(),
          '/user_profile': (context) => UserProfile(),
          '/hospitalList': (context) => HospitalListUI(),
          '/doctorList': (context) => DoctorListUI(),
          '/ambulanceList': (context) => AmbulanceListUI(),
          '/bloodDonor': (context) => BloodDonorUI(),
          '/About': (context) => About(),
          '/Contact': (context) => Contact(),
          '/': (context) => SplashScreen(),
        },

      ),
    );

  }

  _isThems() async {
    SharedPreferences themsSP = await SharedPreferences.getInstance();
    print('thems Bool ' + themsSP.getBool('isThems').toString());
    darkTheme = themsSP.getBool('isThems');
  }
}
//class ThemeApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ChangeNotifierProvider(
//      builder: (context) => ThemeManager(),
//      child: Consumer<ThemeManager>(builder: (context, manager,_) {
//        return MaterialApp(
//            debugShowCheckedModeBanner: false,
//            theme: manager.themeData,
//            title: 'Theme app',
//            home: Home());
//      }),
//    );
//  }
//}

