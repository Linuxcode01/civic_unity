import 'dart:convert';
import 'package:flutter/material.dart';
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

      return res;
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
      return data;
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  forgetPassword(String email, BuildContext context) async {
    try {
      var res = await http.post(
          Uri.parse('${baseUrl}api/v1/user/forgot-password'),
          body: jsonEncode({'email': email}),
          headers: {"Content-Type": "application/json"});

      var rawdata = res.body;
      var data = jsonDecode(rawdata);

      if (res.statusCode == 200) {
        return data;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(" User not found")));
        return;
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  verifyOtp(String email, String otp, BuildContext context) async {
    // Dummy implementation for OTP verification
    var res = await http.post(
        Uri.parse('${baseUrl}api/v1/user/verify-otp/:$email'),
        body: jsonEncode({'otp': otp}),
        headers: {"Content-Type": "application/json"});

    var rawData = res.body;
    var data = jsonDecode(rawData);
    if (res.statusCode == 200) {
      return data;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid OTP")));
    }
  }

  // putUser() {}
  //
  // deleteUser() {}
}
