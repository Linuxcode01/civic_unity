import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Profile Details'))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 80.0,
              ),
              child: Form(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        offset: const Offset(
                          0,
                          3,
                        ), // changes position of shadow
                      ),
                    ],
                  ),

                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle profile picture change
                        },
                        child: CircleAvatar(

                          backgroundColor: Colors.green,
                          radius: 50,
                          backgroundImage: AssetImage(
                            'assets/profile_placeholder.png',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Gender'),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          labelText: 'Date of Birth',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            color: Colors.green,
                            child: Center(child: const Text('Save',style: TextStyle(color: Colors.white, fontSize: 20),)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                // Handle account deletion
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top
                      : 40.0),
                  child: Center(
                    child: Text(
                      "Delete Account",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
