import 'package:amar_daktar/ListViewAll/doctorListViewDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget doctorListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Doctor Name'),
        subtitle: Text('doctor@gmail.com'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Doctor Name'),
        subtitle: Text('doctor@gmail.com'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoctorlistViewDetails()),
          );
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Doctor Name'),
        subtitle: Text('doctor@gmail.com'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Doctor Name'),
        subtitle: Text('doctor@gmail.com'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Doctor Name'),
        subtitle: Text('doctor@gmail.com'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/amardaktar_logo.png'),
        ),
        title: Text('Doctor Name'),
        subtitle: Text('doctor@gmail.com'),
      ),
    ],
  );
}
