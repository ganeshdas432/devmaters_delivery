import 'package:devmaters_delivery/Views/map_location_picker.dart';
import 'package:devmaters_delivery/controllers/ride_location_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookRide extends StatefulWidget {
  const BookRide({super.key});

  @override
  State<BookRide> createState() => _BookRideState();
}

class _BookRideState extends State<BookRide> {
  RideLocationPickerController rideLocationPickerController=Get.put(RideLocationPickerController());
  String? selectedValue;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 0,),
              // Phone number layout equivalent
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {

                      Map<String, dynamic>? result = await Get.to(() => MapLocationPicker());

                      if (result != null) {
                        LatLng location = result['location'];
                        String address = result['address'];


                        rideLocationPickerController.updatepickup(location.latitude, location.longitude, address);
                      }

                    },
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Card(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on_rounded,size: 36,),
                          const Text("Pickup Location",style: TextStyle(fontWeight: FontWeight.bold),),
                          Obx(() =>
                             rideLocationPickerController.pickupaddress==""?const SizedBox(): Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${rideLocationPickerController.pickupaddress}",textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,),
                            ),
                          ),
                        ],
                      ),),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      Map<String, dynamic>? result = await Get.to(() => MapLocationPicker());

                      if (result != null) {
                        LatLng location = result['location'];
                        String address = result['address'];

                        rideLocationPickerController.updatedrop(location.latitude, location.longitude, address);
                      }
                    },
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Card(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on_rounded,size: 36,),
                          const Text("Drop Location"),
                          Obx(() => rideLocationPickerController.dropaddress==""?const SizedBox(): Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${rideLocationPickerController.dropaddress}",textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,),
                            ),
                          ),

                        ],
                      ),),
                    ),
                  ),
                )
              ],),

              Container(

                height: 140,
                width: double.maxFinite,
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Charges :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      const Divider(),
                      Row(
                      children: [
                        const Expanded(child: Text("Distance :",style: TextStyle(fontWeight: FontWeight.bold),)),

                        Obx(() => Text("${rideLocationPickerController.distance}",style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),),),
                      ],
                    ),
                      Row(
                      children: [
                        const Expanded(child: Text("Total Charges :",style: TextStyle(fontWeight: FontWeight.bold),)),
                        Obx(() {
                          double charge=15.00;
                          double distance=rideLocationPickerController.distance.value;
                          double fair=charge*distance;

                          return Text("${fair}",style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),);
                        },),
                      ],
                    ),


                  ],),
                ),),
              ),

              const SizedBox(height: 8,),

              SizedBox(
                width: double.maxFinite,
                height: 48,
                child: ElevatedButton(onPressed: () {

                }, child: const Text("Proceed")),
              ),



              const SizedBox(height: 16,),


              const Text(
                "Bookings",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),

              const Divider(),

              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          index==1? const Icon(Icons.done_all,color: Colors.green,):const Icon(Icons.pending,color: Colors.orange,),
                          index==1?const Text("Done"):const Text("Pending"),
                        ],
                      ),
                      leading: const Icon(Icons.location_on_rounded,size: 54,color: Colors.green,),
                      title: const Text("#245824",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                      subtitle: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("24 No,Gitanjali Road,Kolkata,700001",maxLines: 1,overflow: TextOverflow.ellipsis,),
                          Icon(Icons.arrow_downward),
                          Text("24 No,Gitanjali Road,Kolkata,700001",maxLines: 1,overflow: TextOverflow.ellipsis,)

                        ],),
                    ),
                  );
                },)

            ],
          ),
        ),
      )),
    );
  }
}
