import 'package:amar_daktar/ListViewAll/doctorListViewDetails.dart';
import 'package:amar_daktar/RestApi/DoctorsListApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget doctorListView(BuildContext context) {
  return Container(
    color: Colors.white,
    child: FutureBuilder(
      future: DoctorsListApi().fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.data.length);
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
                      ? searchbar(snapshot, index)
                      : listItem(context, snapshot, index);
                });
          }
        } else {
          return Container(
            child: LinearProgressIndicator(),
          );
        }
      },
    ),
  );
}

// Doctor  Search
searchbar(AsyncSnapshot snapshot, int index) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
        decoration: InputDecoration(hintText: "Doctor Searching "),
        onChanged: (text) {
          // Searching
        }),
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
        title: Text(snapshot.data[index].doctorName),
        subtitle: Text(snapshot.data[index].doctorDesignation),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DoctorlistViewDetails(snapshot.data[index])),
          );
          print('Doctor  Details Item Click');
        },
      ),
    ),
  );
}
