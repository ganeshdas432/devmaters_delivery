import 'package:cached_network_image/cached_network_image.dart';
import 'package:devmaters_delivery/Views/pages/food/food_page.dart';
import 'package:devmaters_delivery/Views/pages/grocery/grocery_page.dart';
import 'package:devmaters_delivery/Views/pages/porter/porter_page.dart';
import 'package:devmaters_delivery/Views/pages/product/product_view.dart';
import 'package:devmaters_delivery/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../Core/dasboardSlideshow.dart';
import '../../customwidgets/product_grid_list_with_title.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var pages=[FoodPage(),GroceryPage(),PorterPage()];
    List<String> homeTabs = [
      'Food',
      'Grocery',
      'Porter'
    ];
    var homeController = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Column(
        children: [
          SizedBox(
            height: 48,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: homeTabs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    homeController.changeHomeTabIndex(index);
                  },
                  child: Obx(
                        () => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          color: homeController.current_home_tab_index == index
                              ? Colors.white
                              : null,
                        ),
                        child: Center(
                            child: Text(
                              homeTabs[index],
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color:
                                  homeController.current_home_tab_index == index
                                      ? Colors.green
                                      : Colors.white54,
                                  fontFamily: "Poppins"),
                            ))),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Obx(() {
            
              return pages[homeController.current_home_tab_index.value];
            },),
          ),
        ],
      ),
    );
  }


}
