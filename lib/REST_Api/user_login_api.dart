class UserLoginApi {
  String uEmail = "";
  String uPassword = "";

  UserLoginApi(this.uEmail, this.uPassword);

  /*
  Future fetchData() async {
    try {
      final data = await http.post(Links.loginApiUrl,
          headers: {"Accept": "aplication/json"},
          body: {'email': uEmail, 'password': uPassword});
      final jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        userType = jsonData['user_info'][0]['user_type'];
        LoginApiData.fromJson(jsonData['user_info'][0]);
        status = jsonData['success'];
        print(userType);
        return jsonData;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

   */
}
