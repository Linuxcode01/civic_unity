import 'package:flutter/material.dart';
class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Settings"),
      ),
      body: Column(
        children:[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notification Preferences',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                SwitchListTile(
                  title: Text('Push Notifications'),
                  value: true,
                  onChanged: (bool value) {

                  },
                ),
                SwitchListTile(
                  title: Text('Email Notifications'),
                  value: false,
                  onChanged: (bool value) {},
                ),
                SwitchListTile(
                  title: Text('SMS Notifications'),
                  value: true,
                  onChanged: (bool value) {},
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}
