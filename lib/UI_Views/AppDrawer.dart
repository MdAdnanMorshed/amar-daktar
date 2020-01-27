import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  final String currentRoute;

  const AppDrawer({Key key, this.currentRoute}) : super(key: key);
  @override
  _AppDrawerState createState() => _AppDrawerState(current: this.currentRoute);
}

String name = '';
String photo = '';
bool isStudent = false;
String version;

class _AppDrawerState extends State<AppDrawer> {
  String current;

  _AppDrawerState({this.current});

  @override
  void initState() {
    _getSharedPref();
    //_getBuildNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
//      version = packageInfo.version;
//    });

    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
                icon: Icons.dashboard,
                text: 'DashBoard',
                onTap: () {
                  if (current != '/dashboard') {
                    Navigator.popAndPushNamed(context, '/dashboard');
                  } else {
                    Navigator.of(context).pop();
                  }
                }),
            _createDrawerItem(
                icon: Icons.perm_identity,
                text: 'Profile Settings',
                onTap: () {
                  if (current != '/dashboard') {
                    Navigator.popAndPushNamed(context, '/dashboard');
                  } else {
                    Navigator.of(context).pop();
                  }
                }),
            _createDrawerItem2(
              icon: Icons.settings,
              text: 'Services',
              onTap1: () {
                if (current != '/bookList') {
                  Navigator.popAndPushNamed(context, '/bookList');
                } else {
                  Navigator.of(context).pop();
                }
              },
              onTap2: () {
                if (current != '/bookRequest') {
                  Navigator.popAndPushNamed(context, '/bookRequest');
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
            _createDrawerItem(
                icon: Icons.directions_bus,
                text: 'Blog',
                onTap: () {
                  if (current != '/transport') {
                    Navigator.popAndPushNamed(context, '/transport');
                  } else {
                    Navigator.of(context).pop();
                  }
                }),
            _createDrawerItem(
                icon: Icons.notifications,
                text: 'Contact',
                onTap: () {
                  if (current != '/noticeBoard') {
                    Navigator.popAndPushNamed(context, '/noticeBoard');
                  } else {
                    Navigator.of(context).pop();
                  }
                }),
            _createDrawerItem(icon: Icons.local_post_office, text: 'Message'),
            _createDrawerItem(
                icon: Icons.account_circle,
                text: 'About',
                onTap: () {
                  if (current != '/userAccount') {
                    Navigator.popAndPushNamed(context, '/userAccount');
                  } else {
                    Navigator.of(context).pop();
                  }
                }),
            Divider(
              color: Colors.purple,
              height: 1,
              thickness: 1,
            ),
            _createDrawerItem(
                icon: Icons.exit_to_app,
                text: 'Log Out',
                onTap: () {
                  // removeShared();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/loginPage', (Route r) => r == null);
                }),
            Divider(
              color: Colors.purple,
              height: 1,
              thickness: 1,
            ),
            ListTile(
              trailing: Text(
                'Version : $version',
                textScaleFactor: .8,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _getSharedPref() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String

    setState(() {
      //name = prefs.getString('NAME');
      //photo = prefs.getString('USER_PHOTO');
    });
  }
}

void removeShared() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.remove('EMAIL');
  // prefs.remove('PASSWORD');
  //await prefs.clear();
  //LoginApi.status = false;
}

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('images/purple.png'))),
      child: Stack(children: <Widget>[
        Positioned(
          left: 20,
          top: 30,
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(photo ??
                    'https://image.flaticon.com/icons/png/512/149/149071.png'),
              ),
//                userPhoto ??
            ),
          ),
        ),
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text(name,
                style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                    color: Colors.white,
                    fontSize: 20.0,
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
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}

Widget _createDrawerItem2(
    {IconData icon,
    String text,
    GestureTapCallback onTap1,
    GestureTapCallback onTap2}) {
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
              child: Text('Doctors'),
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
              child: Text('Hospitals'),
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
              child: Text('Blood Donar'),
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
              child: Text('Ambulances'),
            )
          ],
        ),
        onTap: onTap2,
      )
    ],

//    onTap: onTap,
  );
}
