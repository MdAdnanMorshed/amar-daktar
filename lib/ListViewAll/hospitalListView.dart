import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget hospitalListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Hospital Name'),
        subtitle: Text('doctor@gmail.com'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Hospital Name'),
        subtitle: Text('doctor@gmail.com'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Hospital Name'),
        subtitle: Text('Hospital@gmail.com'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Hospital Name'),
        subtitle: Text('Hospital@gmail.com'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Hospital Name'),
        subtitle: Text('Hospital@gmail.com'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Hospital Name'),
        subtitle: Text('Hospital@gmail.com'),
      ),
    ],
  );
}
