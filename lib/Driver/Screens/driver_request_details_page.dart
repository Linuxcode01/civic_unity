import 'package:flutter/material.dart';
import 'driver_service.dart';

class DriverRequestDetailsPage extends StatelessWidget {
  // Map<String, dynamic> req;

  //  postid, images, location, userid
  DriverRequestDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final req =
    // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final service = DriverService();

    return Scaffold(
      appBar: AppBar(title: const Text('Request Details')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // 'Request ID: ${req['id']}',
              "Id",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            // Text('Location: ${req['lat']}, ${req['lng']}'),
            Text("Location"),
            const SizedBox(height: 10),
            Image.network(
              "https://images.unsplash.com/photo-1763793927948-7faaa6adb479?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              height: 180,
              fit: BoxFit.cover,
            ),
            // Image(image: AssetImage("assets/images/logo.jpg")),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                // final res = await service.acceptRequest(req['id'].toString());
                // if (context.mounted) {
                //   ScaffoldMessenger.of(
                //     context,
                //   ).showSnackBar(SnackBar(content: Text('Status: $res')));
                // }
              },
              child: const Text('Accept Request'),
            ),
          ],
        ),
      ),
    );
  }
}
