import 'package:amar_daktar/RestApi/PasswordChangeApiParent.dart';
import 'package:amar_daktar/RestApi/UpdateProfileApi.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AppDrawer.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool enable = false;
  bool visible = true;
  String patientId;
  String name;
  String birthday;
  String sex;
  String religion;
  String bloodGroup;
  String address;
  String phone;
  String email;
  String password;
  String parentId;
  String transportId;
  String userPhoto;

  String currentPassword;
  String newPassword;
  String confirmNewPassword;

  //UserAccountData userData;

  @override
  void initState() {
    super.initState();
    getValuesSF();
  }

  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        drawer: AppDrawer(currentRoute: '/dashboard'),
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text('User Profile'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(userPhoto ??
                            'https://image.flaticon.com/icons/png/512/149/149071.png'),
                      ),
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  color: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Name :",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          enabled: enable,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: name,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          onChanged: (text) {
                            name = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  color: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Email :",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          enabled: enable,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: email,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          onChanged: (text) {
                            email = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  color: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Phone :",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          enabled: enable,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: phone,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          onChanged: (text) {
                            phone = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  color: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Birthday :",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          enabled: enable,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: birthday,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          onChanged: (text) {
                            birthday = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  color: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Gender :",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          enabled: enable,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: sex,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          onChanged: (text) {
                            sex = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  color: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Blood Group :",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          enabled: enable,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: bloodGroup,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          onChanged: (text) {
                            bloodGroup = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  color: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Address :",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          enabled: enable,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: address,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          onChanged: (text) {
                            address = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Visibility(
                    visible: visible,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (enable == false) {
                              enable = true;
                            } else {
                              enable = false;
                            }
                            if (visible == true) {
                              visible = false;
                            } else {
                              visible = true;
                            }
                          });
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          shadowColor: Colors.greenAccent,
                          color: Colors.lightBlue,
                          elevation: 7,
                          child: Center(
                              child: Image.asset(
                            'images/pencil-edit-button.png',
                            color: Colors.white,
                            width: 20,
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Visibility(
                    visible: !visible,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      width: 100,
                      height: 40,
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            if (enable == false) {
                              enable = true;
                            } else {
                              enable = false;
                            }
                            if (visible == true) {
                              visible = false;
                            } else {
                              visible = true;
                            }

                            UpdateProfileApi()
                                .updateData()
                                .whenComplete(showToastForUser);
                            //getData(studentId);
                          });
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          shadowColor: Colors.greenAccent,
                          color: Colors.lightBlue,
                          elevation: 7,
                          child: Center(
                              child: Text(
                            'Save',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Current Password :',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          controller: textController1,
                          onChanged: (text) {
                            currentPassword = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'New Password :',
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          controller: textController2,
                          onChanged: (text) {
                            newPassword = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Confirm Password :',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          controller: textController3,
                          onChanged: (text) {
                            confirmNewPassword = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                RaisedButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0)),
                  onPressed: () async {
                    /*
                    PasswordChangeApiParent(studentId, currentPassword,
                            newPassword, confirmNewPassword)
                        .changePassword()
                        .whenComplete(showToastForPassword);
                    */
                  },
                  textColor: Colors.white,
                  color: Colors.lightBlue,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Change Password',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      parentId = prefs.getString('userId');
      name = prefs.getString('userName');
      email = prefs.getString('userEmail');
      phone = prefs.getString('userPhone');

      //prefs.getString('userRoleId');
      //prefs.getString('userMailverfiy');
      //prefs.getString('userIamge');
      //token=prefs.getString('userToken');
    });

    print('userId:$parentId');
    print('userName:$name');
    print('userEmail:$email');
    print('userPhone:$phone');
    // getData(studentId);
  }

  Future<bool> _onBackPressed() {
    Navigator.popAndPushNamed(context, '/dashboard');
    return null;
  }

  showToastForPassword() async {
    setState(() {
      textController1.clear();
      textController2.clear();
      textController3.clear();
    });

    if (PasswordChangeApiParent.status == true) {
      Fluttertoast.showToast(
        msg: "Updated Password",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        gravity: ToastGravity.CENTER,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Coudn't Update Password",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  showToastForUser() async {
    if (UpdateProfileApi.status == true) {
      Fluttertoast.showToast(
        msg: "Updated Info",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        gravity: ToastGravity.CENTER,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Coudn't Update Info",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.CENTER,
      );
    }
  }

/*
  getData(String id) async {
    await UserAccountApi(id)
        .fetchData()
        .then((_) => {this.userData = UserAccountApi.userData})
        .then((_) => {
              setState(() {
                this.name = userData.name;
                this.birthday = userData.birthday;
                this.sex = userData.sex;
                this.religion = userData.religion;
                this.bloodGroup = userData.bloodGroup;
                this.address = userData.address;
                this.phone = userData.phone;
                this.email = userData.email;
                this.userPhoto = userData.photo;
              })
            });
  }

 */
}
