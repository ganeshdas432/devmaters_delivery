import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../controllers/location_controller.dart';

class MapLocationPicker extends StatefulWidget {
  @override
  _MapLocationPickerState createState() => _MapLocationPickerState();
}

class _MapLocationPickerState extends State<MapLocationPicker> {
  GoogleMapController? _mapController;

  LatLng _pickedLocation = const LatLng(37.7749, -122.4194); // Default: San Francisco
  bool _isLoading = true;
  String? _address; // To store the fetched address
  final LocationController locationController = Get.put(LocationController());
  String googleAPIKey = dotenv.env['GOOGLE_API_KEY']!;


  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    // Check for permissions and get the user's current location
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(locationSettings: AndroidSettings(
      accuracy: LocationAccuracy.high
    ));

    setState(() {
      _pickedLocation = LatLng(position.latitude, position.longitude);
      _isLoading = false;
      locationController.setLoading(false);

    });

    _getAddressFromLatLng(_pickedLocation.latitude, _pickedLocation.longitude);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onTap(LatLng location) {
    setState(() {
      _pickedLocation = location;
    });

    _getAddressFromLatLng(location.latitude, location.longitude);
  }

  Future<void> _getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          _address =
          "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country} ,${place.postalCode}";
          locationController.updateAddress(_address!);
          locationController.updateLocation(LatLng(lat, lng));

        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Location'),
        actions: [

        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [

          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _pickedLocation,
                zoom: 15,
              ),
              onTap: _onTap, // This allows tapping to pick a new location
              markers: {
                Marker(
                  markerId: const MarkerId('pickedLocation'),
                  position: _pickedLocation,
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Picked Location:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Latitude: ${_pickedLocation.latitude}',
                        style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Longitude: ${_pickedLocation.longitude}',
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                Text(
                  'Address: ${_address ?? "Fetching address..."}',
                  style: const TextStyle(fontSize: 14),
                ),

                const SizedBox(height: 16,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.maxFinite, 48)
                    ),
                    onPressed: () {
                  Get.back(result: locationController.getSelectedLocation());
                }, child: const Text("Apply"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
