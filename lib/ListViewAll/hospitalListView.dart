import 'package:amar_daktar/RestApi/HospitalListApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget hospitalListView(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Container(
      child: FutureBuilder(
        future: HospitalListApi().fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
