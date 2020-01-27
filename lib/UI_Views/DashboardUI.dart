import 'package:amar_daktar/UI_Views/UserRegister.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text("DeshBoard"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 4,
          children: <Widget>[
            Card(
              child: InkWell(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Text("Total Doctor's"), Text("1250")],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Text("Total Awards"), Text("2500")],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Happy Patients"),
                      Text("3580"),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Clinical Services"),
                      Text("9800"),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Icon(Icons.home), Text("Doctor's")],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Icon(Icons.home), Text("Hostitals")],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Icon(Icons.home), Text("Blood Donors")],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Icon(Icons.home), Text("Ambulances")],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
