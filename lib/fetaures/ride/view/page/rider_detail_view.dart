import 'package:devmaters_delivery/fetaures/ride/service/ride_api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../map/controllers/ride_location_picker_controller.dart';
import '../../../delivery/controller/DeliveryController.dart';

class RiderDetailView extends StatefulWidget {
  const RiderDetailView({super.key});

  @override
  State<RiderDetailView> createState() => _RiderDetailViewState();
}

class _RiderDetailViewState extends State<RiderDetailView> {
  RideLocationPickerController rideLocationPickerController = Get.find();
  final DeliveryController deliveryController = Get.put(DeliveryController());
  late double fair;
  String googleAPIKey = dotenv.env['GOOGLE_API_KEY']!;
  final storage = GetStorage();

  String name="";
  int mobile=00;
  String cid="";



  List<LatLng> polylineCoordinates = [];
  double _distance = 0.0;
  int? selectedIndex=0; // Variable to track the selected index

  // late LatLng _pickedLocation;
  // late LatLng _destLocation;

  @override
  Widget build(BuildContext context) {

     name=storage.read('user')['name'];
     mobile=storage.read('user')['mobile'];
     cid=storage.read('user')['id'].toString();

    return Scaffold(
      body: Stack(
        children: [
          // Map widget
          Obx(
                () {
                  GoogleMapController? mapController;

                  // Listen to changes in pickup and drop locations
                  LatLng _pickedLocation = LatLng(
                rideLocationPickerController.pickuplat.value,
                rideLocationPickerController.pickuplong.value,
              );
                  LatLng  _destLocation = LatLng(
                rideLocationPickerController.droplat.value,
                rideLocationPickerController.droplong.value,
              );

              // Update map camera when pickup location changes
              if (mapController != null) {
                mapController!.animateCamera(
                  CameraUpdate.newLatLng(_pickedLocation),
                );
              }



              return GoogleMap(
                onMapCreated: (controller) {
                  _onMapCreated(controller,_pickedLocation,_destLocation);
                },
                initialCameraPosition: CameraPosition(
                  target: _pickedLocation,
                  zoom: 13.0,
                ),
                polylines: rideLocationPickerController.polylines,
                markers: _buildMarkers(_pickedLocation,_destLocation),
              );
            },
          ),

          // Bottom Sheet for details and button
          DraggableScrollableSheet(
            initialChildSize: 0.75,
            minChildSize: 0.25,
            maxChildSize: 0.75,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  controller: scrollController,
                  children: [
                    "Select Passengers".text.xl.bold.make(),

                    SizedBox(height: 80,child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(FontAwesomeIcons.person,  color:selectedIndex != null && index <= selectedIndex!
                                  ? Colors.green
                                  : Colors.grey,)),
                        );
                      },),),
                    // Card 1 - Car ride details
                    "Estimated Cost".text.xl.bold.make(),

                    Obx(() {
                      double charge = 25.00;
                      double distance = rideLocationPickerController.distance.value;
                      fair = charge * distance;

                      return Card(
                        child: ListTile(
                          leading: const Icon(FontAwesomeIcons.car),
                          title: Row(
                            children: [
                              const Text("Car"),
                              const SizedBox(width: 16),
                              const Icon(Icons.person, size: 16),
                              "${selectedIndex!+1}".text.sm.make()
                            ],
                          ),
                          subtitle: Text("${distance} KM"),
                          trailing: "₹ ${fair}".text.bold.xl.make(),
                        ),
                      );
                    }),

                    // Card 2 - Bike ride details
                    Visibility(
                      visible: selectedIndex!+1>1?false:true,
                      child: Obx(() {
                        double charge = 15.00;
                        double distance = rideLocationPickerController.distance.value;
                        fair = charge * distance;

                        return Card(
                          child: ListTile(
                            leading: const Icon(FontAwesomeIcons.motorcycle),
                            title: Row(
                              children: [
                                const Text("Bike"),
                                const SizedBox(width: 16),
                                const Icon(Icons.person, size: 16),
                                "${selectedIndex!+1}".text.sm.make()
                              ],
                            ),
                            subtitle: Text("${distance} KM"),
                            trailing: "₹ ${fair}".text.bold.xl.make(),
                          ),
                        );
                      }),
                    ),


                    Obx(() {
                      double charge = 25.00;
                      double distance = rideLocationPickerController.distance.value;
                      fair = charge * distance;

                      return Card(
                        child: ListTile(
                          leading: const Icon(FontAwesomeIcons.car),
                          title: Row(
                            children: [
                              const Text("Auto Rickshaw"),
                              const SizedBox(width: 16),
                              const Icon(Icons.person, size: 16),
                              "${selectedIndex!+1}".text.sm.make()
                            ],
                          ),
                          subtitle: Text("${distance} KM"),
                          trailing: "₹ ${fair}".text.bold.xl.make(),
                        ),
                      );
                    }),

                    const SizedBox(height: 8),

                    // Button to proceed
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _onProceed,
                        child: const Text("Proceed"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Set<Marker> _buildMarkers(LatLng pickedLocation, LatLng destLocation) {
    return {
      Marker(
        markerId: const MarkerId('pickedLocation'),
        position: pickedLocation,
      ),
      Marker(
        markerId: const MarkerId('destLocation'),
        position: destLocation,
      ),
    };
  }

  void _onProceed() {
    RideApiClient().placeOrder();
  }

  void _onMapCreated(GoogleMapController controller, LatLng pickedLocation, LatLng destLocation) {
    rideLocationPickerController.polylines.clear();

    _createPolylines(pickedLocation, destLocation);
  }

  void _createPolylines(LatLng pickedLocation, LatLng destLocation) async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();
      PointLatLng startPoint = PointLatLng(pickedLocation.latitude, pickedLocation.longitude);
      PointLatLng endPoint = PointLatLng(destLocation.latitude, destLocation.longitude);

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        request: PolylineRequest(
          origin: startPoint,
          destination: endPoint,
          mode: TravelMode.driving,
        ),
        googleApiKey: googleAPIKey,
      );

      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });

        setState(() {

          rideLocationPickerController.updatePoly(Polyline(
            polylineId: const PolylineId("polyline"),
            color: Colors.blue,
            points: polylineCoordinates,
            width: 5,
          ));


          _distance = result.distanceValues!.first / 1000;
        });
      } else {
        print('No route found.');
      }
    } catch (e) {
      print('Error fetching route: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unable to fetch route. Please try again. ${e}')),
      );
    }
  }
}
