import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/customWidgets/dashboard_slider/view/dashboard_slider.dart';
import '../../../Core/dasboardSlideshow.dart';
import '../../../controllers/category_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../customwidgets/home_product_grid_list_with_title.dart';
import '../../customwidgets/similar_product_grid_list_with_title.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.find();

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
                  Dashboard_Slider("GS"),

                  SizedBox(
                    height: 54,
                    child: Obx(

                      () {
                        final categories=categoryController.groceryCatList;


                        return ListView.builder(
                          itemCount: categories.length,
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
                                      categories[index].title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  HomeProductGridList("OUR PRODUCTS","GS"),
                  SizedBox(
                    height: 16,
                  ),

                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
