import 'dart:convert';
import 'package:amar_daktar/Models/AreaList.dart';
import 'package:amar_daktar/Models/CityLocationList.dart';
import 'package:http/http.dart' as http;
import 'package:amar_daktar/URL/Link.dart';

class AreaListApi {
  bool status = false;

  List<AreaList> getAreaList = [];

  Future<List<AreaList>> fetchData() async {
    try {
      final data = await http.post(
        Links.areaLocationApi,
        headers: {"Accept": "aplication/json"},
      );

      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        status = jsonData['success'];
        getAreaList.clear();
        for (var area in jsonData['response']) {
          AreaList cityList = AreaList(
            area['id'],
            area['country_id'],
            area['city_id'],
            area['name'],
          );
          getAreaList.add(cityList);
        }
        print(getAreaList);
        return getAreaList;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
