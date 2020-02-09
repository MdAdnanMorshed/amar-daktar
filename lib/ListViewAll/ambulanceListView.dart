import 'package:amar_daktar/RestApi/AmbulancesListApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ambulanceListViewDetails.dart';

Widget ambulanceListView(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Container(
      child: FutureBuilder(
        future: AmbulancesListApi().fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.toString());
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text(' Loading...'),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? _searchbar(snapshot, index)
                        : _listItem(context, snapshot, index);
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

// ambulance Search
_searchbar(AsyncSnapshot snapshot, int index) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
        decoration: InputDecoration(hintText: "ambulance Searching "),
        onChanged: (text) {
          // Searching
        }),
  );
}

_listItem(BuildContext context, AsyncSnapshot snapshot, int index) {
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
          print('Blood Donoar  Details Item Click');
        },
      ),
    ),
  );
}
