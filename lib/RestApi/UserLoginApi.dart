import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:amar_daktar/URL/Link.dart';
import 'package:http/http.dart' as http;

class UserLoginApi {
  String uEmail = "";
  String uPassword = "";
  static bool status = false;
  static String userType;

  // constructor
  UserLoginApi(this.uEmail, this.uPassword);

  Future fetchData() async {
    print(uEmail);
    print(uPassword);
    var jsonData = null;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.post(Links.loginApiUrl,
          headers: {"Accept": "aplication/json"},
          body: {'email': uEmail, 'password': uPassword});

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        prefs.setString('loginToken', jsonData['token']);

        print(prefs.get('loginToken'));

        return jsonData;
      } else {
        print("error");
        throw Exception('Error');
      }
    } catch (e) {
      print("Catch Error");
      throw Exception(e.toString());
    }
  }
}
