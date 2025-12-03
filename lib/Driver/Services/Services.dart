import 'dart:convert';

import 'package:http/http.dart' as http;

class Services {
  final base = 'https://waste-managment-y3tn.onrender.com/api/v1/driver';

   Future<dynamic> getPendingRequests() async{
    var res = await http.post(Uri.parse('$base/requests/pending/'));

    var rawData = res.body;
    var data = jsonDecode(rawData);

    if(res.statusCode == 200){
      return data;

    }
    else{
      throw Exception(data['message']);
    }

  }


    Future<dynamic> acceptRequest(String id) async{
      var res = await http.post(Uri.parse('$base/requests/$id/accept/'));

      var rawData = res.body;
      var data = jsonDecode(rawData);

      if(res.statusCode == 200){
        return data;

      }
      else{
        throw Exception(data['message']);
      }

    }
}