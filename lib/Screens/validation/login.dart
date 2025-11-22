import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wastemanagement/Screens/Homes/Home.dart';
import 'package:wastemanagement/Screens/validation/register.dart';
import 'package:wastemanagement/Services/User_services.dart';
import '../Homes/HomePageContent.dart';
import 'forgot.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    signUp() async {
      try {
        if (_email.text.isEmpty || _pass.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("All fields are required")),
          );
          return;
        }
        var res =
            await UserServices().getData(_email.text.trim(), _pass.text.trim());

        var rawdata = res.body;
        var datas = jsonDecode(rawdata);
        print(datas);

        if (datas['success'] == true) {

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePageContent(
                    apiData: res,
                  )));

          print("data : $datas");
          return datas;
        } else if(res.statusCode == 400) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error : ${res.statusCode}")));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid Credentials")));

        }

        // if (res['success'] == true) {
        //   Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) => HomePageContent(
        //                 apiData: res,
        //               )));
        // } else {
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
        // }
      } catch (e) {
        throw Exception(e.toString());
      }
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.3),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: width * 0.05,
                top: height * 0.15,
                child: SizedBox(
                  width: width * 0.9,
                  child: Text(
                    "Welcome to Waste Management",
                    style: TextStyle(
                      fontSize: width * 0.07,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              /// Scrollable form
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.32,
                    left: width * 0.08,
                    right: width * 0.08,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      TextField(
                        controller: _pass,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.4,
                            height: height * 0.07,
                            child: ElevatedButton(
                              onPressed: (){
                                signUp();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: width * 0.06,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Forgot()));
                            },
                            child: Text(
                              "forgot password?",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: width * 0.045,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("By continuing, you accept the "),
                              Text(
                                "Terms of Services,",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Privacy Policy ",
                                style: TextStyle(color: Colors.green),
                              ),
                              Text("and "),
                              Text(
                                "Content Policy.",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => register(),
                                ),
                              );
                            },
                            child: Text(
                              "Create account",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: width * 0.05,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.04),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
