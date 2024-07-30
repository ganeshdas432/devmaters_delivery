import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Cart",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
         Expanded(child: ListView.builder(
           itemCount: 3,
           itemBuilder: (context, index) {
           return Row(
             children: [
               Card(elevation: 15,
               margin: EdgeInsets.all(16),
               child: CachedNetworkImage(imageUrl: "https://img.freepik.com/premium-photo/chicken-biryani-kerala-style-chicken-dhum-biriyani-made-using-jeera-rice-spices-arranged_667286-4606.jpg",height: 100,width: 100,),),
               Expanded(child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("PRODUCT NAME IS HERE"),
                   Text("category name",style: TextStyle(color: Colors.black54),),
                   Row(children: [
                     Text("₹ 100",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
                     Spacer(),
                     IconButton(onPressed: () {

                     }, icon: Icon(Icons.remove)),
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: 10),
                         decoration: BoxDecoration(
                           border: Border.all(
                             width: 0.2
                           )
                         ),
                         child: Text("1")),
                     IconButton(onPressed: () {

                     }, icon: Icon(Icons.add))
                   ],)
                 ],
               )),
               
             ],
           );
         },)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
            child: Table(
              children: [
                TableRow(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Subtotal"),
                      ),
                      Text("₹ 300")
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
          )

        ],
      )),
    );
  }
}
