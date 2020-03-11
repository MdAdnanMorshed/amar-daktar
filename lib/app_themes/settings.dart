
import 'package:amar_daktar/app_themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_themes.dart';
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: AppTheme.values.length,
          itemBuilder: (BuildContext context, int index) {
            print('index'+index.toString());
            // Get theme enum for the current item index
            final theme = AppTheme.values[index];
            print('theme:'+theme.toString());
            return Card(
              // Style the item with corresponding theme color
              color: appThemeData[theme].primaryColor,
              child: ListTile(
                onTap: () {

                  final user =Provider.of<ThemeManager>(context).setTheme(theme);


                },
                title: Text(
                  enumName(theme),
                  style: appThemeData[theme].textTheme.body1,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}