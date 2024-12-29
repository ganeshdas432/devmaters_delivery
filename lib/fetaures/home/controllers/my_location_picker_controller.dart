import 'dart:async';
import 'dart:math';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLocationPickerController extends GetxController {
  String googleAPIKey = dotenv.env['GOOGLE_API_KEY']!;

  RxDouble pickuplat = 0.0.obs;
  RxDouble pickuplong = 0.0.obs;
  RxString pickupaddress = "".obs;


  RxDouble distance = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  // Method to fetch current location
  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied.');
      return;
    }

    Geolocator.getPositionStream().listen((Position position) async {
      pickuplat.value = position.latitude;
      pickuplong.value = position.longitude;
      await getAddressFromLatLng(position.latitude, position.longitude);
    });
  }

  // Method to get address from latitude and longitude
  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        pickupaddress.value = "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
        print("Current Address: $pickupaddress");
      }
    } catch (e) {
      print("Error getting address: $e");
    }
  }

  updatepickup(double lat, double long, String address) {
    pickuplat.value = lat;
    pickuplong.value = long;
    pickupaddress.value = address;

  }


}
