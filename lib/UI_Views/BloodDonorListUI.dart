import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class BloodDonorUI extends StatefulWidget {
  @override
  BloodDonorListPage createState() => BloodDonorListPage();
}

class BloodDonorListPage extends State<BloodDonorUI> {
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
