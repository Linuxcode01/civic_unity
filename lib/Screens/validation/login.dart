import 'package:flutter/material.dart';
import 'package:wastemanagement/Screens/validation/register.dart';

import 'package:wastemanagement/Screens/validation/forgot.dart';
import 'package:wastemanagement/Screens/validation/OtpPage.dart';

class login extends StatelessWidget{
 TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/login.jpeg"), fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16,top: 200),
              child: Text("Welcome to Waste Management",
                  style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4, right: 36, left: 36),
                child: Column(
                  children: [
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(strokeAlign: 2),
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(strokeAlign: 2),
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage(email: email.text)));
                          }, style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            fixedSize: Size(150, 60)
                          ),child: Text("Sign In", style: TextStyle(
                              fontSize :30,
                              color: Colors.white
                          ),),)
                        ),
                        SizedBox(width: 80,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => forgot()),);
                          },
                          child: Text("forgot password?", style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red
                          ),

                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("By continuing, You are accept the ", style: TextStyle(
                              fontSize: 15,
                            ),),
                            Text("Therms of Services,",style: TextStyle(
                              fontSize: 15,
                              color: Colors.green
                            ),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Privacy Policy ",style: TextStyle(
                              fontSize: 15, color: Colors.green
                            ),),
                            Text("and ",style: TextStyle(
                              fontSize: 15,
                            ),),
                            Text("Content Policy.",style: TextStyle(
                              fontSize: 15,
                                color: Colors.green
                            ),)

                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: EdgeInsets.only(top: 50,left: 60),
                      child: Row(
                        children: [
                          Text("Don't have any account? "),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => register()),);
                            } ,
                            child: Text("create account", style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue
                            ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}