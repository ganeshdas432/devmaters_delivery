import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../pages/product/product_list.dart';
import '../pages/product/product_view.dart';

Column ProductGridList(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 32, bottom: 16),
        child: Row(
          children: [
            Icon(Icons.list_alt),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            IconButton(
                color: Colors.white,
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green)),
                onPressed: () {
                  Get.to(ProductList(title));
                },
                icon: Icon(Icons.chevron_right))
          ],
        ),
      ),
      ResponsiveGridList(
          desiredItemWidth: 150,
          minSpacing: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(6, (index) => index + 1).map((i) {
            return GestureDetector(
              onTap: () {
                Get.to(ProductView(),transition: Transition.noTransition);
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      alignment: Alignment(0, 0),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                            "https://img.freepik.com/premium-photo/chicken-biryani-kerala-style-chicken-dhum-biriyani-made-using-jeera-rice-spices-arranged_667286-4606.jpg",
                            height: 100,
                            width: 100,
                          ),
                          Text("Biriyani " + i.toString()),
                          Text(
                            "₹ 150.00",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 24,
                        width: 50,
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
                                "4.5",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList()),
    ],
  );
}