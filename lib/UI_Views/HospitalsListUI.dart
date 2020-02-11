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
          Expanded(
            child: hospitalListView(context, searchTxt),
          ),
        ]),
      ),
    );
  }
}
