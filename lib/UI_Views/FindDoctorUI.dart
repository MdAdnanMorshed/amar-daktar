import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FindDoctorUI extends StatelessWidget {
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
        title: Text("Find Your Doctor"),
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
                future: _speciaList(),
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
                future: _daktarList(),
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

  var _selectedCountryItem,
      _selectedCityItem,
      _selectedAreaItem,
      _selectedSpecialistItem;
  int _countryId, _cityId, _areaId, _specialistId = 0;

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
          _selectedSpecialistItem = null;
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
      print('city :' + data.toString());

      Map data1 = {
        "success": true,
        "response": [
          {"countryId": 1, "id": 1, "name": "Dhaka"},
          {"countryId": 1, "id": 2, "name": "Chandpur"},
          {"countryId": 1, "id": 3, "name": "Noakhali"},
          {"countryId": 2, "id": 4, "name": "Kolkata"},
          {"countryId": 2, "id": 5, "name": "Mumbai"}
        ]
      };

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
          _selectedSpecialistItem = null;
        });
        print("City Id: " + id);
        print("_selectedCityItem Id: " + _selectedCityItem);
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
      print('area' + data.toString());

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
          //_selectedSpecialistItem = null;
        });
        print("Area Id: " + id);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
        border: OutlineInputBorder(),
      ),
    );
  }

  Future<Widget> _speciaList() async {
    final url = "API";
    List<DropdownMenuItem> list = [];

    //await http.get(url).then((response) {
    // Map data = jsonDecode(response.body);
    Map data = {
      "success": true,
      "response": [
        {"areaId": 1, "id": 1, "name": "Medicine"},
        {"areaId": 1, "id": 2, "name": "Cardiology"},
        {"areaId": 1, "id": 3, "name": "Neuro"},
        {"areaId": 2, "id": 4, "name": "Urology"},
        {"areaId": 2, "id": 5, "name": "Orthopedic"},
        {"areaId": 7, "id": 6, "name": "Diabetes"},
        {"areaId": 7, "id": 7, "name": "Skin"}
      ]
    };
    List specialist = data["response"];

    for (var i = 0; i < specialist.length; i++) {
      //if (_areaId.toString() == specialist[i]["areaId"]) {
      var item = DropdownMenuItem(
        child: Text(specialist[i]["name"]),
        value: specialist[i]["id"].toString(),
      );
      list.add(item);
      //}
    }
    //});

    return DropdownButtonFormField(
      hint: Text("Select Your Specialist..."),
      items: list,
      value: _selectedSpecialistItem,
      onChanged: (id) {
        setState(() {
          _selectedSpecialistItem = id;
          _specialistId = int.parse(id);
        });
        print("Specialist Id: " + id);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
        border: OutlineInputBorder(),
      ),
    );
  }

  Future<Widget> _daktarList() async {
    final url = "url";
    List<ListTile> list = [];
    //await http.get(url).then((response) {
    // Map data = jsonDecode(response.body);
    Map data = {
      "success": true,
      "response": [
        {
          "countryId": 1,
          "cityId": 1,
          "areaId": 1,
          "specialistId": 1,
          "id": 1,
          "name": "Prof. Md. Adnan Morsha"
        },
        {
          "countryId": 1,
          "cityId": 1,
          "areaId": 1,
          "specialistId": 1,
          "id": 2,
          "name": "Dr. Shamsul Alam Rocky"
        },
        {
          "countryId": 1,
          "cityId": 1,
          "areaId": 1,
          "specialistId": 1,
          "id": 3,
          "name": "Dr. Sufia Jannat"
        },
        {
          "countryId": 2,
          "cityId": 4,
          "areaId": 7,
          "specialistId": 6,
          "id": 4,
          "name": "Prof. Dr. Md. Sagor Jahan"
        },
        {
          "countryId": 2,
          "cityId": 4,
          "areaId": 7,
          "specialistId": 6,
          "id": 5,
          "name": "Dr. Md. Saifur Rahman Patwary"
        }
      ]
    };
    List daktar = data["response"];

    for (var i = 0, daktarCount = 1; i < daktar.length; i++) {
      if (_countryId == daktar[i]["countryId"] &&
          _cityId == daktar[i]["cityId"] &&
          _areaId == daktar[i]["areaId"] &&
          _specialistId == daktar[i]["specialistId"]) {
        var item = ListTile(
          leading: CircleAvatar(child: Text("${daktarCount++}")),
          title: Text(daktar[i]["name"]),
        );
        list.add(item);
      } else {
        // data not found
      }
      if (notfoundStatus == false) {
        var item = ListTile(
          leading: CircleAvatar(child: Text("0")),
          title: Text('Data Not Found '),
        );
        list.add(item);
      }
    }
    //});

    return Wrap(children: list);
  }
}
