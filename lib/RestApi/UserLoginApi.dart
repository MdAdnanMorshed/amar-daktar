import 'dart:convert';
import 'package:amar_daktar/URL/Link.dart';
import 'package:http/http.dart' as http;

class UserLoginApi {
  String uEmail = "";
  String uPassword = "";

  UserLoginApi(this.uEmail, this.uPassword);
  static bool status = false;
  static String userType;

  Future fetchData() async {
    try {
      final data = await http.post(Links.loginApiUrl,
          headers: {"Accept": "aplication/json"},
          body: {'email': uEmail, 'password': uPassword});
      final jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        userType = jsonData['user_info'][0]['user_type'];
        status = jsonData['success'];
        print(userType);
        return jsonData;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
