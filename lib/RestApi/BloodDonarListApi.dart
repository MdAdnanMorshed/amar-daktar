import 'package:amar_daktar/Models/AmbulancesList.dart';
import 'package:amar_daktar/Models/BloodDonarList.dart';
import 'package:http/http.dart' as http;
import 'package:amar_daktar/URL/Link.dart';
import 'dart:convert';

class BloodDonarListApi {
  //List getBloodDonarList = [];
  List<BloodDonarList> getBloodDonarList = [];
  bool status = false;

  Future<List<BloodDonarList>> fetchData() async {
    try {
      final data = await http.get(
        Links.getBloodDonarListApiUrl,
        headers: {"Accept": "aplication/json"},
      );
      var jsonData = json.decode(data.body);

      print('Ambulances:');
      print(jsonData);

      if (data.statusCode == 200) {
        status = jsonData['success'];
        getBloodDonarList.clear();
        for (var item in jsonData['response']) {
          BloodDonarList blooddonarList = BloodDonarList(
            item['name'],
            item['last_name'],
            item['email'],
            item['phone'],
            item['birth_day'],
            item['gender'],
            item['last_blood_bonate_date'],
            item['blood_group'],
            item['age'],
            item['conutry'],
            item['division_id'],
            item['distric_id'],
            item['address'],
            item['pro_img'],
          );
          getBloodDonarList.add(blooddonarList);
        }
        print(getBloodDonarList);

        return getBloodDonarList;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
