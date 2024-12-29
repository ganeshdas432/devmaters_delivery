import 'package:cached_network_image/cached_network_image.dart';
import 'package:devmaters_delivery/fetaures/orders/controller/cart_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/constant.dart';
import '../../../orders/service/ApiClient.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  CartController cartController=Get.find();
  String? selectedValue;


  @override
  Widget build(BuildContext context) {
    cartController.getDistance();
    return  Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child:cartController.cartItems.isNotEmpty? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



             Row(
              children: [


                const Spacer(),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("${cartController.cartItems.first.shopname}"),
                  Obx(() =>  Text("Distance: ${cartController.distance} KM")),

                ],)





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
                         child: ClipRRect(
                             borderRadius: const BorderRadius.all(Radius.circular(10)),
                             child: CachedNetworkImage(imageUrl: "${ConstantData.baseurl}storage/${cartController.cartItems[index].productImage}",height: 100,width: 100,fit: BoxFit.cover,)),),
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

                                   setState(() {
                                     cartController.removeCartItem(cartController.cartItems[index].productId!);

                                   });

                                 }, icon:const Icon(Icons.cancel),color: Colors.red,)
                               ],
                             ),
                           ),
                           const Text("category name",style: TextStyle(color: Colors.black54),),
                           Row(children: [
                              Text("₹ ${cartController.cartItems[index].price.toString()}",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
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
                        const Expanded(
                          child: Text("Subtotal"),
                        ),
                        Obx(()=>Text("₹ ${cartController.subtotal.toStringAsFixed(2)}"))
                      ],
                    )
                  ]),
                  TableRow(children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text("Delivery Charges"),
                        ),
                        Obx(() =>  Text("₹ ${cartController.delivery_charge.toStringAsFixed(2)}"))
                      ],
                    )
                  ]),
                  const TableRow(children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("Taxes"),
                        ),
                        Text("₹ 0")
                      ],
                    )
                  ]),
                  TableRow(children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text("Total"),
                        ),
                        Text("₹ ${cartController.totalPrice.toStringAsFixed(2)}")
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
                  ApiClient().placeOrder();

            }, child: const Text("Proceed")),

          ],
        ):const Center(child: Text("No Data Found"),),
      )),
    );
  }
}
