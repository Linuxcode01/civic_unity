import 'package:flutter/material.dart';
class HomePageContent extends StatelessWidget {
  final Map<String, dynamic> apiData;

  HomePageContent({super.key, required this.apiData});

  @override
  Widget build(BuildContext context) {
    var name = apiData['user']['name'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),

      ),
      body: Center(
        child: Text("Welcome $name", style: TextStyle(fontSize: 22)),
      ),

    );
  }
}
