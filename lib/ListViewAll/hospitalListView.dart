import 'package:amar_daktar/RestApi/HospitalListApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'hospitalListViewDetails.dart';

Widget hospitalListView(BuildContext context, String searchtxt) {
  return FutureBuilder(
    future: HospitalListApi().fetchDataHospital(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        print('snapshot.data.length' + snapshot.data.length.toString());
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                print('index' + index.toString());
                String hospitalName = snapshot.data[index].hospitalChamberName;
                if (searchtxt == hospitalName) {
                  print('null');
                  return listItem(context, snapshot, index);
                } else if (hospitalName
                    .toLowerCase()
                    .contains(searchtxt.toLowerCase())) {
                  print('match');
                  return listItem(context, snapshot, index);
                } else {
                  return Container();
                }
              });
        } else {
          return CircularProgressIndicator();
        }
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}

listItem(BuildContext context, AsyncSnapshot snapshot, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: ListTile(
        leading:
            // path Name
            CircleAvatar(backgroundImage: AssetImage('images/profile.png')),
        title: Text(snapshot.data[index].ambulanceName +
            "\n" +
            snapshot.data[index].ambulanceType),
        subtitle: Text(snapshot.data[index].ambulanceService),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HospitallistViewDetails(snapshot.data[index])),
          );
          print('Ambulances  Details Item Click');
        },
      ),
    ),
  );
}
