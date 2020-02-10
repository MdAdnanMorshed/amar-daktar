import 'dart:convert';
import 'package:amar_daktar/Models/LoginDataLocalSave.dart';
import 'package:amar_daktar/URL/Link.dart';
import 'package:http/http.dart' as http;

class UserRegisterApi {
  String uName = "sakib";
  String uPhone = "0189999999";
  String uEmail = "sakib@gmail.com";
  String uPassword = "123456789";
  String uGender = "";
  String uImage = "";
  static bool status = false;
/*
  UserRegisterApi(this.uName, this.uPhone, this.uEmail, this.uGender,
      this.uImage); // constructor
*/
  Future fetchData() async {
    final response = await http.post(Links.getRegisterApiUrl, headers: {
      "Accept": "application/json"
    }, body: {
      'name': uName,
      'phone': uPhone,
      'email': uEmail,
      'gender': uGender,
      'password': uPassword
      //'pro_img': uImage
    });

    final jsonData = json.decode(response.body);
    print('jsondata');
    print(jsonData);

    if (response.statusCode == 200) {
      status = jsonData['success'];
      print(status);
      print(jsonData['response']['name']);
      //LoginDataLocalSave.fromJson(jsonData['response']);
      print('Register is successfull ');
      return jsonData;
    } else {
      print('200 else');
    }
  }
}
