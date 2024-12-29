import 'package:devmaters_delivery/controllers/product_controller.dart';
import 'package:devmaters_delivery/fetaures/ride/view/page/book_ride.dart';
import 'package:devmaters_delivery/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../customwidgets/home_product_grid_list_with_title.dart';


class ShopDetailView extends StatefulWidget {
  Shop shop;
   ShopDetailView(this. shop, {super.key});

  @override
  State<ShopDetailView> createState() => _ShopDetailViewState();
}

class _ShopDetailViewState extends State<ShopDetailView> {
  final ProductController productController=Get.find();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.getshopProducts(widget.shop.id!);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
        
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.network("https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg",height: 200,width: double.maxFinite,fit: BoxFit.cover)),
        
        
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8), // Border width
                      decoration: BoxDecoration(
                        color: Colors.white, // Border color
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 80,
                        backgroundImage: NetworkImage("${widget.shop.image}"),
                      ),
                    ),
                  )
        
        
        
        
                ],
              ),
            ),
            Center(child: "${widget.shop.shopName}".text.headlineLarge(context).make()),
            Center(child: "${widget.shop.address}".text.lg.make()),
            Center(child: "${widget.shop.mobile}".text.lg.make()),
        
            SizedBox(height: 16,),
            Divider(),
            SizedBox(height: 16,),
        
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: "Featured products".text.xl2.bold.make(),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection:Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
        
                return Container(
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    ClipRRect(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network("https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg",
                          height: 120,width: double.maxFinite,fit: BoxFit.cover),
                    ) ,
                    SizedBox(height: 8,),
                    "Product Name Is Here".text.bold.lg.make(),
                      "100.00".text.make(),
        
                  ],),
                );
              },),
            ),
        
            HomeProductGridList("PRODUCTS","LS"),
        
        
        
          ],
        ),
      ),
    );
  }
}
