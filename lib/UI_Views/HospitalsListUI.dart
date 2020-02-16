import 'package:amar_daktar/ListViewAll/hospitalListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class HospitalListUI extends StatefulWidget {
  @override
  HospitalListPage createState() => HospitalListPage();
}

class HospitalListPage extends State<HospitalListUI> {
  var searchTxt = "";
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
        child: Column(children: <Widget>[
          Center(
            child: Container(
              color: Colors.greenAccent,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration:
                        InputDecoration(hintText: "Hospital Searching "),
                    onChanged: (text) {
                      print(text);
                      setState(() {
                        searchTxt = text;
                      });
                    }),
              ),
            ),
          ),
          Container(
            child: hospitalListView(context, searchTxt),
          ),
        ]),
      ),
    );
  }
}
