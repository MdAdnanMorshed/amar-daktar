import 'package:amar_daktar/widgets/custom_shape.dart';
import 'package:amar_daktar/widgets/customappbar.dart';
import 'package:amar_daktar/widgets/responsive_ui.dart';
import 'package:amar_daktar/widgets/textformfield.dart';
import 'package:flutter/material.dart';

import 'UserLogin.dart';
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

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  BuildContext context;
  String name = '',
      email = '',
      phone = '',
      password = '',
      cityId = '1',
      selectedCountry,
      gender = 'male';
  String role_id = "3";
  String pro_img = 'testing.png';
  String _mySelection;
  bool status = false;
  List<CityList> getCity = [];
  CityList cityList;

  var selectedCity, selectedGender, imageURI, image;
  String item;

  var _selectedCityItem, _cityId;

  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  //Register Successful  Snackber Showen
  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88, child: CustomAppBar()),
                clipShape(),
                form(),
                acceptTermsTextRow(),
                SizedBox(
                  height: _height / 35,
                ),
                button(),
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: () {
                print('Adding photo');
              },
              child: Icon(
                Icons.add_a_photo,
                size: _large ? 40 : (_medium ? 33 : 31),
                color: Colors.orange[200],
              )),
        ),
//        Positioned(
//          top: _height/8,
//          left: _width/1.75,
//          child: Container(
//            alignment: Alignment.center,
//            height: _height/23,
//            padding: EdgeInsets.all(5),
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color:  Colors.orange[100],
//            ),
//            child: GestureDetector(
//                onTap: (){
//                  print('Adding photo');
//                },
//                child: Icon(Icons.add_a_photo, size: _large? 22: (_medium? 15: 13),)),
//          ),
//        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            //genderTextFormField(),
            SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
            SizedBox(height: _height / 60.0),
            //  cityPlaceListView(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: nameController,
      icon: Icons.person,
      hint: "First Name",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      icon: Icons.email,
      hint: "Email ID",
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      textEditingController: phoneController,
      icon: Icons.phone,
      hint: "Mobile Number",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: passwordController,
      obscureText: true,
      icon: Icons.lock,
      hint: "Password",
    );
  }

  Widget cityPlaceListView() {
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
    );
    //---------------------------
    SizedBox(height: 15);
  }

  Widget genderTextFormField() {
    DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
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
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.orange[200],
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
//        if (_formKey.currentState.validate()) {
//          _formKey.currentState.save();
        name = nameController.text.toString();
        email = emailController.text.toString();
        password = passwordController.text.toString();
        phone = phoneController.text.toString();
        _register(context, name, email, password, role_id, cityId,
            'testing.jpg', selectedGender, phone);
        showInSnackBar("Register is Successfull!");
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'SIGN UP',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserLogin()),
              );
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}

/*

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
                          //print('NameTF:' + nameName);
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
                          // print('emailTF:' + email);
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
*/

_register(BuildContext context, String nameName, String email, String password,
    String roleId, String cityId, var imageURI, String gender, String phone) {
  print('register starting ....');
  print('name:' + nameName);
  print('mail:' + email);
  print('password:' + password);
  print('phone:' + phone);
  //print('gender:' + gender);
  UserRegisterApi(
          nameName, email, password, '4', '1', 'testing.jpg', 'male', phone)
      .fetchData()
      .whenComplete(Register(context));

  print("<<----------- register End ------------------->>>>");
}

FutureOr Register(BuildContext context) {
  print('Register is done ');

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Register is Successfull"),
          content: Text("Dialog Content"),
        );
      });
//  Navigator.push(
//    context,
//    MaterialPageRoute(builder: (context) => UserLogin()),
//  );
}
