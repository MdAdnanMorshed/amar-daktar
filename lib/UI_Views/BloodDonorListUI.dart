import 'package:amar_daktar/ListViewAll/bloodDonarListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class BloodDonorUI extends StatefulWidget {
  @override
  BloodDonorListPage createState() => BloodDonorListPage();
}

class BloodDonorListPage extends State<BloodDonorUI> {
  var searchTxt = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text('Blood Donor List'),
      ),
      body: Container(
        color: Colors.black12,
        child: Column(children: <Widget>[
          Container(
            color: Colors.green,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  decoration:
                      InputDecoration(hintText: "Blood Group Searching "),
                  onChanged: (text) {
                    print(text);
                    setState(() {
                      searchTxt = text;
                    });
                  }),
            ),
          ),
          Expanded(
            child: bloodDonarListView(context, searchTxt),
          ),
        ]),
      ),
    );
  }
}
