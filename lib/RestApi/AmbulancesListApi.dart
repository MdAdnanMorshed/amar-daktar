import 'package:amar_daktar/Models/DoctorsList.dart';
import 'package:http/http.dart' as http;
import 'package:amar_daktar/URL/Link.dart';
import 'dart:convert';

class AmbulancesListApi {
  List getAmbulancesList = [];
  bool status = false;

  Future fetchData() async {
    try {
      final data = await http.get(
        Links.getambulanceslistApiUrl,
        headers: {"Accept": "aplication/json"},
      );
      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        status = jsonData['success'];
        getAmbulancesList.clear();
        for (var item in jsonData['response']) {
          DoctorsList getdoctorlist = DoctorsList(
            item['user_id'],
            item['doctor_name'],
            item['department_id'],
            item['title_or_designation'],
            item['doctor_fees'],
            item['gender'],
            item['country_id'],
            item['city_id'],
            item['area_id'],
            item['degree_and_other_specification'],
            item['bmdc_reg_no'],
            item['description'],
          );
          getAmbulancesList.add(getdoctorlist);
        }
        print(getAmbulancesList);

        return getAmbulancesList;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
