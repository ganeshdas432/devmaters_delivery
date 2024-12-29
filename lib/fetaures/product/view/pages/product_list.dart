import 'package:devmaters_delivery/Core/constant.dart';
import 'package:devmaters_delivery/fetaures/product/view/pages/product_view.dart';
import 'package:devmaters_delivery/fetaures/product/view/widget/product_grid_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../controllers/product_controller.dart';

class ProductListScreen extends StatefulWidget {

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}


class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController controller = Get.find();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Category filter dropdown

          // Display products in a grid
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.filteredProducts.isEmpty) {
                return const Center(child: Text("No products found"));
              }

              return Container(
                padding: const EdgeInsets.all(10),
                child: ResponsiveGridList(
                  desiredItemWidth: 150,
                  minSpacing: 10,
                  shrinkWrap: true,
                  children: controller.filteredProducts.map((product) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(ProductView(product: product),
                            transition: Transition.noTransition);
                      },
                      child: ProductGridListCard(product),
                    );
                  }).toList(),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
