import 'package:amar_daktar/ListViewAll/ambulanceListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class AmbulanceListUI extends StatefulWidget {
  @override
  AmbulanceListPage createState() => AmbulanceListPage();
}

class AmbulanceListPage extends State<AmbulanceListUI> {
  var searchTxt = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text('Ambulance List'),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            color: Colors.green,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(hintText: "Doctor Searching "),
                  onChanged: (text) {
                    print(text);
                    setState(() {
                      searchTxt = text;
                    });
                  }),
            ),
          ),
          Container(
            child: ambulanceListView(context, searchTxt),
          ),
        ]),
      ),
    );
  }
}
