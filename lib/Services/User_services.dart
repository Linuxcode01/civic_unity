import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Usermodel.dart';

class UserServices{
  String baseUrl= "https://reqres.in/";

  getData() async{
    List<User> allUsers = [];
    try{
      var response = await http.get(Uri.parse("${baseUrl}user?page=2"));
      if(response.statusCode == 200){
        var rawData = response.body;
        var decodeData = jsonDecode(rawData);
        var users = decodeData["data"];

        for(var user in users){
          User newUser = User.fromJson(user);
          allUsers.add(newUser);
        }

        print(allUsers);
        return allUsers;
      }

    }catch (e){
      throw Exception(e);
    }
  }

  createUser() async{
    var response = await http.post(Uri.parse(baseUrl));


  }

  putUser(){

  }

  deleteUser(){

  }
}