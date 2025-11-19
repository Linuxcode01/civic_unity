import 'package:flutter/material.dart';

import 'package:wastemanagement/Screens/validation/OtpPage.dart';


class forgot extends StatelessWidget{
  const forgot({super.key});



  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    // TODO: implement build
    return Container(
      
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 200,left: 20, right: 20),
          child: Column(
            children:[
              Text("Reset forgot password", style: TextStyle(
                fontSize: 24,
              fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              TextField(

                decoration: InputDecoration(
                  hintText: "Enter your Email",
                   fillColor: Colors.grey.shade100,
                  filled: true, 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage(email:email.text,)),);
                },
                child: SizedBox(
                  width: 150,
                  height: 60,
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage(email: email.text)));
                  },
                    style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                
                  ),
                    child: Text("Send OTP", style: TextStyle(color: Colors.white, fontSize: 20),),),
                ),
              )
            ]
          ),
        )
      ),
    );
  }
}