import 'dart:math';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideLocationPickerController extends GetxController {
  String googleAPIKey = dotenv.env['GOOGLE_API_KEY']!;

  RxDouble pickuplat = 00.00.obs;
  RxDouble pickuplong = 00.00.obs;
  RxString pickupaddress = "".obs;

  RxDouble droplat = 00.00.obs;
  RxDouble droplong = 00.00.obs;
  RxString dropaddress = "".obs;

  RxDouble distance = 00.00.obs;
  RxBool locationLoaded = false.obs;
  RxSet<Polyline> polylines = <Polyline>{}.obs;



  updatePoly(Polyline polyline){
    polylines.add(polyline);
    polylines.refresh();


  }


  updatepickup(double lat, double long, String address) {
    pickuplat.value = lat;
    pickuplong.value = long;
    pickupaddress.value = address;

    if (pickupaddress.value.isNotEmpty && dropaddress.isNotEmpty) {
      getDistance();
      isLocationLoaded();
    }
  }

  updatedrop(double lat, double long, String address) {
    droplat.value = lat;
    droplong.value = long;
    dropaddress.value = address;

    if (pickupaddress.value.isNotEmpty && dropaddress.isNotEmpty) {
      getDistance();
      isLocationLoaded();
    }
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    const double radius = 6371; // Earth's radius in kilometers
    double dLat = _deg2rad(lat2 - lat1);
    double dLon = _deg2rad(lon2 - lon1);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_deg2rad(lat1)) * cos(_deg2rad(lat2)) *
            sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return radius * c;
  }

  double _deg2rad(double deg) {
    return deg * (pi / 180);
  }

  getDistance() async {
    try {
      if (pickuplat.value == droplat.value && pickuplong.value == droplong.value) {
        print("Pickup and drop-off locations are the same.");
        return;
      }

      PolylinePoints polylinePoints = PolylinePoints();
      LatLng _pickedLocation = LatLng(pickuplat.value, pickuplong.value);
      LatLng _destLocation = LatLng(droplat.value, droplong.value);

      PointLatLng startPoint = PointLatLng(_pickedLocation.latitude, _pickedLocation.longitude);
      PointLatLng endPoint = PointLatLng(_destLocation.latitude, _destLocation.longitude);

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        request: PolylineRequest(
          origin: startPoint,
          destination: endPoint,
          mode: TravelMode.driving,
        ),
        googleApiKey: googleAPIKey,
      );

      if (result.points.isNotEmpty) {
        double totalDistance = 0.0;
        for (int i = 0; i < result.points.length - 1; i++) {
          totalDistance += calculateDistance(
              result.points[i].latitude,
              result.points[i].longitude,
              result.points[i + 1].latitude,
              result.points[i + 1].longitude);
        }
        distance.value = double.parse(totalDistance.toStringAsFixed(2));
        print("Total distance: ${distance.value} km");
      } else {
        print('No route found.');
      }
    } catch (e) {
      print('Error fetching route: $e');
    }
  }

  double calculateFare(double chargePerKm) {
    return (distance.value * chargePerKm).toPrecision(2);
  }

  isLocationLoaded() {
    locationLoaded.value = !(pickuplat.value == 0.00 ||
        pickuplong.value == 0.00 ||
        droplat.value == 0.00 ||
        droplong.value == 0.00);
  }
}
