import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<String>status=['Order Placed','Picked Up','Out For Deliver','Delivered'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Order Details"),),

      body: Column(
        children: [

          const Card(
            elevation: 5,
            margin: EdgeInsets.all(8.00),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
              children: [
                Text("Order Details"),
                Divider(),
                Row(children: [
                  Text("Order Id"),
                  Spacer(),
                  Text("2514525")

                ],),
                Row(children: [
                  Text("Order Placed"),
                  Spacer(),
                  Text("01/08/2024")

                ],),
                Row(children: [
                  Text("Order Price"),
                  Spacer(),
                  Text("1024")

                ],),
              ],
                        ),
            ),),

          Card(
            elevation: 5,
            margin: const EdgeInsets.all(8.00),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text("Order Items"),
                  const Divider(),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {


                    return ListTile(
                      leading:  CachedNetworkImage(
                        imageUrl:
                        "https://img.freepik.com/premium-photo/chicken-biryani-kerala-style-chicken-dhum-biriyani-made-using-jeera-rice-spices-arranged_667286-4606.jpg",
                        height: 72,
                        width: 72,
                      ),
                      title: const Text("Product Name"),
                      subtitle: const Text("100.00*2"),
                      trailing: const Text("200.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    );
                  },)
                ],
              ),
            ),),


          const Card(
            elevation: 5,
            margin: EdgeInsets.all(8.00),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Payment Details"),
                  Divider(),
                  Row(children: [
                    Text("200.00"),
                    Spacer(),
                    Text("COD"),
                    Spacer(),
                    Text("Due")

                  ],)
                ],
              ),
            ),),

          Card(
            elevation: 5,
            margin: const EdgeInsets.all(8.00),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Delivery Status"),
                  const Divider(),
                 SizedBox(height: 40,child:
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: status.map((item) => Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Text(item,style: const TextStyle(fontSize: 12),),
                       const SizedBox(height: 8.00,),
                       const SizedBox(
                         width: 50,
                         child: StepProgressIndicator(
                           totalSteps: 1,
                           currentStep: 1,
                           selectedColor: Colors.green,
                           unselectedColor: Colors.grey,
                         ),
                       ),
                     ],
                   )).toList(),
                 ),
                 ),
                ],
              ),
            ),),

        ],
      ),
    );
  }
}
