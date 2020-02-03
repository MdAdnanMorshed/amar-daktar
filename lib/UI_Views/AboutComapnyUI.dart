import 'package:amar_daktar/ListViewAll/ambulanceListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class About extends StatefulWidget {
  @override
  AboutPage createState() => AboutPage();
}

class AboutPage extends State<About> {
  String node =
      'Lorem ipsum dolor sit amet, consectetur elit, sed eiusmod tempor aliqua.';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            MenuItemCard('24/7 Ambulance', Icons.home, node),
            MenuItemCard('Emergency Care', Icons.home, node),
            MenuItemCard('Blood Operation Thearer', Icons.home, node),
            MenuItemCard('Outdoor Checkup', Icons.home, node),
            MenuItemCard('Bone Care', Icons.home, node),
            MenuItemCard('Blood Test', Icons.home, node),
            MenuItemCard('Pathology Test', Icons.home, node),
            MenuItemCard('Pharmacy', Icons.home, node),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MenuItemCard extends StatelessWidget {
  MenuItemCard(this.title, this.iCon, this.text);
  String title;
  IconData iCon;
  String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          child: InkWell(
            // onTap pass

            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(iCon, size: 20.0),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 8.0)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 6.0)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
