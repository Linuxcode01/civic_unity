import 'package:flutter/material.dart';
class feedback extends StatelessWidget {
  const feedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Feedback"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Center(
            child: Form(child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("We value your feedback! Please share your thoughts below:", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Your Feedback",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    // Handle feedback submission
                  },
                  child: Text("Submit"),
                ),
              ],
            ))
          ),
        ),
      ),
    );
  }
}
