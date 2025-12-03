import 'dart:convert';
import 'package:http/http.dart' as http;


class DriverService {
  final base = 'https://your-backend.com/api';


  Future<List> getPendingRequests() async {
    final res = await http.get(Uri.parse('$base/requests/pending/'));
    return jsonDecode(res.body);
  }


  Future<String> acceptRequest(String id) async {
    final res = await http.post(Uri.parse('$base/requests/$id/accept/'));
    return jsonDecode(res.body)['status'];
  }


  Future<void> updateLocation(double lat, double lng) async {
// Firebase or backend endpoint — your choice
    await http.post(Uri.parse('$base/driver/updateLocation/'),
        body: {'lat': '$lat', 'lng': '$lng'});
  }
}