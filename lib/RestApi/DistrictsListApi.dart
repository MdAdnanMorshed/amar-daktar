import 'dart:convert';
import 'package:amar_daktar/Models/DistrictsList.dart';
import 'package:http/http.dart' as http;
import 'package:amar_daktar/URL/Link.dart';

class DistrictsListApi {
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
        for (var district in jsonData['response']) {
          DistrictList districtList = DistrictList(
            district['division_id'],
            district['name'],
            district['lat'],
            district['lon'],
            district['website'],
          );
          districtsList.add(districtList);
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
