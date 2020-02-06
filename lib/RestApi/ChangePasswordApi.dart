import 'dart:convert';
import 'package:amar_daktar/Models/LoginDataLocalSave.dart';
import 'package:amar_daktar/URL/Link.dart';
import 'package:http/http.dart' as http;

class ChangePassword {
  String uOldPassword = "";
  String uNewPassword = "";
  static bool status = false;

  ChangePassword(this.uOldPassword, this.uNewPassword); // constructor

  Future fetchData() async {
    final response = await http.post(Links.getChangePasswordApiUrl,
        headers: {"Authorization": "Bearer"}, // Totken
        body: {'old_password': uOldPassword, 'password': uNewPassword});

    final jsonData = json.decode(response.body);
    print(jsonData);

    if (response.statusCode == 200) {
      status = jsonData['success'];
      print(status);
      print(jsonData['response']['name']);
      LoginDataLocalSave.fromJson(jsonData['response']);
      print('success');
      return jsonData;
    } else {
      print('200 else');
    }
  }
}
