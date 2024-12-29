import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  var selectedocation = LatLng(37.7749, -122.4194).obs; // Default location
  var address = "".obs; // Store the address
  var isLoading = true.obs; // Loading state

  // Function to update the picked location
  void updateLocation(LatLng newLocation) {
    selectedocation.value = newLocation;
  }

  // Function to update the address
  void updateAddress(String newAddress) {
    address.value = newAddress;
  }

  // Function to toggle loading state
  void setLoading(bool loading) {
    isLoading.value = loading;
  }

  // Return both location and address as a map
  Map<String, dynamic> getSelectedLocation() {
    return {
      'location': selectedocation.value,
      'address': address.value,
    };
  }
}
