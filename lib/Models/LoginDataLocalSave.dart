import 'package:shared_preferences/shared_preferences.dart';

class LoginDataLocalSave {
  static int uId;
  String uRoleId;
  String uName;
  String uEmail;

  String uPhone;
  String uMailVarify;
  String uImage;
  String uToken;

  LoginDataLocalSave.fromJson(Map json) {
    if (json.containsKey('id')) {
      uId = json['id'];
    }
    if (json.containsKey('role_id')) {
      uRoleId = json['role_id'];
    }
    if (json.containsKey('name')) {
      uName = json['name'];
    }
    if (json.containsKey('uEmail')) {
      uEmail = json['uEmail'];
    }
    if (json.containsKey('uPhone')) {
      uPhone = json['uPhone'];
    }
    if (json.containsKey('uMailVarify')) {
      uMailVarify = json['uMailVarify'];
    }
    if (json.containsKey('pro_img')) {
      uImage = json['pro_img'];
    }
    if (json.containsKey('token')) {
      uToken = json['token'];
    }

    userInfoToSF();
  }

  userInfoToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', uId);
    prefs.setString('userRoleId', uRoleId);
    prefs.setString('userName', uName);
    prefs.setString('userEmail', uEmail);
    prefs.setString('userPhone', uPhone);
    prefs.setString('userMailverfiy', uMailVarify);
    prefs.setString('userIamge', uImage);
    prefs.setString('userToken', uToken);
  }
}
