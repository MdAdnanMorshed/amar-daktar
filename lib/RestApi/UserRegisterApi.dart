import 'dart:convert';
import 'package:amar_daktar/Models/LoginDataLocalSave.dart';
import 'package:amar_daktar/URL/Link.dart';
import 'package:http/http.dart' as http;

class UserRegisterApi {
  String uName = "testingName";
  String uEmail = "testingMail";
  String uPassword = "123456";
  String roleId = "4";
  String cityId = " ";
  var uImage;
  String uGender = "Male";
  String uPhone = "01888888888";

  static bool status = false;

  UserRegisterApi(this.uName, this.uEmail, this.uPassword, this.roleId,
      this.cityId, this.uImage, this.uGender, this.uPhone);

  Future fetchData() async {
    final response = await http.post(Links.getRegisterApiUrl, headers: {
      "Accept": "application/json"
    }, body: {
      'name': uName,
      'email': uEmail,
      'password': uPassword,
      //'role_id': roleId,
      //'city_id': cityId,
      //'pro_img': uImage,
      //'gender': uGender,
      'phone': uPhone,
    });

    final jsonData = json.decode(response.body);
    print('jsondata');
    print(jsonData);

    if (response.statusCode == 200) {
      status = jsonData['success'];
      print('status' + status.toString());
      print(jsonData['response']['name']);
      //LoginDataLocalSave.fromJson(jsonData['response']);
      print('Register is successfull');
      return jsonData;
    } else {
      print('Register is not Successful');
    }
  }
}
