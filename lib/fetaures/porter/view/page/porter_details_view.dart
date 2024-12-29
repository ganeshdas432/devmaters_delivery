import 'package:devmaters_delivery/fetaures/map/controllers/porter_location_picker_controller.dart';
import 'package:devmaters_delivery/fetaures/porter/service/porter_api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../delivery/controller/DeliveryController.dart';

class PorterDetailsView extends StatefulWidget {
  const PorterDetailsView({super.key});

  @override
  State<PorterDetailsView> createState() => _PorterDetailsViewState();
}

class _PorterDetailsViewState extends State<PorterDetailsView> {
  PorterLocationPickerController porterLocationPickerController = Get.find();
  final DeliveryController deliveryController = Get.put(DeliveryController());
  late double fair;
  GoogleMapController? mapController;
  String googleAPIKey = dotenv.env['GOOGLE_API_KEY']!;
  List<String> package_type=['Document','Hardware','Books & Stationary','Personal Items','Cloths','Hosehold Items','Others'];
  int? selectedIndex; // Variable to track the selected index
  String? selectedValue; // Variable to store the selected value


  final storage = GetStorage();

  String name="";
  int mobile=00;
  String cid="";


  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  double _distance = 0.0;

  late LatLng _pickedLocation;
  late LatLng _destLocation;
  
  
  
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
              // Listen to changes in pickup and drop locations
              _pickedLocation = LatLng(
                porterLocationPickerController.pickuplat.value,
                porterLocationPickerController.pickuplong.value,
              );
              _destLocation = LatLng(
                porterLocationPickerController.droplat.value,
                porterLocationPickerController.droplong.value,
              );

              // Update map camera when pickup location changes
              if (mapController != null) {
                mapController!.animateCamera(
                  CameraUpdate.newLatLng(_pickedLocation),
                );
              }

              return GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _pickedLocation,
                  zoom: 13.0,
                ),
                polylines: polylines,
                markers: _buildMarkers(),
              );
            },
          ),

          // Bottom Sheet for details and button
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.25,
            maxChildSize: 0.7,
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
                    SizedBox(height: 8,),
                    "Select Package Type".text.xl.bold.make(),
                    SizedBox(height: 80,child: ListView.builder(
                      itemCount: package_type.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            selectedValue = package_type[index];
                          });
                        },
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Chip(label: Text("${package_type[index]}",
                              style: TextStyle(
                                color: selectedIndex == index ? Colors.white : Colors.green
                              ),
                            ),
                              backgroundColor: selectedIndex == index ? Colors.green : Colors.white,

                            )),
                      );
                    },),),
                    "Estimated Weight (in Grams.)".text.xl.bold.make(),

                    VxTextField(keyboardType: TextInputType.number,contentPaddingLeft: 16,),

                    // Card 1 - Car ride details
                    SizedBox(height: 16,),
                    "Estimated Cost".text.xl.bold.make(),


                    // Card 2 - Bike ride details
                    Obx(() {
                      double charge = 15.00;
                      double distance = porterLocationPickerController.distance.value;
                      fair = charge * distance;

                      return Card(
                        child: ListTile(
                          leading: const Icon(FontAwesomeIcons.motorcycle),
                          title: Row(
                            children: [
                              const Text("Bike"),
                              const SizedBox(width: 16),
                              const Icon(Icons.person, size: 16),
                              "1".text.sm.make()
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
  Set<Marker> _buildMarkers() {
    return {
      Marker(
        markerId: const MarkerId('pickedLocation'),
        position: _pickedLocation,
      ),
      Marker(
        markerId: const MarkerId('destLocation'),
        position: _destLocation,
      ),
    };
  }

  void _onProceed() {
    PorterApiClient().placeOrder();
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
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });

        setState(() {
          polylines.add(Polyline(
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
