import 'package:cached_network_image/cached_network_image.dart';
import 'package:devmaters_delivery/fetaures/orders/controller/cart_Controller.dart';
import 'package:devmaters_delivery/fetaures/map/controllers/delivery_location_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../Core/constant.dart';
import '../../../map/views/pages/map_location_picker.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  DeliveryLocationPickerController deliveryLocationPickerController=Get.put(DeliveryLocationPickerController());
  CartController cartController=Get.find();
  String? selectedValue;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on_rounded,size: 36,),
                  Expanded(
                    child: Obx(() => deliveryLocationPickerController.dropaddress==""?const SizedBox(): Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${deliveryLocationPickerController.dropaddress}",textAlign: TextAlign.start,maxLines: 2,overflow: TextOverflow.ellipsis,),
                    ),
                    ),
                  ),
                  TextButton(onPressed: () async {
                    Map<String, dynamic>? result = await Get.to(() => MapLocationPicker());

                    if (result != null) {
                      LatLng location = result['location'];
                      String address = result['address'];

                      deliveryLocationPickerController.updatedrop(location.latitude, location.longitude, address);
                    }
                  }, child: const Text("Change"))

                ],
              ),
            ),

            const Divider(),
            const Row(
              children: [
                Text(
                  "Cart",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),

                Expanded(child: Text("Vendor Name Is here",style: TextStyle(fontSize: 12),textAlign: TextAlign.right,))
              ],
            ),




           Expanded(child: Obx(
             () {



               return ListView.builder(
                 itemCount: cartController.cartItems.length,
                 itemBuilder: (context, index) {
                   return Row(
                     children: [
                       Card(elevation: 15,
                         margin: const EdgeInsets.symmetric(vertical: 16),
                         child: CachedNetworkImage(imageUrl: "${ConstantData.baseurl}/storage/${cartController.cartItems[index].productImage}",height: 100,width: 100,),),
                       const SizedBox(width: 8,),
                       Expanded(child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(
                             height:24,
                             child: Row(
                               children: [
                                  Expanded(child: Text("${cartController.cartItems[index].productName}",maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                 IconButton(onPressed: () {

                                 }, icon:const Icon(Icons.cancel),color: Colors.red,)
                               ],
                             ),
                           ),
                           const Text("category name",style: TextStyle(color: Colors.black54),),
                           Row(children: [
                              Text("₹ ${cartController.cartItems[index].price.toString()}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
                             const Spacer(),
                             IconButton(onPressed: () {

                             }, icon: const Icon(Icons.remove)),
                             Container(
                                 padding: const EdgeInsets.symmetric(horizontal: 10),
                                 decoration: BoxDecoration(
                                     border: Border.all(
                                         width: 0.2
                                     )
                                 ),
                                 child: const Text("1")),
                             IconButton(onPressed: () {

                             }, icon: const Icon(Icons.add))
                           ],)
                         ],
                       )),

                     ],
                   );
                 },);
             }

           )),

            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
              child: Table(
                children:  [
                  TableRow(children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("Subtotal"),
                        ),
                        Text("₹ ${cartController.subtotal.toStringAsFixed(2)}")
                      ],
                    )
                  ]),
                  TableRow(children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("Delivery Charges"),
                        ),
                        Text("₹ 60")
                      ],
                    )
                  ]),
                  TableRow(children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("Taxes"),
                        ),
                        Text("₹ 18")
                      ],
                    )
                  ]),
                  TableRow(children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("Total"),
                        ),
                        Text("₹ 378")
                      ],
                    )
                  ]),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.maxFinite, 48)
              ),
                onPressed: () {

            }, child: const Text("Proceed")),

          ],
        ),
      )),
    );
  }
}
