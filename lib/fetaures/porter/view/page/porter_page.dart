import 'package:devmaters_delivery/fetaures/map/controllers/porter_location_picker_controller.dart';
import 'package:devmaters_delivery/fetaures/porter/view/page/porter_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../delivery/controller/DeliveryController.dart';
import '../../../map/views/pages/place_picker.dart';

class PorterPage extends StatefulWidget {
  const PorterPage({super.key});

  @override
  State<PorterPage> createState() => _PorterPageState();
}

class _PorterPageState extends State<PorterPage> {
  PorterLocationPickerController porterLocationPickerController=Get.put(PorterLocationPickerController());
  final DeliveryController deliveryController = Get.put(DeliveryController());

  late double fair;

  String? selectedValue;


  @override
  Widget build(BuildContext context) {
    TextEditingController pickupc=new TextEditingController();
    return Scaffold(
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 0,),
          // Phone number layout equivalent
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(child:Container(
              padding: EdgeInsets.all(16),
              child: Column(children: [

                Row(
                  children: [
                    Icon(Icons.radio_button_checked,color: Colors.green,),
                    SizedBox(width: 16,),
                    Expanded(
                      child: Obx(
                            () => porterLocationPickerController.pickupaddress == ""
                            ? "Please select pickup location".text.make()
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${porterLocationPickerController.pickupaddress}",
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

                            porterLocationPickerController.updatepickup(
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
                    Icon(Icons.radio_button_checked,color: Colors.red,),
                    SizedBox(width: 16,),
                    Expanded(
                      child: Obx(
                            () => porterLocationPickerController.dropaddress == ""
                            ? "Please select drop location".text.make()
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${porterLocationPickerController.dropaddress}",
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

                            porterLocationPickerController.updatedrop(
                                location.latitude, location.longitude, address);
                          }
                        },
                        icon: const Icon(Icons.location_on_rounded,color: Colors.red,))
                  ],
                ),
              ],),
            ),),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(onPressed: () {
                if(porterLocationPickerController.locationLoaded.value){
                  Get.to(PorterDetailsView());
                }

              }, child: Text("Proceed")),
            ),
          )

          // SizedBox(
          //   width: double.maxFinite,
          //   height: 48,
          //   child: ElevatedButton(onPressed: () {
          //
          //     final delivery = Delivery(
          //       id: null,
          //       pickupLatitude: porterLocationPickerController.pickuplat.value.toString(),
          //       pickupLongitude: porterLocationPickerController.pickuplong.value.toString(),
          //       dropLatitude: porterLocationPickerController.droplat.value.toString(),
          //       dropLongitude: porterLocationPickerController.droplong.value.toString(),
          //       pickup_address: porterLocationPickerController.pickupaddress.value.toString(),
          //       drop_address: porterLocationPickerController.dropaddress.value.toString(),
          //       deliveryType: "porter",
          //       deliveryDetails: "test",
          //       pickupContact: "test2",
          //       dropContact: "fff",
          //       dropTo: "ff",
          //       orderValue: "0.0",
          //       orderWeight: "0.00",
          //       orderPaymentStatus: "due",
          //       orderPaymentType: "dd",
          //       distance: porterLocationPickerController.distance.value.toString(),
          //       deliveryCost: fair.toString(),
          //       tips:" 0.00",
          //       riderEarning: "0.00",
          //       riderId: "0",
          //       customerId: "${userDetailController.userDetail.value.cid}",
          //     );
          //     deliveryController.submitDelivery(delivery).then((value) {
          //       deliveryController.fetchDeliveries();
          //
          //     },);
          //
          //   }, child: const Text("Proceed")),
          // ),
          //
          //
          //
          // const SizedBox(height: 16,),
          //
          //
          // const Text(
          //   "Bookings",
          //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          // ),
          //
          // const Divider(),
          //
          // Obx(() {
          //   if (deliveryController.isLoading.value) {
          //     return Center(child: CircularProgressIndicator());
          //   }
          //
          //   return ListView.builder(
          //     itemCount: deliveryController.porterDelivery.length,
          //     shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     itemBuilder: (context, index) {
          //       var delivery = deliveryController.porterDelivery[index];
          //       return  Card(
          //         elevation: 5,
          //         child: ListTile(
          //           trailing: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               index==1? const Icon(Icons.done_all,color: Colors.green,):const Icon(Icons.pending,color: Colors.orange,),
          //               index==1?const Text("Done"):const Text("Pending"),
          //             ],
          //           ),
          //           leading: const Icon(Icons.location_on_rounded,size: 54,color: Colors.green,),
          //           title: Text("#${delivery.id}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
          //           subtitle:  Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text("${delivery.pickup_address}",maxLines: 1,overflow: TextOverflow.ellipsis,),
          //               Icon(Icons.arrow_downward),
          //               Text("${delivery.drop_address}",maxLines: 1,overflow: TextOverflow.ellipsis,)
          //
          //             ],),
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
