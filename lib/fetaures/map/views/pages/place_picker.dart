
import 'package:devmaters_delivery/fetaures/auth/controller/auth_controller.dart';
import 'package:devmaters_delivery/fetaures/home/controllers/my_location_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

import '../../controllers/location_controller.dart';

class PlacePickerPage extends StatefulWidget {
  const PlacePickerPage({super.key});

  @override
  State<PlacePickerPage> createState() => _PlacePickerState();
}

class _PlacePickerState extends State<PlacePickerPage> {
  String googleAPIKey = dotenv.env['GOOGLE_API_KEY']!;
  LatLng _pickedLocation = const LatLng(37.7749, -122.4194); // Default: San Francisco

  final LocationController locationController = Get.put(LocationController());
  final MyLocationPickerController myLocationPickerController = Get.find();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pickedLocation=LatLng(myLocationPickerController.pickuplat.value,myLocationPickerController.pickuplong.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlacePicker(
        apiKey: googleAPIKey,
        onPlacePicked: (LocationResult result) {
          debugPrint("Place picked: ${result.formattedAddress}");
          debugPrint("Place picked: ${result.latLng}");
          locationController.updateAddress(result.formattedAddress.toString());
          locationController.updateLocation(result.latLng!);

          Get.back(result: locationController.getSelectedLocation());

        },
        initialLocation: _pickedLocation,
        searchInputConfig: const SearchInputConfig(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          autofocus: false,
          textDirection: TextDirection.ltr,
        ),
        searchInputDecorationConfig: const SearchInputDecorationConfig(
          hintText: "Search for a building, street or ...",
        ),
      ),
    );
  }
}
