import 'package:amar_daktar/RestApi/HospitalListApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'hospitalListViewDetails.dart';

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HospitallistViewDetails(
                                  snapshot.data[index])),
                        );
                        print('Blood Donoar  Details Item Click');
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
