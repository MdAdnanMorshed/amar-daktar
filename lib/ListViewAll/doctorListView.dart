import 'package:amar_daktar/ListViewAll/doctorListViewDetails.dart';
import 'package:amar_daktar/RestApi/DoctorsListApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget doctorListView(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Container(
      child: FutureBuilder(
        future: DoctorsListApi().fetchData(),
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
                      leading: CircleAvatar(
                          backgroundImage: AssetImage('images/doctorpic.jpg')),
                      title: Text(snapshot.data[index].doctorName),
                      subtitle: Text(snapshot.data[index].doctorDesignation),
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
