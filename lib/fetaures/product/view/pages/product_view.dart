import 'package:cached_network_image/cached_network_image.dart';
import 'package:devmaters_delivery/controllers/cart_Controller.dart';
import 'package:devmaters_delivery/fetaures/ride/view/page/book_ride.dart';
import 'package:devmaters_delivery/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/constant.dart';
import '../../../models/cart_model.dart';
import '../../customwidgets/similar_product_grid_list_with_title.dart';

class ProductView extends StatefulWidget {
   Product product;
   ProductView({super.key, required this. product});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final CartController cartController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          "${widget.product.productName}",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: SizedBox(),
        titleSpacing: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                          "${ConstantData.baseurl}/storage/${widget.product.image}"
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 32,
                            width: 72,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "${widget.product.averageRating}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 32,
                            width: 72,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.alarm,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "${widget.product.time} min",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.star)),
                              Text("${widget.product.averageRating} Ratings")
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Details",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                          "${widget.product.description}"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Sold By",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("${widget.product.shop!.shopName}"),
                    ),
                    SimilarProductGridList("Similar Products")
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                "${widget.product.attributes!.first.price}",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              subtitle: Text("Price"),
              trailing:ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
                  onPressed: () {
                    cartController.addProductToCart(
                      CartItem(
                        productId: widget.product.id,
                        shopId: widget.product.shopId,
                        productName: widget.product.productName,
                        price: double.parse(widget.product.attributes!.first.price.toString()),
                        quantity: 1,
                        productImage: widget.product.image,
                      ),
                    );

              }, child: SizedBox(
                height: 40,
                width: 120,
                child: Row(children: [
                  Icon(Icons.add_shopping_cart,color: Colors.white,),
                  SizedBox(width: 8,),
                  Text("Add To Cart",style: TextStyle(color: Colors.white),)
                    ],),
              )))
          ],
        ),
      ),
    );
  }
}