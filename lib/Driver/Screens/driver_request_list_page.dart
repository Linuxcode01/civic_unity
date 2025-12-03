import 'package:flutter/material.dart';
import 'driver_request_details_page.dart';
import 'driver_service.dart';

class DriverRequestListPage extends StatefulWidget {
  const DriverRequestListPage({super.key});

  @override
  State<DriverRequestListPage> createState() => _DriverRequestListPageState();
}

class _DriverRequestListPageState extends State<DriverRequestListPage> {
  final service = DriverService();
  List<dynamic> requests = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    final data = await service.getPendingRequests();
    setState(() {
      requests = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Incoming Requests')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: requests.length,
              itemBuilder: (_, i) {
                final r = requests[i];
                return Card(
                  child: ListTile(
                    title: Text('Request ID: ${r['id']}'),
                    subtitle: Text('Location: ${r['lat']}, ${r['lng']}'),
                    trailing: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverRequestDetailsPage(),
                        ),
                      ),
                      child: const Text('View'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
