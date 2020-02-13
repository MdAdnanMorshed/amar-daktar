import 'package:amar_daktar/Models/BloodDonarList.dart';
import 'package:amar_daktar/UI_Views/AppDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlooddonarlistViewDetails extends StatelessWidget {
  final BloodDonarList bloodDonarList;

  BlooddonarlistViewDetails(this.bloodDonarList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text(
            bloodDonarList.donarfastName + " " + bloodDonarList.donarlastName),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.indigo,
                  width: 1,
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/profile.png'),
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            color: Colors.blueGrey,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 5, right: 0, bottom: 7),
                    child: Text("Blood Donar :",
                        style: TextStyle(color: Colors.white, fontSize: 14.5)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                        bloodDonarList.donarfastName +
                            " " +
                            bloodDonarList.donarlastName,
                        style: TextStyle(color: Colors.white, fontSize: 15.5)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            color: Colors.blueGrey,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 7, right: 0, bottom: 7),
                    child: Text("Mobile :",
                        style: TextStyle(color: Colors.white, fontSize: 14.5)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(bloodDonarList.donarPhone,
                        style: TextStyle(color: Colors.white, fontSize: 15.5)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            color: Colors.blueGrey,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 5, right: 0, bottom: 7),
                    child: Text("Email Address:",
                        style: TextStyle(color: Colors.white, fontSize: 14.5)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(bloodDonarList.donarEmail,
                        style: TextStyle(color: Colors.white, fontSize: 18.5)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            color: Colors.blueGrey,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 5, right: 0, bottom: 7),
                    child: Text("Country:",
                        style: TextStyle(color: Colors.white, fontSize: 14.5)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(bloodDonarList.donarConutry,
                        style: TextStyle(color: Colors.white, fontSize: 18.5)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            color: Colors.blueGrey,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 5, right: 0, bottom: 5),
                    child: Text(
                      "Blood Group :",
                      style: TextStyle(color: Colors.white, fontSize: 14.5),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      bloodDonarList.bloodGroup,
                      style: TextStyle(color: Colors.white, fontSize: 15.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            color: Colors.blueGrey,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 5, right: 0, bottom: 5),
                    child: Text(
                      "Blood Donar Address :",
                      style: TextStyle(color: Colors.white, fontSize: 14.5),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      bloodDonarList.bloodDonarAddress,
                      style: TextStyle(color: Colors.white, fontSize: 15.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      "Blood Donar Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    onPressed: () {
                      // _SendMessage(context);
                      print("I am Blood Donar Sign Up button !");
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Alert Dialog title"),
        content: new Text("Alert Dialog body"),
        actions: <Widget>[
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a search term'),
          ),
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
