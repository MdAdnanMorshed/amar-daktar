import 'package:amar_daktar/ListViewAll/ambulanceListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class Contact extends StatefulWidget {
  @override
  ContactPage createState() => ContactPage();
}

class ContactPage extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(currentRoute: '/dashboard'),
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              MenuItemCard('Mail Us', Icons.mail_outline, 'info@surfaceit.com'),
              MenuItemCard('Call Us', Icons.call, '+8801400353344'),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MenuItemCard extends StatelessWidget {
  MenuItemCard(this.title, this.iCon, this.text);
  String title;
  IconData iCon;
  String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: InkWell(
            // onTap pass

            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(iCon, size: 50.0),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15.0)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10.0)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
