import 'dart:convert';
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
    try {
      final data = await http.post(Links.loginApiUrl,
          headers: {"Accept": "aplication/json"},
          body: {'email': uEmail, 'password': uPassword});
      final jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        status = jsonData['success'];
        print(status);
        return jsonData;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
