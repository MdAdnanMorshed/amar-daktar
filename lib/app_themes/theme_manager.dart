
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_themes.dart';



class ThemeManager with ChangeNotifier {
  ThemeData _themeData;
  final _kThemePreference = "theme_preference";
  /// Use this method on UI to get selected theme.

  ThemeManager() {
    // We load theme at the start
    _loadTheme();
  }
  void _loadTheme() {
    debugPrint("Entered loadTheme()");
    SharedPreferences.getInstance().then((prefs) {
      int preferredTheme = prefs.getInt('_kThemePreference') ?? 2;
      _themeData = appThemeData[AppTheme.values[preferredTheme]];
      // Once theme is loaded - notify listeners to update UI
      notifyListeners();
    });
  }

  ThemeData get themeData {
    if (_themeData == null) {
      _themeData = appThemeData[AppTheme.Dark];
    }
    return _themeData;
  }

  setTheme(AppTheme theme) async {
    _themeData = appThemeData[theme];
    notifyListeners();
    // Save selected theme into SharedPreferences
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('_kThemePreference', AppTheme.values.indexOf(theme));
    notifyListeners();
  }
}
