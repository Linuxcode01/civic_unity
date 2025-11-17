import 'package:flutter/material.dart';
import 'package:wastemanagement/Services/User_services.dart';
import 'package:wastemanagement/models/Usermodel.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text("User data"),
        actions: [
          IconButton(
            onPressed: () {
              UserServices().getData();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: UserServices().getData(),
        builder: (context, snapshort) {
          if (snapshort.hasError) {
            return Center(child: Text(" Error fetching user data"));
          }
          if (snapshort.hasData) {
            var data = snapshort.data as List<User>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index].avatar!),
                  ),
                  title: Text("${data[index].name!}}"),
                  subtitle: Text("${data[index].email!}"),
                );
              },
            );
          }else{
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.black,
                strokeAlign: 2.0,
                strokeWidth: 5,

              ),
            );
          }
        },
      ),
    );
  }
}
