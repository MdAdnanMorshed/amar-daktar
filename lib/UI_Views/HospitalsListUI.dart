import 'package:amar_daktar/ListViewAll/hospitalListView.dart';
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
        child: hospitalListView(context),
      ),
    );
  }
}

Widget hospitalListView(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Container(
      child: FutureBuilder(
        future: HospitalListApi().fetchDataHospital(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Hospital Loading...'),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundImage: AssetImage('images/doctorpic.jpg')),
                      title: Text(snapshot.data[index].hospitalChamberName),
                      subtitle:
                          Text(snapshot.data[index].hospitalChamberAddress),
                      onTap: () {
                        print('onClick');
                      },
                    );
                  });
            }
          } else {
            return Container(
              child: LinearProgressIndicator(),
            );
          }
        },
      ),
    ),
  );
}
