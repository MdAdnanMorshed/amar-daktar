import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AmbulancesListUI.dart';
import 'AppDrawer.dart';
import 'BloodDonorListUI.dart';
import 'DoctorListUI.dart';
import 'HospitalsListUI.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: AppDrawer(currentRoute: '/dashboard'),
        appBar: AppBar(
          title: Text("DeshBoard"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              MenuItemCard('Doctors', Image.asset('images/doctorpic.png')),
              MenuItemCard('Hospitals', Image.asset('images/hospitalpic.png')),
              MenuItemCard(
                  'Blood Donars', Image.asset('images/bloodpicture.png')),
              MenuItemCard('Ambulances', Image.asset('images/ambulances.png')),
            ],
          ),
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
              if (title == 'Doctors') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DoctorListUI()));
              } else if (title == 'Hospitals') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HospitalListUI()));
              } else if (title == 'Blood Donars') {
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
