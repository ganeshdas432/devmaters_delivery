import 'package:devmaters_delivery/fetaures/map/views/pages/place_picker.dart';
import 'package:devmaters_delivery/fetaures/map/controllers/ride_location_picker_controller.dart';
import 'package:devmaters_delivery/fetaures/ride/view/page/rider_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';


class BookRide extends StatefulWidget {
  const BookRide({super.key});

  @override
  State<BookRide> createState() => _BookRideState();
}

class _BookRideState extends State<BookRide> {
  RideLocationPickerController rideLocationPickerController =
      Get.put(RideLocationPickerController());


  final List<String> options = ["Car", "Bike"];
  String? selectedValue;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = options[0]; // Set the initial value to the first item

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 0,
              ),
              // Phone number layout equivalent



              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child:Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [

                    Row(
                      children: [
                        const Icon(Icons.radio_button_checked,color: Colors.green,),
                        const SizedBox(width: 16,),
                        Expanded(
                          child: Obx(
                                () => rideLocationPickerController.pickupaddress == ""
                                ? "Please select pickup location".text.make()
                                : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${rideLocationPickerController.pickupaddress}",
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              Map<String, dynamic>? result =
                              await Get.to(() => const PlacePickerPage());

                              if (result != null) {
                                LatLng location = result['location'];
                                String address = result['address'];

                                rideLocationPickerController.updatepickup(
                                    location.latitude, location.longitude, address);
                              }
                            },
                            icon: const Icon(Icons.location_on_rounded,color: Colors.green,))
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),


                    Row(
                      children: [
                        const Icon(Icons.radio_button_checked,color: Colors.red,),
                        const SizedBox(width: 16,),
                        Expanded(
                          child: Obx(
                                () => rideLocationPickerController.dropaddress == ""
                                ? "Please select drop location".text.make()
                                : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${rideLocationPickerController.dropaddress}",
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              Map<String, dynamic>? result =
                              await Get.to(() => const PlacePickerPage());

                              if (result != null) {
                                LatLng location = result['location'];
                                String address = result['address'];

                                rideLocationPickerController.updatedrop(
                                    location.latitude, location.longitude, address);

                              }
                            },
                            icon: const Icon(Icons.location_on_rounded,color: Colors.red,))
                      ],
                    ),
                  ],),
                ),),
              ),

              const SizedBox(
                height: 8,
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(onPressed: () {
                    if(rideLocationPickerController.locationLoaded.value){
                      Get.to(RiderDetailView());
                    }else{
                      Get.snackbar("Error", "Please select pickup and drop location",backgroundColor: Colors.red,colorText: Colors.white);
                    }

                  }, child: Text("Proceed")),
                ),
              )







              // const Text(
              //   "Bookings",
              //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              // ),
              //
              // const Divider(),
              //
              // Obx(() {
              //   if (deliveryController.isLoading.value) {
              //     return const Center(child: CircularProgressIndicator());
              //   }
              //
              //   return ListView.builder(
              //     itemCount: deliveryController.rideDelivery.length,
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       var delivery = deliveryController.rideDelivery[index];
              //       return Card(
              //         elevation: 5,
              //         child: ListTile(
              //           trailing: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               index == 1
              //                   ? const Icon(
              //                       Icons.done_all,
              //                       color: Colors.green,
              //                     )
              //                   : const Icon(
              //                       Icons.pending,
              //                       color: Colors.orange,
              //                     ),
              //               index == 1
              //                   ? const Text("Done")
              //                   : const Text("Pending"),
              //             ],
              //           ),
              //           leading: const Icon(
              //             Icons.location_on_rounded,
              //             size: 54,
              //             color: Colors.green,
              //           ),
              //           title: Text(
              //             "#${delivery.id}",
              //             style: const TextStyle(
              //                 fontWeight: FontWeight.w600, fontSize: 18),
              //           ),
              //           subtitle: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 "${delivery.pickup_address}",
              //                 maxLines: 1,
              //                 overflow: TextOverflow.ellipsis,
              //               ),
              //               const Icon(Icons.arrow_downward),
              //               Text(
              //                 "${delivery.drop_address}",
              //                 maxLines: 1,
              //                 overflow: TextOverflow.ellipsis,
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   );
              // }),
            ],
          )),
    );
  }


}
