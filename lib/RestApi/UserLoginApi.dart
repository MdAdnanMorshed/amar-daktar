import 'dart:convert';

import 'package:amar_daktar/UI_Views/UserRegister.dart';
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

    final response = await http.post(Links.loginApiUrl,
        headers: {"Accept": "application/json"},
        body: {'email': uEmail, 'password': uPassword});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      print(jsonData['response']['token']);

      status = jsonData['success'];

      // SF Save token and role id
      prefs.setString('loginToken', jsonData['response']['token'].toString());
      prefs.setString('role_id', jsonData['response']['role_id'].toString());

//        return jsonData;
//      } else {
//        print("error");
//        throw Exception('Error');
//      }
    }
  }
}
