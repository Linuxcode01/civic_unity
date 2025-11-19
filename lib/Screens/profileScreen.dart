import 'package:flutter/material.dart';
import 'package:wastemanagement/Screens/Account%20Setting/language.dart';
import 'package:wastemanagement/Screens/Account%20Setting/profileDetails.dart';
import 'package:wastemanagement/Screens/Help&Support/help_and_support.dart';
import 'package:wastemanagement/utils/CustomContainer.dart';
import 'package:provider/provider.dart';
import 'Account Setting/language_provider.dart';
import 'package:wastemanagement/Screens/Account Setting/notification.dart';
import 'package:wastemanagement/Screens/Help%26Support/feedback.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileDetails(),
                              ),
                            );
                          },
                          child: customContainer.longContainer(
                            icon: Icon(Icons.person_2_outlined),
                            text: "Profile details",
                          ),
                        ),


                        GestureDetector(
                          onTap: () {
                            // Navigate to Language Screen
                            language(
                              context: context,
                              onLanguageSelected: (lang) {
                                final provider = Provider.of<LanguageProvider>(context, listen: false);

                                if (lang == "English") provider.setLocale('en');
                                if (lang == "Hindi") provider.setLocale('hi');
                              },
                            );
                          },
                          child: customContainer.longContainer(
                            icon: Icon(Icons.language_outlined),
                            text: "Language",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to Notification Settings Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => notification(),
                              ),
                            );
                          },
                          child: customContainer.longContainer(
                            icon: Icon(Icons.notifications_none_outlined),
                            text: "Notifications",
                          ),
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
                        GestureDetector(
                          onTap: () {
                            // Navigate to Feedback Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => feedback(),
                              ),
                            );
                          },
                          child: customContainer.longContainer(
                            icon: Icon(Icons.feedback_outlined),
                            text: "Give us Feedback",
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            // Navigate to FAQ Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => helpAndSupport(),
                              ),
                            );
                          },
                          child: customContainer.longContainer(
                            icon: Icon(Icons.help_outline),
                            text: "Help & Support",
                          ),
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

                       GestureDetector(
                         onTap: () {
                           // Navigate to Privacy Policy Screen
                         },
                         child:  customContainer.longContainer(
                           icon: Icon(Icons.policy_outlined),
                           text: "Privacy Policy",
                         ),
                       ),

                        GestureDetector(
                          onTap: () {
                            // Navigate to Terms & Conditions Screen
                          },
                          child: customContainer.longContainer(
                            icon: Icon(Icons.article_outlined),
                            text: "Terms & Conditions",
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            // Navigate to Content Policy Screen
                          },
                           child:  customContainer.longContainer(
                              icon: Icon(Icons.content_copy),
                              text: "Content policy",
                            )
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle Logout
                          },
                          child: customContainer.longContainer(
                            icon: Icon(Icons.logout, color: Colors.red),
                            text: "Logout",
                            color: Colors.red,
                          ),
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
