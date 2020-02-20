import 'dart:convert';
import 'package:amar_daktar/Models/CityLocationList.dart';
import 'package:http/http.dart' as http;
import 'package:amar_daktar/URL/Link.dart';

class CityListApi {
  bool status = false;

  List<CityList> getCityList = [];

  Future<List<CityList>> fetchData() async {
    try {
      final data = await http.get(
        Links.cityLocationApi,
        headers: {"Accept": "aplication/json"},
      );

      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        status = jsonData['success'];
        getCityList.clear();
        for (var city in jsonData['response']) {
          CityList cityList = CityList(
            city['id'],
            city['division_id'],
            city['name'],
            city['lat'],
            city['lon'],
            city['website'],
          );
          getCityList.add(cityList);
        }
        print(getCityList);
        return getCityList;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
