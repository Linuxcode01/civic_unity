import 'package:flutter/material.dart';
import 'package:wastemanagement/Screens/login.dart';
import 'package:wastemanagement/Screens/Home.dart';
import 'package:wastemanagement/Screens/user.dart';
import 'package:wastemanagement/Splash/SplashScreen.dart';
import 'package:wastemanagement/Screens/profileScreen.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Waste Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF00A884)),
            useMaterial3: false,
            fontFamily: "Regular"
        ),

        home: Profile(),
    );
  }
}

