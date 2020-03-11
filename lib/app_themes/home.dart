import 'package:amar_daktar/app_themes/settings.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                //Navigate to Settings screen
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Settings()
                ));
              },
            )
          ],
        ),
        body: Center(
          child: Text(
            'Hello, Provider!',
            style: Theme.of(context).textTheme.headline,
          ),
        ));
  }
}