import 'package:amar_daktar/Resources/AssetsStrings.dart';
import 'package:amar_daktar/Resources/Strings.dart';
import 'package:amar_daktar/RestApi/UserLoginApi.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AmbulancesListUI.dart';
import 'BloodDonorListUI.dart';
import 'FindDoctorUI.dart';
import 'FindHospitalUI.dart';

class AppDrawer extends StatefulWidget {
  final String currentRoute;
  const AppDrawer({Key key, this.currentRoute}) : super(key: key);
  @override
  _AppDrawerState createState() => _AppDrawerState(current: this.currentRoute);
}

class _AppDrawerState extends State<AppDrawer> {
  bool darkTheme = false;
  String current = '';
  String name = 'demo';
  String mail = 'demo@gmail.com';
  String phone = '018';
  String profileIamge = '';
  String profilePicUrl = '';
  String version;
  _AppDrawerState({this.current});

  @override
  void initState() {
    _getSharedPref();
    print('init');
    //_getBuildNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
//      version = packageInfo.version;
//    });

    Widget image_slide_bar = Container(

      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Carousel(
          boxFit: BoxFit.fill,
          images: [
            AssetImage(AssetsStrings.doctorPic),
            AssetImage(AssetsStrings.amublancePic),
            AssetImage(AssetsStrings.bloodPic),
            AssetImage(AssetsStrings.hospitalPic),
          ],
          dotSize: 3.0,
          dotSpacing: 15.0,
          dotColor: Colors.lightGreenAccent,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.red.withOpacity(0.5),
          borderRadius: true,
        ),
      ),
    );

    return WillPopScope(
      child: MaterialApp(
        theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: Text(Strings.deshBoardTitle),
          ),
          body: ListView(
            children: <Widget>[
            image_slide_bar,
            DeshboardItemList(),
              DeshboardItemList02(),
              ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                _createHeader(),
                _createDrawerItem(
                    icon: Icons.dashboard,
                    text: Strings.deshBoardTitle,
                    onTap: () {
                      print('dashboard');
                      print(current);
                      if (current == '/dashboard') {
                        Navigator.popAndPushNamed(context, '/dashboard');
                      } else {
                        Navigator.of(context).pop();
                      }
                    }),
                _createDrawerItem(
                    icon: Icons.perm_identity,
                    text: Strings.profileSettringsDrawer,
                    onTap: () {
                      if (current != '/user_profile') {
                        Navigator.popAndPushNamed(context, '/user_profile');
                      } else {
                        Navigator.of(context).pop();
                      }
                    }),
                _createDrawerItem2(
                  icon: Icons.settings,
                  text: Strings.serviceDrawer,
                  onTap1: () {
                    if (current != '/doctorList') {
                      Navigator.popAndPushNamed(context, '/doctorList');
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  onTap2: () {
                    if (current != '/hospitalList') {
                      Navigator.popAndPushNamed(context, '/hospitalList');
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                _createDrawerItem(
                    icon: Icons.call,
                    text: Strings.contactDrawer,
                    onTap: () {
                      if (current != '/Contact') {
                        Navigator.popAndPushNamed(context, '/Contact');
                      } else {
                        Navigator.of(context).pop();
                      }
                    }),
                _createDrawerItem(
                    icon: Icons.info,
                    text: Strings.aboutDrawer,
                    onTap: () {
                      if (current != '/About') {
                        Navigator.popAndPushNamed(context, '/About');
                      } else {
                        Navigator.of(context).pop();
                      }
                    }),
                _createDrawerItemThems(
                  icon: Icons.info,
                  text: Strings.themsDrawer,
                ),
                Divider(
                  color: Colors.purple,
                  height: 1,
                  thickness: 1,
                ),
                _createDrawerItem(
                    icon: Icons.exit_to_app,
                    text: Strings.logoutDrawer,
                    onTap: () {
                      UserLoginApi.status = false;
                      print('flag' + UserLoginApi.status.toString());
                      // removeShared();
                      logut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/user_login', (Route r) => r == null);
                    }),
                Divider(
                  color: Colors.purple,
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  trailing: Text(
                    AppConf.appVersion,
                    textScaleFactor: .8,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onWillPop: () {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(Strings.confirmExitTitle),
                content: Text(Strings.confirmExitDescription),
                actions: <Widget>[
                  FlatButton(
                    child: Text(Strings.confirmExitYes),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  FlatButton(
                    child: Text(Strings.confirmExitNo),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      },
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('images/bg.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
            left: 16,
            top: 40,
            child: Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 3,
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'http://amardaktar24.com/uploads/profile/${profileIamge}'),
                ),
//                userPhoto ??
              ),
            ),
          ),
          Positioned(
              bottom: 20.0,
              left: 16.0,
              child: Text(name,
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500))),
          Positioned(
              bottom: 5.0,
              left: 16.0,
              child: Text(mail, //name
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0, top: 10),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createDrawerItemThems({IconData icon, String text}) {
    return ListTile(
      title: Text("Dark Mode "),
      trailing: Switch(
        value: darkTheme,
        onChanged: (changed) {
          setState(() {
            darkTheme = changed;
            _isThems();
            print(darkTheme);
          });
        },
      ),
    );
  }

  Widget _createDrawerItem2(
      {IconData icon,
      String text,
      GestureTapCallback onTap1,
      GestureTapCallback onTap2,
      GestureTapCallback onTap3,
      GestureTapCallback onTap4}) {
    return ExpansionTile(
      initiallyExpanded: false,
//    leading: Icon(icon),
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      children: <Widget>[
        ListTile(
          title: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Icon(Icons.keyboard_arrow_right),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(Strings.deshboardMenuItemDoctor),
              )
            ],
          ),
          onTap: onTap1,
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Icon(Icons.keyboard_arrow_right),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(Strings.deshboardMenuItemHospital),
              )
            ],
          ),
          onTap: onTap2,
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Icon(Icons.keyboard_arrow_right),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(Strings.deshboardMenuItemBlood),
              )
            ],
          ),
          onTap: onTap3,
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Icon(Icons.keyboard_arrow_right),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(Strings.deshboardMenuItemAmbulances),
              )
            ],
          ),
          onTap: onTap4,
        )
      ],
//    onTap: onTap,
    );
  }

  _isThems() async {
    SharedPreferences themsSP = await SharedPreferences.getInstance();
    setState(() {
      themsSP.setBool('isThems', darkTheme);
    });
  }

  _getSharedPref() async {
    print('sharedPref');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('userName');
      profileIamge = prefs.getString('userIamge');
      mail = prefs.getString('userEmail');

      String profilePicUrl =
          'http://amardaktar24.com/uploads/profile/${profileIamge}';
      print("Image " + profilePicUrl);
      print('SFname:' + name);
      // mail = prefs.getString('userEmail');
      // print('SFmail:' + mail);
    });
  }

  logut() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.remove('userToken');
    await prefs1.clear();
    print("Logout");
  }
}

class DeshboardItemList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
     height: 180.0,
      width: 180.0,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(2.0),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: MenuItemCard(Strings.deshboardMenuItemDoctor, Image.asset(AssetsStrings.doctorPic)),

            ),
            Align(
              alignment: Alignment.center,
              child:  MenuItemCard(
                  Strings.deshboardMenuItemHospital, Image.asset(AssetsStrings.hospitalPic)),
            ),

          ],
        ),
      ),
    );
  }
}

class DeshboardItemList02 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 180.0,
      width: 180.0,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(2.0),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: MenuItemCard(
                  Strings.deshboardMenuItemBlood, Image.asset(AssetsStrings.bloodPic)),
            ),
            Align(
              alignment: Alignment.center,
              child:  MenuItemCard(
                  Strings.deshboardMenuItemAmbulances, Image.asset(AssetsStrings.amublancePic)),
            ),

          ],
        ),
      ),
    );
  }

}


// ignore: must_be_immutable
class MenuItemCard extends StatelessWidget {
  MenuItemCard(this.title, this.pic);
  String title;
  Image pic;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              if (title == Strings.deshboardMenuItemDoctor) {
                Navigator.push(
                    context,
                    //MaterialPageRoute(builder: (context) => DoctorListUI()));
                    MaterialPageRoute(builder: (context) => FindDoctorUI()));
              } else if (title == Strings.deshboardMenuItemHospital) {
                Navigator.push(
                    context,
                    //MaterialPageRoute(builder: (context) => HospitalListUI()));
                    MaterialPageRoute(builder: (context) => FindHospitalUI()));
              } else if (title == Strings.deshboardMenuItemBlood) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BloodDonorUI()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AmbulanceListUI()));
              }
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(width: 120, height: 120, child: pic),
                  Text(title,
                      style: TextStyle(fontSize: 15.3, color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
