import 'package:amar_daktar/UI_Views/UserRegister.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("DeshBoard"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey)),
                    gradient: LinearGradient(
                        colors: <Color>[Colors.blueAccent, Colors.blue])),
                child: Text("demo@gmail.com")),
            CustomListItem(Icons.dashboard, 'DeshBoard', () => {}),
            CustomListItem(Icons.room_service, 'Service', () => {}),
            CustomListItem(Icons.perm_data_setting, 'Blog', () => {}),
            CustomListItem(Icons.add_call, 'Contact', () => {}),
            CustomListItem(Icons.people, 'About', () => {}),
            CustomListItem(Icons.lock, 'Logout', () => {}),
          ],
        ),
      ),
    );
  }
}

// header item menu
class CustomListItem extends StatelessWidget {
  final IconData icons;
  final String itemName;
  final Function onTap;

  // constructor
  CustomListItem(this.icons, this.itemName, this.onTap);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.cyan,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icons),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(itemName),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
