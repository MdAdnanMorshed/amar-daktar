import 'dart:convert';
import 'package:amar_daktar/Models/LoginDataLocalSave.dart';
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
    final response = await http.post(Links.loginApiUrl,
        headers: {"Accept": "application/json"},
        body: {'email': uEmail, 'password': uPassword});

    final jsonData = json.decode(response.body);
    print(jsonData);

    if (response.statusCode == 200) {
      status = jsonData['success'];
      print(status);
      print('name' + jsonData['response']['name']);
      print('Email:' + jsonData['response']['email']);
      print('image name:' + jsonData['response']['pro_img']);
      LoginDataLocalSave.fromJson(jsonData['response']);
      print('success');
      return jsonData;
    } else {
      print('200 else');
    }
  }
}
