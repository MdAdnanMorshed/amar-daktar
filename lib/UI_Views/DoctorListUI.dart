import 'package:amar_daktar/ListViewAll/doctorListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class DoctorListUI extends StatefulWidget {
  @override
  DoctorListPage createState() => DoctorListPage();
}

class DoctorListPage extends State<DoctorListUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text('Doctor List'),
      ),
      body: Container(
        color: Colors.black12,
        child: doctorListView(context),
      ),
    );
  }
}
