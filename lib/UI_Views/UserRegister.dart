import 'dart:async';
import 'package:amar_daktar/Models/CityLocationList.dart';
import 'package:amar_daktar/RestApi/CityListApi.dart';
import 'package:amar_daktar/RestApi/UserRegisterApi.dart';
import 'package:amar_daktar/UI_Views/UserLogin.dart';
import 'package:amar_daktar/URL/Link.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class UserRegister extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<UserRegister> {
  var _formKey = GlobalKey<FormState>();

  String nameName = '',
      email = '',
      phone = '',
      password = '',
      cityId,
      selectedCountry,
      gender;
  String role_id = "3";
  String pro_img;
  String _mySelection;
  bool status = false;
  List<CityList> getCity = [];
  CityList cityList;

  var selectedCity, selectedGender, imageURI, image;
  String item;

  var _selectedCityItem, _cityId;

  // city done
  Future<Widget> _cityList() async {
    final url = "http://amardaktar24.com/public/api/get/all/districts";
    List<DropdownMenuItem> list = [];
    await http.get(url).then((response) {
      Map data = jsonDecode(response.body);
      List city = data["response"];

      for (var i = 0; i < city.length; i++) {
        var item = DropdownMenuItem(
          child: Text(city[i]["name"]),
          value: city[i]["id"].toString(),
        );
        list.add(item);
      }
    });

    return DropdownButtonFormField(
      hint: Text("Select Your City..."),
      items: list,
      value: _selectedCityItem,
      onChanged: (id) {
        setState(() {
          _selectedCityItem = id;
          _cityId = id;
        });
       // print("City Id: " + _cityId);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Registration"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // Full Name
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Full Name",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Enter Your Name",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          nameName = value;
                          print('NameTF:' + nameName);
                        },
//                        validator: (value) {
//                          if (value.isEmpty) return ("This is Required");
//                          return null;
//                        },
                      ),
                      SizedBox(height: 15),
                      // Email
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Enter Your Email",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          email = value;
                          print('emailTF:' + email);
                        },
                        validator: (value) {
                          if (value.isEmpty) return ("This is Required");
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      // Phone Number
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Phone Number",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Enter Your Phone Number",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) {
                          setState(() {
                            phone = value;
                            print('PhoneTF:' + phone);
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty)
                            return ("This is Required");
                          else if (value.length == 11)
                            return ("Length should be 11");
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      // Password
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onSaved: (loginPass) {
                          password = loginPass;
                          print('passwordTF:' + password);
                        },
                        validator: (value) {
                          if (value.isEmpty)
                            return ("This is Required");
                          else if (value.length > 6)
                            return ("password should be min 6 Digit");
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      // Country
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Location :",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 15),
                      // City
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Form(
                          child: Column(
                            children: [
                              FutureBuilder<Widget>(
                                  future: _cityList(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return snapshot.data;
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  }),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                      //---------------------------
                      SizedBox(height: 15),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                          border: OutlineInputBorder(),
                        ),
                        hint: Text("Please Select Gender"),
                        items: [
                          DropdownMenuItem(
                            child: Text("Male"),
                            value: "male",
                          ),
                          DropdownMenuItem(
                            child: Text("Female"),
                            value: "Female",
                          ),
                        ],
                        // value: "Doctor",
                        value: selectedGender,
                        onChanged: (gender) {
                          setState(() {
                            selectedGender = gender;
                          });
                          print('gender :' + selectedGender);
                        },
                        validator: (gender) {
                          if (gender.isEmpty) return ("This is Required");
                          return null;
                        },
                        onSaved: (value) => print(gender),
                      ),
                      SizedBox(height: 15),
                      // Image
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RaisedButton(
                          child: AlertDialog(
                            title: Text("Select image source",
                                style: TextStyle(fontSize: 10)),
                            actions: <Widget>[
                              MaterialButton(
                                child: Text("Camera"),
                                onPressed: () => getImage(context, "camera"),
                              ),
                              MaterialButton(
                                child: Text("Gallery"),
                                onPressed: () => getImage(context, "gallery"),
                              )
                            ],
                          ),
                          //onPressed: () => getImage(context, "gallery"),
                        ),
                      ),
                      SizedBox(height: 15),
                      // SignUp Button
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.red,
                          child: Text(
                            "Sign Me Up",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          onPressed: () {
                            print("Register is Click Button");

                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              print("nameName : " + nameName.toString());
                              print('Mail Address :' + email.toString());
                              print('password' + password.toString());
                              print('Role Id :' + role_id.toString());
                              print("phone :" + phone.toString());
                              print("selectCity :" + _cityId.toString());
                              print('select Gender: ' +
                                  selectedGender.toString());
                              _register(nameName, email, password, role_id,
                                  cityId, 'testing.jpg', selectedGender, phone);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImage(BuildContext context, String imgSource) async {
    if (imgSource == "camera") {
      getImageFromCamera();
    } else if (imgSource == "gallery") {
      getImageFromGallery();
    }
  }

  // Camera
  Future getImageFromCamera() async {
    image = (await ImagePicker.pickImage(source: ImageSource.camera));
    _showImage(image, context);
    setState(() {
      imageURI = image;
    });
  }

  //Gallery
  Future getImageFromGallery() async {
    image = (await ImagePicker.pickImage(source: ImageSource.gallery));
    _showImage(image, context);
    setState(() {
      imageURI = image;
      print(imageURI);
    });
  }

  _showImage(var image, BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            margin: EdgeInsets.all(20),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title:
                    Text("Preview...", style: TextStyle(color: Colors.black)),
                actions: <Widget>[
                  // OK Button
                  IconButton(
                    icon:
                        Icon(Icons.check_circle, color: Colors.green, size: 30),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  // Cancle Button
                  IconButton(
                    icon: Icon(Icons.cancel, color: Colors.red, size: 30),
                    onPressed: () {
                      // setState(() {
                      //   _image = null;
                      //   imageName = null;
                      // });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                  child: Container(child: Image.file(image))),
            ),
          );
        });
  }

  _register(String nameName, String email, String password, String roleId,
      String cityId, var imageURI, String gender, String phone) {
    print('register starting ....');
    print('name:' + nameName);
    print('mail:' + email);
    print('password:' + password);
    print('phone:' + phone);
    print('gender:' + gender);
    UserRegisterApi(nameName, email, password, '4', cityId, 'testing.jpg',
            gender, phone)
        .fetchData()
        .whenComplete(Register);
    print("<<----------- register End ------------------->>>>");
  }

  FutureOr Register() {
    print('Register is done ');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserLogin()),
    );
  }
}
