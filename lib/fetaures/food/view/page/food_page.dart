import 'package:cached_network_image/cached_network_image.dart';
import 'package:devmaters_delivery/Views/pages/product/category_product_list_view.dart';
import 'package:devmaters_delivery/Views/pages/shop/shop_detail_view.dart';
import 'package:devmaters_delivery/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Core/customWidgets/dashboard_slider/view/dashboard_slider.dart';
import '../../../Core/dasboardSlideshow.dart';
import '../../../controllers/category_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../../controllers/shop_controller.dart';
import '../../customwidgets/home_product_grid_list_with_title.dart';
import '../../customwidgets/similar_product_grid_list_with_title.dart';
import '../../widgets/shop_cart.dart';
import '../product/product_list.dart';


class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  final CategoryController categoryController = Get.find();
  final ProductController productController=Get.find();
  final ShopController shopController = Get.put(ShopController());


  @override
  void initState() {
    shopController.fetchShops();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {


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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                        child: Row(
                          children: [
                            const Expanded(
                              child: SizedBox(
                                height: 48,
                                child: SearchBar(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                                  ),
                                  padding: WidgetStatePropertyAll(EdgeInsets.only(left: 12)),
                                  surfaceTintColor: WidgetStatePropertyAll(Colors.white),
                                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                                  hintText:"Search Food Here...",
                                  elevation:WidgetStatePropertyAll(10),
                                  leading: Icon(FontAwesomeIcons.magnifyingGlass),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8,),
                            IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.green[50],
                                  fixedSize: const Size(48, 48),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  )
                                ),
                                onPressed: () {
                              
                            }, icon: const Icon(FontAwesomeIcons.arrowDownWideShort))
                          ],
                        ),
                      ),
                      Dashboard_Slider("FS"),
                      SizedBox(
                        height: 54,
                        child: Obx(
                          () {

                            final categories=categoryController.foodCatList;

                            return  ListView.builder(
                              itemCount: categories.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    productController.filterByCategory(categories[index]);
                                    Get.to(CategoryProductListView(category: categories[index]));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 8.0),
                                    child: Container(
                                      width: 150,
                                      height: 48,
                                      margin: const EdgeInsets.symmetric(horizontal: 8),
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Icon(Icons.emoji_food_beverage_rounded),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            categories[index].title!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }

                        ),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        height: 160,
                        child: Obx(() {
                          if (shopController.isLoading.value) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: shopController.fshopList.length,
                              itemBuilder: (context, index) {
                                final shop = shopController.fshopList[index];
                                return GestureDetector(
                                    onTap: () {
                                      Get.to(ShopDetailView(shop));
                                    },
                                    child: ShopCard(shop: shop));
                              },
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 16,),
                      HomeProductGridList("OUR PRODUCTS","FS"),
                      const SizedBox(height: 16,),

                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
