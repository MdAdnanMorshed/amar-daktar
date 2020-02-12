import 'dart:convert';
import 'package:amar_daktar/URL/Link.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetAppointmentApi {
  String doctorId = "";
  String hospitalId = "";
  String dateOfAppointment = "";
  String patientStatus = "";
  String problems = "";
  String doctorFees = "";
  static bool status = false;
  String token;
  static String userType;

  Future fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('userToken');

    final response = await http.post(Links.loginApiUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      'doctor_id': doctorId,
      'hospital_id': hospitalId,
      'date_of_appointment': dateOfAppointment,
      'patient_status': patientStatus,
      'problems': problems,
      'doctor_fees': doctorFees,
    });

    final jsonData = json.decode(response.body);
    print(jsonData);

    if (response.statusCode == 200) {
      status = jsonData['success'];
      print('getAppointment' + status.toString());
      print(jsonData['response']['name']);
      //LoginDataLocalSave.fromJson(jsonData['response']);
      print('get Appointment is successfull');
      return jsonData;
    } else {
      print('get Appointment is not successfull');
    }
  }
}
