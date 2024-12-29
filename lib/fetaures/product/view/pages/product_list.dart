import 'package:devmaters_delivery/Core/constant.dart';
import 'package:devmaters_delivery/Views/pages/product/product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../controllers/product_controller.dart';
import '../../../fetaures/category/model/category.dart';
import '../../../models/product.dart';

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
                      child: Card(
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 190,
                              padding: EdgeInsets.all(8.00),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                              ),
                              alignment: const Alignment(0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: product.image!.isNotEmpty
                                        ? "${ConstantData.baseurl}/storage/${product.image}"
                                        : "https://via.placeholder.com/100", // Placeholder if no image
                                    height: 100,
                                    width: double.maxFinite,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    product.productName!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "₹ ${product.attributes!.isNotEmpty ? product.attributes![0].price : "0.00"}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "${product.attributes!.isNotEmpty ? product.attributes![0].title : ""}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),

                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 24,
                                width: 80,
                                margin: EdgeInsets.only(top: 8.0),
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5))),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "${product.averageRating}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
