import 'package:amar_daktar/ListViewAll/doctorListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class DoctorListUI extends StatefulWidget {
  @override
  DoctorListPage createState() => DoctorListPage();
}

class DoctorListPage extends State<DoctorListUI> {
  var searchTxt = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text('Doctor List'),
      ),
      body: Container(
        // color: Colors.blue,
        // child: doctorListView(context),
        child: Column(children: <Widget>[
          Container(
            color: Colors.greenAccent,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                  textAlign: TextAlign.center,
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
            child: doctorListView(context, searchTxt),
          ),
        ]),
      ),
    );
  }
}
