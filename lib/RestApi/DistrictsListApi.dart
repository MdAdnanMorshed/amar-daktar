import 'dart:convert';

import 'package:amar_daktar/Models/DoctorsList.dart';
import 'package:http/http.dart' as http;
import 'package:amar_daktar/URL/Link.dart';

class DistrictsList {
  bool status = false;
  static List districtsList = [];

  Future fetchData() async {
    try {
      final data = await http.get(
        Links.getdistrictsApiUrl,
        headers: {"Accept": "aplication/json"},
      );

      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        status = jsonData['success'];
        districtsList.clear();
        for (var item in jsonData['response']) {
          DistrictsList getdistrict = DistrictsList();
          // districtsList.add(getdoctorlist);

        }
        print(districtsList);
        return districtsList;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
