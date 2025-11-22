import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Usermodel.dart';

class UserServices {
  String baseUrl = "https://waste-managment-y3tn.onrender.com/";

  getData(String email, String pass) async {
    // List<User> user = [];
    try {
      var res = await http.post(
          Uri.parse(
              'https://waste-managment-y3tn.onrender.com/api/v1/user/login'),
          body: jsonEncode({'email': email, 'password': pass}),
          headers: {"Content-Type": "application/json"});


      if (res.statusCode == 200) {
        var rawdata = res.body;
        var datas = jsonDecode(rawdata);
        print("data : $datas");
        return datas;
      } else {
        throw Exception("Error occurred with status code ${res.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  createUser(User user) async {
    try {
      var res = await http.post(Uri.parse('${baseUrl}api/v1/user/signup'),
          body: jsonEncode(user.toJson()),
          headers: {"Content-Type": "application/json"});

      var rawdata = res.body;
      var data = jsonDecode(rawdata);

      if (data.statusCode == 200 || res.statusCode == 201) {
        print("User created successfully");
        return data;
      } else {
        throw Exception(
            "Registration Failed: ${data['message']}");
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }



  verifyOtp(String email, String otp) {
    // Dummy implementation for OTP verification
    try {
      if (otp == "123456") {
        return {
          'status': 'success',
          'data': {
            'id': 1,
            'name': 'John Doe',
            'email': email,
            'phone': '123-456-7890',
            'photo': 'https://example.com/photo.jpg'
          }
        };
      } else {
        return {'status': 'failure'};
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // putUser() {}
  //
  // deleteUser() {}
}
