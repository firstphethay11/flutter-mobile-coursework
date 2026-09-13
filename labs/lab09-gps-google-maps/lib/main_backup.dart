import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _locationMessage = "Latitude: 14.974796, Longitude: 102.098127\nอนุสาวรีย์ท้าวสุรนารี (ย่าโม)";
  LatLng? _currentLatLng = const LatLng(14.974796, 102.098127);
  final MapController _mapController = MapController();

  Future<void> _getCurrentLocation() async {

    bool serviceEnabled;
   
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = "Location services are disabled.";
      });
      return;
    }else{
      setState(() {
        _locationMessage = "Location services are enabled.";
      });
    }

    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = "Location permissions are denied";
        });
        return;
      }
    }



    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        timeLimit: Duration(seconds: 20),
        ));
       
    setState(() {
      _locationMessage =
          "Latitude: ${position.latitude},\nLongitude: ${position.longitude}";
      _currentLatLng = LatLng(position.latitude, position.longitude);
      _mapController.move(_currentLatLng!, 18.0);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(14.974796, 102.098127), // Thao Suranari Monument
                  initialZoom: 16.5,
                ),
                mapController: _mapController,
                children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.flutter_application_1',
                ),
                if (_currentLatLng != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: _currentLatLng!,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40.0,
                        ),
                      ),
                    ],
                  ),
              ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text('Current Location:'),
                  Text(
                    _locationMessage,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),              ],
                  ),)
               ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        tooltip: 'Get Location',
        child: const Icon(Icons.location_on),
      ),
    );
  }
}