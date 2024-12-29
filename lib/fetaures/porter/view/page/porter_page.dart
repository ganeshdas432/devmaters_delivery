import 'package:devmaters_delivery/controllers/porter_location_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../fetaures/auth/controller/user_details_controller.dart';
import '../../../fetaures/delivery/controller/DeliveryController.dart';
import '../../../fetaures/delivery/model/Delivery.dart';
import '../../map_location_picker.dart';

class PorterPage extends StatefulWidget {
  const PorterPage({super.key});

  @override
  State<PorterPage> createState() => _PorterPageState();
}

class _PorterPageState extends State<PorterPage> {
  PorterLocationPickerController porterLocationPickerController=Get.put(PorterLocationPickerController());
  final DeliveryController deliveryController = Get.put(DeliveryController());
  UserDetailController userDetailController=Get.find();

  late double fair;

  String? selectedValue;


  @override
  Widget build(BuildContext context) {
    TextEditingController pickupc=new TextEditingController();
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


                          porterLocationPickerController.updatepickup(location.latitude, location.longitude, address);
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
                            porterLocationPickerController.pickupaddress==""?const SizedBox(): Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${porterLocationPickerController.pickupaddress}",textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,),
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

                          porterLocationPickerController.updatedrop(location.latitude, location.longitude, address);
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
                            Obx(() => porterLocationPickerController.dropaddress==""?const SizedBox(): Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${porterLocationPickerController.dropaddress}",textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,),
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

                          Obx(() => Text("${porterLocationPickerController.distance}",style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),),),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(child: Text("Total Charges :",style: TextStyle(fontWeight: FontWeight.bold),)),
                          Obx(() {
                            double charge=20.00;
                            double distance=porterLocationPickerController.distance.value;
                             fair=charge*distance;

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

                  final delivery = Delivery(
                    id: null,
                    pickupLatitude: porterLocationPickerController.pickuplat.value.toString(),
                    pickupLongitude: porterLocationPickerController.pickuplong.value.toString(),
                    dropLatitude: porterLocationPickerController.droplat.value.toString(),
                    dropLongitude: porterLocationPickerController.droplong.value.toString(),
                    pickup_address: porterLocationPickerController.pickupaddress.value.toString(),
                    drop_address: porterLocationPickerController.dropaddress.value.toString(),
                    deliveryType: "porter",
                    deliveryDetails: "test",
                    pickupContact: "test2",
                    dropContact: "fff",
                    dropTo: "ff",
                    orderValue: "0.0",
                    orderWeight: "0.00",
                    orderPaymentStatus: "due",
                    orderPaymentType: "dd",
                    distance: porterLocationPickerController.distance.value.toString(),
                    deliveryCost: fair.toString(),
                    tips:" 0.00",
                    riderEarning: "0.00",
                    riderId: "0",
                    customerId: "${userDetailController.userDetail.value.cid}",
                  );
                  deliveryController.submitDelivery(delivery).then((value) {
                    deliveryController.fetchDeliveries();

                  },);

                }, child: const Text("Proceed")),
              ),



              const SizedBox(height: 16,),


              const Text(
                "Bookings",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),

              const Divider(),

              Obx(() {
                if (deliveryController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: deliveryController.porterDelivery.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var delivery = deliveryController.porterDelivery[index];
                    return  Card(
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
                        title: Text("#${delivery.id}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                        subtitle:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${delivery.pickup_address}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                            Icon(Icons.arrow_downward),
                            Text("${delivery.drop_address}",maxLines: 1,overflow: TextOverflow.ellipsis,)

                          ],),
                      ),
                    );
                  },
                );
              }),

            ],
          ),
        ),
      )),
    );
  }
}
