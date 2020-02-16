import 'package:amar_daktar/Models/AmbulancesList.dart';
import 'package:http/http.dart' as http;
import 'package:amar_daktar/URL/Link.dart';
import 'dart:convert';

class AmbulancesListApi {
  List<AmbulanceList> getAmbulancesList = [];
  bool status = false;

  Future<List<AmbulanceList>> fetchData() async {
    try {
      final data = await http.get(
        Links.getambulanceslistApiUrl,
        headers: {"Accept": "aplication/json"},
      );
      var jsonData = json.decode(data.body);

      print('Ambulances:');
      print(jsonData);

      if (data.statusCode == 200) {
        status = jsonData['success'];
        getAmbulancesList.clear();
        for (var item in jsonData['response']) {
          AmbulanceList getambulanceslist = AmbulanceList(
            //item['id'],
            item['name'],
            item['ambulance_type'],
            item['mobile_number'],
            item['phone_number'],
            item['email'],
            item['country_id'],
            item['city_id'],
            item['area_id'],
            item['address'],
            item['services'],
            item['descriptions'],
          );
          getAmbulancesList.add(getambulanceslist);
        }
        print('retrun');
        print(getAmbulancesList);
        return getAmbulancesList;
      } else {
        print('ammbualnce error:');
        throw Exception('Error');
      }
    } catch (e) {
      print('ammbualnce error:' + e.toString());
      throw Exception(e.toString());
    }
  }
}
