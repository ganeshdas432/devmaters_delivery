import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController? mapController;
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  double _distance = 0.0;  // To store the distance

  String googleAPIKey = dotenv.env['GOOGLE_API_KEY']!;

  LatLng _pickedLocation = LatLng(37.7749, -122.4194); // Example: San Francisco
  LatLng _destLocation = LatLng(37.7449, -122.4194);   // Example: Destination location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Polyline on Google Map')),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _pickedLocation,
                zoom: 13.0,
              ),
              polylines: polylines,
              markers: {
                Marker(
                  markerId: MarkerId('pickedLocation'),
                  position: _pickedLocation,
                ),
                Marker(
                  markerId: MarkerId('destLocation'),
                  position: _destLocation,
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Distance: ${_distance.toStringAsFixed(2)} km',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _createPolylines();
  }

  void _createPolylines() async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();
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
        // Add the polyline points to the list
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });

        setState(() {
          polylines.add(Polyline(
            polylineId: PolylineId("polyline"),
            color: Colors.blue,
            points: polylineCoordinates,
            width: 5,
          ));

          // Calculate distance using the PolylineResult
          _distance = result.distanceValues!.first / 1000;  // Convert meters to kilometers
          print("Distance ${result.distanceTexts} and ${result.distanceValues}");
        });
      } else {
        print('No route found.');
      }
    } catch (e) {
      print('Error fetching route: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unable to fetch route. Please try again.${e}')),
      );
    }
  }
}
