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
                    return ListTile(
                      title: Text(snapshot.data[index].donarEmail),
                      subtitle: Text('tasting blood'),
                      onTap: () {
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
