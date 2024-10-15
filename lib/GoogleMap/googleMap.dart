import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapExample extends StatefulWidget {
  @override
  _MapExampleState createState() => _MapExampleState();
}

class _MapExampleState extends State<MapExample> {
  late GoogleMapController mapController;
  String _currentLocation = "Getting location...";
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _currentLocation = "Location permissions are permanently denied.";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _currentLocation = "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });

    mapController.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.teal)),
        title: Text("Google Map",style: TextStyle(color: Colors.teal),),
      ),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _currentPosition!,
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: MarkerId("current_location"),
            position: _currentPosition!,
            infoWindow: InfoWindow(title: "You are here"),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        tooltip: 'Get Location',
        child: Icon(Icons.my_location_outlined,color: Colors.teal,),
      ),
    );
  }
}

