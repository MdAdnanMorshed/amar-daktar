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
          crossAxisCount: 2,
          children: <Widget>[
            MenuItemCard('Doctors', Icons.home),
            MenuItemCard('Hospitals', Icons.home),
            MenuItemCard('Blood Donars', Icons.home),
            MenuItemCard('Ambulances', Icons.home),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MenuItemCard extends StatelessWidget {
  MenuItemCard(this.title, this.iCon);
  String title;
  IconData iCon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          child: InkWell(
            // onTap pass

            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(iCon, size: 50.0),
                  Text(title, style: TextStyle(fontSize: 20.3)),
                  Text("1250")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
