import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static SharedPreferences? prefs;


  Future<void> saveUserData(Map<String, dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();

    // पूरा response ही stored कर दे, तो future में आसानी रहेगी
    await prefs.setString("user_data", jsonEncode(response));
  }


}