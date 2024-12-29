import 'package:cached_network_image/cached_network_image.dart';
import 'package:devmaters_delivery/fetaures/product/controllers/product_controller.dart';
import 'package:devmaters_delivery/fetaures/product/view/widget/product_grid_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../Core/constant.dart';
import '../pages/product_list.dart';
import '../pages/product_view.dart';

Column SimilarProductGridList(String title) {
  ProductController productController = Get.find();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 32, bottom: 16),
        child: Row(
          children: [
            const Icon(Icons.list_alt),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            IconButton(
                color: Colors.white,
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green)),
                onPressed: () {
                  Get.to(ProductListScreen());
                },
                icon: const Icon(Icons.chevron_right))
          ],
        ),
      ),
      Obx(() {
        return ResponsiveGridList(
            desiredItemWidth: 150,
            minSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: productController.filteredProducts.value.map((product) {
              return GestureDetector(
                onTap: () {
                  Get.to(ProductView(product: product),
                      transition: Transition.noTransition);
                },
                child: ProductGridListCard(product),
              );
            }).toList());
      }),
    ],
  );
}
