import 'package:amar_daktar/Models/HospitalsList.dart';
import 'package:http/http.dart' as http;
import 'package:amar_daktar/URL/Link.dart';
import 'dart:convert';
import 'dart:async';

class HospitalListApi {
  List<HospitalList> getHospitalListClass = [];
  bool status = false;

  Future<List<HospitalList>> fetchDataHospital() async {
    try {
      final data = await http.get(
        Links.gethospitalslistApiUrl,
        headers: {"Accept": "aplication/json"},
      );
      var jsonData = json.decode(data.body);

      print('Hospital List Name:');
      //  print(jsonData);

      if (data.statusCode == 200) {
        status = jsonData['success'];
        print('hospital' + status.toString());
        getHospitalListClass.clear();
        for (var item in jsonData['response']) {
          print('hospital');
//          HospitalList gethospitallist = HospitalList(
//            item['user_id'],
//            item['hospital_chamber_name'],
//            item['about_hospital'],
//            item['mission_vision'],
//            item['country_id'],
//            item['city_id'],
//            item['area_id'],
//            item['hospital_chamber_address'],
//            item['service_details'],
//            item['license_no'],
//            item['image'],
//            item['status'],
//          );
//          getHospitalListClass.add(gethospitallist);
//          print('Hospital Address:' + gethospitallist.hospitalAbout);
        }
        print('before');
        return getHospitalListClass;
        print('after');
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
