import 'package:amar_daktar/RestApi/AmbulancesListApi.dart';
import 'package:flutter/material.dart';
import 'ambulanceListViewDetails.dart';

Widget ambulanceListView(BuildContext context, String searchTxt) {
  return FutureBuilder(
    future: AmbulancesListApi().fetchData(),
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
                  String ambulance = snapshot.data[index].ambulanceName;
                  if (searchTxt == ambulance) {
                    print('null');
                    return listItem(context, snapshot, index);
                  } else if (ambulance
                      .toLowerCase()
                      .contains(searchTxt.toLowerCase())) {
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
                    AmbulancelistViewDetails(snapshot.data[index])),
          );
          print('Ambulances  Details Item Click');
        },
      ),
    ),
  );
}
