
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wastemanagement/Screens/OtpPage.dart';
import 'package:wastemanagement/Screens/login.dart';
import 'package:http/http.dart' as http;
class register extends StatefulWidget{
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController currentPass = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    pass.dispose();
    currentPass.dispose();
    super.dispose();
  }

  Future<bool> sendData(String name, String email, String pass, String currPass) async {
    final url = Uri.parse("https://10.0.2.2:8000/api/register");

    final body = jsonEncode({
      "name": name,
      "email": email,
      "pass": pass,
      "currPass": currPass
    });

    final headers = {
      "Content-Type": "application/json",
    };

    final response = await http.post(url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print("Server Error: ${response.body}");
      return false;
    }
  }

  void RegisterUser() async{
    final success = await sendData(name.text, email.text, pass.text, currentPass.text);
    if(success){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" Register successfully")));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" Register Failed")));
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(

     child: Scaffold(
       body: SingleChildScrollView(
         child: Container(
           padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3,left: 10, right: 10 ),
           child: Column(
             children: [
               Text(
                 "Register ",
                 style: TextStyle(
                   fontWeight:FontWeight.bold,
                   fontSize: 24,
                 ),
               ),
         
                      Container(
                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01,left: 20,right: 20),
                     child: Column(
                       children: [
                         TextField(
                           controller:name,
                           decoration: InputDecoration(
                             hintText: "Enter Name",
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide: BorderSide( width: 1, style: BorderStyle.solid)
                             )
                           ),
                         ),
                         SizedBox(height: 10,),
                         TextField(controller: email,
                           decoration: InputDecoration(
                               hintText: "Enter Email",
                               border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide( width: 1, style: BorderStyle.solid)
                               )
                           ),
                         ),
                         SizedBox(height: 10,),
                         TextField(
                           controller: pass,
                           obscureText: true,
                           obscuringCharacter: "*",
                           decoration: InputDecoration(
                               hintText: "Enter Password",
                  
                               border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide( width: 1, style: BorderStyle.solid)
                               )
                           ),
                         ),
                         SizedBox(height: 10,),
                         TextField(controller: currentPass,
                           obscureText: true,
                           obscuringCharacter: "*",
                           decoration: InputDecoration(
                               hintText: "Confirm Password",
                               border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide( width: 1, style: BorderStyle.solid)
                               )
                           ),
                         ),
                         SizedBox(height: 15,),
                         ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.green,
                           fixedSize: Size(180, 70)
                         ), child: Text("Submit", style: TextStyle(
                           color: Colors.white,
                           fontSize: 28,
                         ),)),
                  
                         Padding(
                           padding:  EdgeInsets.only(left: 90,top:100),
                           child: Row(
                             children: [
                               Text("Already have an account."),
                               GestureDetector(
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpPage(email: email.text)));
                                 },
                                 child: Text("login", style: TextStyle(
                                   color: Colors.blue,
                                   fontSize: 20
                                 ),),
                               )
                             ],
                           ),
                         )
                       ],
                     ),
                   ),
             ],
           ),
         ),
       ),
     ),
   );
  }

}

