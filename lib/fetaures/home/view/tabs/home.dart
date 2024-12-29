import 'package:devmaters_delivery/fetaures/food/view/page/food_page.dart';
import 'package:devmaters_delivery/fetaures/grocery/view/page/grocery_page.dart';
import 'package:devmaters_delivery/fetaures/home/controllers/my_location_picker_controller.dart';
import 'package:devmaters_delivery/fetaures/porter/view/page/porter_page.dart';
import 'package:devmaters_delivery/fetaures/orders/controller/cart_Controller.dart';
import 'package:devmaters_delivery/fetaures/ride/view/page/book_ride.dart';
import 'package:devmaters_delivery/fetaures/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pages = [
    const FoodPage(),
    const GroceryPage(),
    const BookRide(),
    const PorterPage(),
  ];
  List<String> homeTabs = [
    'Food',
    'Grocery',
    'Book Ride',
    'Porter',
  ];
  final HomeController homeController = Get.find<HomeController>(tag: "Home Controller");
  final CartController cartController = Get.put(CartController());
  final MyLocationPickerController myLocationPickerController = Get.find();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.green[600],
      body: Column(
        children: [
          const SizedBox(height: 8,),
          SizedBox(
            width: double.maxFinite,
            height: 36,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 8,),
                const Icon(
                  Icons.location_on_rounded,
                  size: 28,
                  color: Colors.white,
                ),
                Expanded(
                  child: Obx(
                    () => myLocationPickerController.pickupaddress == ""
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(() => Text(
                                "${myLocationPickerController.pickupaddress}",
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                                overflow: TextOverflow.ellipsis)),
                          ),
                  ),
                ),
                const SizedBox(width: 8,),
              ],
            ),
          ),
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
            child: Obx(
              () {
                return pages[homeController.current_home_tab_index.value];
              },
            ),
          ),
        ],
      ),
    );
  }
}
