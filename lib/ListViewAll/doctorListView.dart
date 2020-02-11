import 'package:amar_daktar/ListViewAll/doctorListViewDetails.dart';
import 'package:amar_daktar/RestApi/DoctorsListApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget doctorListView(BuildContext context, String searchTxt) {
  return FutureBuilder(
    future: DoctorsListApi().fetchData(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        print('snapshot.data.length' + snapshot.data.length.toString());
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                print('index' + index.toString());
                String doctorName = snapshot.data[index].doctorName;
                if (searchTxt == doctorName) {
                  print('null');
                  return listItem(context, snapshot, index);
                } else if (doctorName
                    .toLowerCase()
                    .contains(searchTxt.toLowerCase())) {
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
