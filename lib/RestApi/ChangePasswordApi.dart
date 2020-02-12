import 'dart:convert';
import 'package:amar_daktar/Models/LoginDataLocalSave.dart';
import 'package:amar_daktar/URL/Link.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword {
  String uOldPassword = "";
  String uNewPassword = "";
  String token = "";
  static bool status = false;

  ChangePassword(this.uOldPassword, this.uNewPassword); // constructor

  Future fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('userToken');

    print('contectToken:' + token);
    print('End line');

    final response = await http.post(Links.getChangePasswordApiUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      'old_password': uOldPassword,
      'password': uNewPassword
    });

    final jsonData = json.decode(response.body);
    print(jsonData);

    if (response.statusCode == 200) {
      status = jsonData['success'];
      print('changeStatus :' + status.toString());
      print(jsonData['response']['name']);
      print('change Password is Successfull!');
      return jsonData;
    } else {
      print('change Password is not  Successfull!');
    }
  }
}

/*
void getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      studentId = prefs.getString('STUDENT_ID');
    });

    print('Studen Id:$studentId');
    getData(studentId);
  }
 */
