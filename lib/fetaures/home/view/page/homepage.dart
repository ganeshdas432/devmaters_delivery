import 'package:bottom_bar/bottom_bar.dart';
import 'package:devmaters_delivery/fetaures/orders/view/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import '../../../product/controllers/category_controller.dart';
import '../../controllers/home_controller.dart';
import '../../../product/controllers/product_controller.dart';
import '../../controllers/my_location_picker_controller.dart';
import '../tabs/cart.dart';
import '../tabs/home.dart';
import '../tabs/profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final storage = GetStorage();  // To access local storage
  final HomeController homeController = Get.find<HomeController>(tag: "Home Controller");
  final CategoryController categoryController = Get.put(CategoryController(),permanent: true);
  final ProductController productController = Get.put(ProductController(),permanent: true);
  final MyLocationPickerController myLocationPickerController=Get.put(MyLocationPickerController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {


    final pages=[const Home(), const Cart(),const Profile()];




    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 72,
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Image.asset("assets/res/logo_rectangular.png",height: 48,),
        ),
        actions: const [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: Obx(() => Column(
        children: [
          Expanded(child: pages[homeController.current_bootom_nav_index.value]),
          Obx(
            () {
              var ordercount=homeController.orderProcessing;
              return Visibility(
                visible: ordercount>0?true:false,
                child: GestureDetector(
                  onTap: () {
                    Get.to(OrderScreen());
                  },
                  child: Container(height:70 ,
                    padding: EdgeInsets.only(top: 8),
                    child: Column(
                      children: [
                        Lottie.asset("assets/res/delivery.json"),
                        Text("Your $ordercount is processing...")
                      ],
                    ),),
                ),
              );
            }

          )
        ],
      )),
      bottomNavigationBar: Obx(
            () {
          print(homeController.current_bootom_nav_index.value);
          return BottomBar(
            selectedIndex: homeController.current_bootom_nav_index.value,
            onTap: (int index) {
              homeController.changeBottomNavIndex(index.toInt());
            },
            items: const <BottomBarItem>[
              BottomBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Colors.green

              ),
              BottomBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text('Cart'),
                activeColor: Colors.green,
              ),

              BottomBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
                activeColor: Colors.green,
              ),
            ],
          );

        },
      ),
    );
  }
}
