import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FindHospitalUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown List From API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Your Hospital"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              FutureBuilder<Widget>(
                future: _countryList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data;
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(height: 20),
              FutureBuilder<Widget>(
                future: _cityList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data;
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(height: 20),
              FutureBuilder<Widget>(
                future: _areaList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data;
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(height: 20),
              FutureBuilder<Widget>(
                future: _hospitalList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data;
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  bool notfoundStatus = true;

  var _selectedCountryItem, _selectedCityItem, _selectedAreaItem;

  int _countryId, _cityId, _areaId = 0;
  String _service = "hospital";

  Future<Widget> _countryList() async {
    final url = "url";
    List<DropdownMenuItem> list = [];

    //await http.get(url).then((response) {
    //Map data = jsonDecode(response.body);
    Map data = {
      "success": true,
      "response": [
        {"id": 1, "name": "Bangladesh"},
        {"id": 2, "name": "India"}
      ]
    };
    List country = data["response"];

    for (var i = 0; i < country.length; i++) {
      var item = DropdownMenuItem(
        child: Text(country[i]["name"]),
        value: country[i]["id"].toString(),
      );
      list.add(item);
    }
    //});

    return DropdownButtonFormField(
      hint: Text("Select Your Country..."),
      items: list,
      value: _selectedCountryItem,
      onChanged: (id) {
        setState(() {
          _selectedCountryItem = id;
          _countryId = int.parse(id);
          _selectedCityItem = null;
          _selectedAreaItem = null;
        });
        print("Country Id: " + id);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
        border: OutlineInputBorder(),
      ),
    );
  }

  Future<Widget> _cityList() async {
    final url = "http://amardaktar24.com/public/api/get/all/districts";
    List<DropdownMenuItem> list = [];

    if (_countryId == null) {
      _countryId = 0;
    }
    print("_countryId: " + _countryId.toString());

    await http.get(url).then((response) {
      Map data = jsonDecode(response.body);
      //  print('city :' + data.toString());
      List city = data["response"];
      for (var i = 0; i < city.length; i++) {
        // if (_countryId == city[i]["countryId"]) {
        var item = DropdownMenuItem(
          child: Text(city[i]["name"]),
          value: city[i]["id"].toString(),
        );
        list.add(item);
        // }
      }
    });

    return DropdownButtonFormField(
      hint: Text("Select Your City..."),
      items: list,
      value: _selectedCityItem,
      onChanged: (id) {
        setState(() {
          _selectedCityItem = id;
          _cityId = int.parse(id);
          _selectedAreaItem = null;
        });
        print("City Id: " + id);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
        border: OutlineInputBorder(),
      ),
    );
  }

  Future<Widget> _areaList() async {
    final url = "http://amardaktar24.com/api/get-location";
    List<DropdownMenuItem> list = [];
    print('areaCityId:' + _cityId.toString());
    if (_cityId == null) {
      _cityId = 0;
    }
    print("_cityId: " + _cityId.toString());

    await http.post(url,
        headers: {"Accept": "application/json"},
        body: {"city_id": "$_cityId"}).then((response) {
      Map data = jsonDecode(response.body);
      // print('area' + data.toString());

      List area = data["response"];

      for (var i = 0; i < area.length; i++) {
        if (_cityId.toString() == area[i]["city_id"]) {
          var item = DropdownMenuItem(
            child: Text(area[i]["name"]),
            value: area[i]["id"].toString(),
          );
          list.add(item);
        }
      }
    });

    return DropdownButtonFormField(
      hint: Text("Select Your Area..."),
      items: list,
      value: _selectedAreaItem,
      onChanged: (id) {
        setState(() {
          _selectedAreaItem = id;
          _areaId = int.parse(id);
        });
        print("Area Id: " + id);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
        border: OutlineInputBorder(),
      ),
    );
  }

  Future<Widget> _hospitalList() async {
    final url = "http://amardaktar24.com/api/search";
    List<ListTile> list = [];

    print('-----------Doctor  Searching --------------');
    print('Searching Country Id :' + _countryId.toString());
    print('Searching City Id :' + _cityId.toString());
    print('Searching Area Id :' + _areaId.toString());
    print('Searching Service :' + _service.toString());

    await http.post(url, headers: {
      "Accept": "application/json"
    }, body: {
      "county_id": "$_countryId",
      "city_id": "$_cityId",
      "area_id": "$_areaId",
      "service": "$_service"
    }).then((response) {
      Map data = jsonDecode(response.body);
      List daktar = data["response"];
      print('["Doctor Name"]' + daktar[0]["doctor_name"].toString());
      for (var i = 0; i < daktar.length; i++) {
        print('searching Hospital loop>>>>>>>>');

        if (_countryId.toString() == "1" ||
            _cityId.toString() == daktar[i]["city_id"].toString() ||
            _areaId.toString() == daktar[i]["area_id"].toString()) {
          print('match');

          var item = ListTile(
            leading: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    'http://amardaktar24.com/uploads/hospital/' +
                        daktar[i]["pro_img"].toString())),
            //leading: CircleAvatar(child: Text("${daktarCount++}")),
            title: Text(daktar[i]["doctor_name"].toString() +
                "\n" +
                daktar[i]["title_or_designation"].toString()),
            onTap: () => print('click :' + daktar[i]["doctor_name"].toString()),
          );
          list.add(item);
        } else {
          print('not match');
        }
      }
    });
    return Wrap(children: list);
  }
}
