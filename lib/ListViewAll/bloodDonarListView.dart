import 'package:amar_daktar/RestApi/BloodDonarListApi.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bloodDonarListViewDetails.dart';

Widget bloodDonarListView(BuildContext context, String searchtxt) {
  // Check Internet
  var connectivity = Provider.of<ConnectivityResult>(context, listen: true);
  print("bloodDonarListView: " + connectivity.toString());
  if (connectivity == ConnectivityResult.none) {
    // Offline
    return Text("No Internet");
  } else {
    // Online
    return FutureBuilder(
      future: BloodDonarListApi().fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.toString());
        if (snapshot.connectionState == ConnectionState.done) {
          print('snapshot.data.length' + snapshot.data.length.toString());
          if (snapshot.hasData) {
            return Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    print('index' + index.toString());
                    String bloodName = snapshot.data[index].bloodGroup;
                    if (searchtxt == bloodName) {
                      print('null');
                      return listItem(context, snapshot, index);
                    } else if (bloodName
                        .toLowerCase()
                        .contains(searchtxt.toLowerCase())) {
                      print('match');
                      return listItem(context, snapshot, index);
                    } else {
                      return Container();
                    }
                  }),
            );
          } else {
            return CircularProgressIndicator();
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

listItem(BuildContext context, AsyncSnapshot snapshot, int index) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
            backgroundImage: AssetImage(snapshot.data[index].DonarImage)),
        title: Text(snapshot.data[index].donarfastName +
            " " +
            snapshot.data[index].donarlastName),
        subtitle: Text(snapshot.data[index].bloodGroup),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BlooddonarlistViewDetails(snapshot.data[index])),
          );
          print('Blood Donoar  Details Item Click');
        },
      ),
    ),
  );
}
