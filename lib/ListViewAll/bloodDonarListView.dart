import 'package:amar_daktar/RestApi/BloodDonarListApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bloodDonarListView(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Container(
      child: FutureBuilder(
        future: BloodDonarListApi().fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.toString());
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? _searchbar(snapshot, index)
                        : _listItem(snapshot, index);
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

// Blood Group Search
_searchbar(AsyncSnapshot snapshot, int index) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
        decoration: InputDecoration(hintText: "Blood Group Searching "),
        onChanged: (text) {
          // Searching
        }),
  );
}

_listItem(AsyncSnapshot snapshot, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: ListTile(
        leading: CircleAvatar(
            backgroundImage: AssetImage(snapshot.data[index].DonarImage)),
        title: Text("Name: " +
            snapshot.data[index].donarfastName +
            " " +
            snapshot.data[index].donarlastName),
        subtitle: Text("Blood Group :" + snapshot.data[index].bloodGroup),
        onTap: () {
          print('Blood Donoar  Details Item Click');
        },
      ),
    ),
  );
}
