import 'dart:convert';
import 'package:amar_daktar/Models/LoginDataLocalSave.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:amar_daktar/URL/Link.dart';
import 'package:http/http.dart' as http;

class GetAppointmentApi {
  String doctorId = "";
  String hospitalId = "";
  String dateOfAppointment = "";
  String patientStatus = "";

  String problems = "";
  String doctor_fees = "";

  static bool status = false;
  static String userType;

  Future fetchData() async {
    final response = await http.post(Links.loginApiUrl, headers: {
      "Accept": "application/json"
    }, body: {
      'doctor_id': doctorId,
      'hospital_id': hospitalId,
      'date_of_appointment': dateOfAppointment,
      'patient_status': patientStatus,
      'problems': problems,
      'doctor_fees': doctor_fees,
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
      print('200 else');
    }
  }
}
