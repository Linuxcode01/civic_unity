import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'driver_service.dart';


class DriverLiveLocationPage extends StatefulWidget {
  const DriverLiveLocationPage({super.key});


  @override
  State<DriverLiveLocationPage> createState() => _DriverLiveLocationPageState();
}


class _DriverLiveLocationPageState extends State<DriverLiveLocationPage> {
  final service = DriverService();
  bool streaming = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Location Sharing')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            if (!streaming) {
              streaming = true;
              Geolocator.getPositionStream().listen((pos) {
                service.updateLocation(pos.latitude, pos.longitude);
              });
            }
          },
          child: const Text('Start Sharing Location'),
        ),
      ),
    );
  }
}