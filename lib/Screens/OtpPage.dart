import 'package:flutter/material.dart';
import 'package:wastemanagement/Screens/Home.dart';
class OtpPage extends StatelessWidget{
  String email;
  OtpPage({required this.email});

  TextEditingController text1 = TextEditingController();

  TextEditingController text2 = TextEditingController();

  TextEditingController text3 = TextEditingController();

  TextEditingController text4 = TextEditingController();

  TextEditingController text5 = TextEditingController();

  TextEditingController text6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25, left: 30,right: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Enter the OTP sent to", style: TextStyle(fontSize: 24),),
                        Text("${email}", style: TextStyle(fontSize: 24),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          height: 52,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: TextField(
                              controller: text1,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  )
                              )

                          ),
                        ),
                        SizedBox( width: 5,),
                        Container(
                          height: 52,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: TextField(
                            controller: text2,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                              )
                            )

                          ),
                        ),
                        SizedBox( width: 5,),

                        Container(
                          height: 52,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: TextField(
                              controller: text3,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  )
                              )

                          ),
                        ),
                        SizedBox( width: 5,),
                        Container(
                          height: 52,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: TextField(
                              controller: text4,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  )
                              )

                          ),
                        ),
                        SizedBox( width: 5,),
                        Container(
                          height: 52,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: TextField(
                              controller: text5,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  )
                              )

                          ),
                        ),
                        SizedBox( width: 5,),
                        Container(
                          height: 52,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: TextField(
                              controller: text6,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  )
                              )

                          ),
                        )

                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Container(
                  // width: MediaQuery.of(context).size.width * 0.7,
                  width: double.infinity,
                  height: 55,
                  color: Colors.green,
                  child: Center(
                    child: Text("Submit", style: TextStyle(
                      fontSize: 24,
                      color: Colors.white
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 9,),
              Row(
                children: [
                  Text("Didn't get OTP?",style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),),
                  Text(" Resend in 120 seconds",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 18
                  ),)
                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}