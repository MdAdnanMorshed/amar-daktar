import 'package:amar_daktar/RestApi/AmbulancesListApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  child: Text('Loading...'),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data[index].ambulanceName),
                      subtitle: Text('Address: ' +
                          snapshot.data[index].ambulanceAddress +
                          '\n' +
                          snapshot.data[index].ambulanceMobile),
                      onTap: () {
                        print('Ambulances Details Item Click');
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
