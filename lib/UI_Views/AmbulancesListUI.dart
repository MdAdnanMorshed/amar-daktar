import 'package:amar_daktar/ListViewAll/ambulanceListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class AmbulanceListUI extends StatefulWidget {
  @override
  AmbulanceListPage createState() => AmbulanceListPage();
}

class AmbulanceListPage extends State<AmbulanceListUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text('Ambulance Service  List'),
      ),
      body: Container(
        child: ambulanceListView(context),
      ),
    );
  }
}
