import 'package:devmaters_delivery/fetaures/map/views/pages/route_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../map/views/pages/map_location_picker.dart';


class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Address"),),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
                onPressed: () {


                }, child: const SizedBox(
              height: 40,
              child: Row(children: [
                Icon(Icons.add,color: Colors.white,),
                SizedBox(width: 8,),
                Text("Add New Address",style: TextStyle(color: Colors.white),)
              ],),
            )),
            Expanded(child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
              return const Card(
                child: ListTile(
                  leading: Icon(Icons.location_on_rounded),
                  title: Text("25/D, Kolkata Sector 5 ,742202"),
                  subtitle: Text("9876543210"),
                ),
              );
            },)),
            ElevatedButton(
              onPressed: () async {
                LatLng? selectedLocation = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapLocationPicker(),
                  ),
                );

                if (selectedLocation != null) {
                  // Use the selected location (latitude, longitude)
                  print('Selected Location: ${selectedLocation.latitude}, ${selectedLocation.longitude}');
                }
              },
              child: const Text('Pick Location'),
            ),

            ElevatedButton(onPressed: () {
              Get.to(MapSample());

            }, child: const Text("Route"))

          ],
        ),
      )),
    );
  }
}

