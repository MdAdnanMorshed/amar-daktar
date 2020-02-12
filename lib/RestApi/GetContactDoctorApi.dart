import 'dart:convert';
import 'package:amar_daktar/URL/Link.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ContectdoctorApi {
  String cDoctorId = "";
  String patientName = "";
  String patientPhone = "";
  String patientEmail = "";
  String patientMsg = "";

  String token;

  static bool status = false;
  static String userType;

  ContectdoctorApi(this.cDoctorId, this.patientName, this.patientPhone,
      this.patientEmail, this.patientMsg);

  Future fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('userToken');

    final response = await http.post(Links.loginApiUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      'doctor_id': cDoctorId,
      'name': patientName,
      'phn': patientPhone,
      'email': patientEmail,
      'msg': patientMsg,
    });

    final jsonData = json.decode(response.body);
    print(jsonData);

    if (response.statusCode == 200) {
      status = jsonData['success'];
      print('contactStatus:' + status.toString());
      print(jsonData['response']['name']);
      // LoginDataLocalSave.fromJson(jsonData['response']);

      print('contact is successful');
      return jsonData;
    } else {
      print('contact is not successful');
    }
  }
}
