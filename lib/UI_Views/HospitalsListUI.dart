import 'package:amar_daktar/ListViewAll/hospitalListView.dart';
import 'package:amar_daktar/ListViewAll/hospitalListViewDetails.dart';
import 'package:amar_daktar/Models/HospitalsList.dart';
import 'package:amar_daktar/RestApi/HospitalListApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class HospitalListUI extends StatefulWidget {
  @override
  HospitalListPage createState() => HospitalListPage();
}

class HospitalListPage extends State<HospitalListUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text('Hospital List'),
      ),
      body: Container(
        child: hospitalListView(context),
      ),
    );
  }
}
