import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/dasboardSlideshow.dart';
import '../../../controllers/home_controller.dart';
import '../../customwidgets/product_grid_list_with_title.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Fruits',
      'Vegetables',
      'Beverages',
      'Kitchen',
      'Beauty Products'
    ];
    var homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Dashboard_Slideshow(
                      "https://img.freepik.com/free-vector/hand-drawn-grocery-store-sale-banner_23-2151043935.jpg",
                      "https://i.pinimg.com/236x/68/e6/2f/68e62fb46761aaa17ae65730e893abba.jpg",
                      "https://st3.depositphotos.com/2885805/31882/v/1600/depositphotos_318821020-stock-illustration-sale-in-supermarket-banner.jpg"),
                  SizedBox(
                    height: 54,
                    child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          child: Container(
                            height: 48,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.emoji_food_beverage_rounded),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  categories[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ProductGridList("You May Like"),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                "https://img.freepik.com/free-vector/flat-horizontal-sale-banner-template-world-vegetarian-day-celebration_23-2150746551.jpg",
                              )),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  ProductGridList("Best Selling")
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
