import 'package:flutter/material.dart';
import 'package:wastemanagement/utils/CustomContainer.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                child: Image(image: AssetImage("assets/images/logo.jpg")),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    "Karan Ghorse",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 20,
                    right: 15,
                    bottom: 20,
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            customContainer.container(
                              text: "Pickup requested",
                              icon: Icon(Icons.request_page_outlined),
                            ),
                            SizedBox(width: 15),
                            customContainer.container(
                              icon: Icon(Icons.paypal_rounded),
                              text: "Refer and Earn",
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            customContainer.container(
                              icon: Icon(Icons.wallet),
                              text: "Payment methods",
                            ),
                            SizedBox(width: 15),

                            customContainer.container(
                              icon: Icon(Icons.location_on_outlined),
                              text: "Address",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          "ACCOUNT SETTINGS ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/profileDetails');
                          },
                          child: customContainer.longContainer(
                            icon: Icon(Icons.person_2_outlined),
                            text: "Profile details",
                          ),
                        ),


                        customContainer.longContainer(
                          icon: Icon(Icons.language_outlined),
                          text: "Language",
                        ),
                        customContainer.longContainer(
                          icon: Icon(Icons.notifications_none_outlined),
                          text: "Notifications",
                        ),
                        SizedBox(height: 30),
                        Text(
                          "HELP & SUPPORT ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        customContainer.longContainer(
                          icon: Icon(Icons.feedback_outlined),
                          text: "Give us Feedback",
                        ),

                        customContainer.longContainer(
                          icon: Icon(Icons.help_outline),
                          text: "Help & Support",
                        ),

                        SizedBox(height: 30),
                        Text(
                          "MORE ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),

                        customContainer.longContainer(
                          icon: Icon(Icons.policy_outlined),
                          text: "Privacy Policy",
                        ),

                        customContainer.longContainer(
                          icon: Icon(Icons.article_outlined),
                          text: "Terms & Conditions",
                        ),

                        customContainer.longContainer(
                          icon: Icon(Icons.content_copy),
                          text: "Content policy",
                        ),
                        customContainer.longContainer(
                          icon: Icon(Icons.logout, color: Colors.red),
                          text: "Logout",
                          color: Colors.red,
                        ),
                      ],
                    ),
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
