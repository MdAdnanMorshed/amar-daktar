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
      backgroundColor: Colors.grey,
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text('Blood Donor List'),
      ),
    );
  }
}
