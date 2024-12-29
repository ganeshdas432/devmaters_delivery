import 'package:bottom_bar/bottom_bar.dart';
import 'package:devmaters_delivery/fetaures/auth/controller/user_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../controllers/category_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../../controllers/product_controller.dart';
import 'cart.dart';
import 'home.dart';
import 'profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final storage = GetStorage();  // To access local storage
  final homeController=Get.put(HomeController(),permanent: true);
  final CategoryController categoryController = Get.put(CategoryController(),permanent: true);
  final ProductController productController = Get.put(ProductController(),permanent: true);
  final UserDetailController userDetailController =Get.put(UserDetailController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    userDetailController.fetchUserDetail();

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
      body: Obx(() => pages[homeController.current_bootom_nav_index.value]),
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
