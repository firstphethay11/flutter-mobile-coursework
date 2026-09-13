import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; //import google_maps_flutter

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Location Demo'),
    );
  }
}

//ใช้ StatefulWidget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //ตัวแปรเก็บค่าตำแหน่ง GPS เป็น Position และค่าเริ่มต้นเป็น null
  Position? _currentPosition = null;
  String _locationMessage = "Press the button to get location";

  //สร้างตัวแปรควบคุมแผนที่ GoogleMapController
  GoogleMapController? mapController;

  //เมธอดดึงพิกัด GPS
  Future<dynamic> _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    _currentPosition = position;
    setState(() {
      _currentPosition = position;
      _locationMessage =
          "Latitude: ${position.latitude},\nLongitude: ${position.longitude}";
    });
    return position;
  }

  // พิกัดปลายทาง: อนุสาวรีย์ท้าวสุรนารี (ย่าโม จ.นครราชสีมา)
  final LatLng _destination = const LatLng(14.974796, 102.098127);

  // เมธอดสร้าง GoogleMap แสดงแผนที่ หมุด และเส้นทาง
  _showMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController controller) =>
          mapController = controller,
      initialCameraPosition: CameraPosition(
        target: _destination, // โฟกัสมาที่อนุสาวรีย์ท้าวสุรนารีทันที
        zoom: 18.0,
      ),
      // หมุดตำแหน่งปัจจุบัน และหมุดปลายทางอนุสาวรีย์ท้าวสุรนารี
      markers: {
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: LatLng(
            _currentPosition!.latitude,
            _currentPosition!.longitude,
          ),
          infoWindow: const InfoWindow(title: 'ตำแหน่งปัจจุบัน'),
        ),
        Marker(
          markerId: const MarkerId('destination'),
          position: _destination,
          infoWindow: const InfoWindow(title: 'อนุสาวรีย์ท้าวสุรนารี'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      },
      // วาดเส้นทาง (Polyline) เชื่อมจากตำแหน่งปัจจุบันไปยังปลายทาง
      polylines: {
        Polyline(
          polylineId: const PolylineId('routeToDestination'),
          points: [
            LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            _destination,
          ],
          color: Colors.blue,
          width: 5,
        ),
      },
    );
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
              child: FutureBuilder(
                future: _getLocation(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
                        snapshot.hasData
                        ? _showMap()
                        : const Center(child: CircularProgressIndicator()),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16.0,
              ),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Current Location:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _locationMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _getLocation();
          if (_currentPosition != null) {
            mapController?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(target: _destination, zoom: 15.0),
              ),
            );
          }
        },
        tooltip: 'Get Location',
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
