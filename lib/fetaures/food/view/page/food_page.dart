import 'package:devmaters_delivery/fetaures/product/view/pages/category_product_list_view.dart';
import 'package:devmaters_delivery/fetaures/product/view/pages/search_product_list_view.dart';
import 'package:devmaters_delivery/fetaures/shop/view/pages/shop_detail_view.dart';
import 'package:devmaters_delivery/fetaures/product/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../Core/customWidgets/dashboard_slider/view/dashboard_slider.dart';
import '../../../product/controllers/category_controller.dart';
import '../../../shop/controllers/shop_controller.dart';
import '../../../product/view/widget/home_product_grid_list_with_title.dart';
import '../../../shop/view/widget/shop_cart.dart';


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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(SearchProductListView("Product List"));
                          },
                          child: const Card(
                            child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Icon(Icons.search),
                                 SizedBox(width: 10,),
                                 Text("Search..."),
                              ],

                            ),
                          ),),
                        ),
                      ),
                      DashboardSlider("FS"),
                      const SizedBox(height: 16,),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Categories",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        height: 100,
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
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    margin: const EdgeInsets.symmetric(horizontal: 16),
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          child: categories[index].image != null && categories[index].image!.isNotEmpty
                                              ? Image.network(
                                            categories[index].image!,
                                            width: double.infinity,
                                            height: 75,
                                            fit: BoxFit.cover, // Ensures the image fits properly within the dimensions
                                            errorBuilder: (context, error, stackTrace) {
                                              // Handle error loading the image
                                              return Container(
                                                width: double.infinity,
                                                height: 75,
                                                color: Colors.grey[300], // Placeholder background color
                                                child: const Icon(Icons.image, color: Colors.grey), // Placeholder icon
                                              );
                                            },
                                          )
                                              : Container(
                                            width: double.infinity,
                                            height: 75,
                                            color: Colors.grey[300], // Placeholder background color
                                            child: const Icon(Icons.broken_image, color: Colors.grey), // Placeholder icon for missing image
                                          ),
                                        ),

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
                                );
                              },
                            );
                          }

                        ),
                      ),
                      const SizedBox(height: 16,),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Shop List",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
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
                      HomeProductGridList("PRODUCTS","FS"),
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
