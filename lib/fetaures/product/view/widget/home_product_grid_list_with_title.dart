import 'package:cached_network_image/cached_network_image.dart';
import 'package:devmaters_delivery/fetaures/product/controllers/product_controller.dart';
import 'package:devmaters_delivery/fetaures/product/model/product.dart';
import 'package:devmaters_delivery/fetaures/product/view/widget/product_grid_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../Core/constant.dart';
import '../pages/product_list.dart';
import '../pages/product_view.dart';

Column HomeProductGridList(String title, String shoptype) {
  ProductController productController = Get.find();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 4, bottom: 16,right: 8.0),
        child: Row(
          children: [
            const Icon(Icons.list_alt),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
        if(shoptype=="FS"){
           return ResponsiveGridList(
              desiredItemWidth: 150,
              minSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: productController.foodProducts.value.map((product) {
                return GestureDetector(
                  onTap: () {
                    Get.to(ProductView(product: product),
                        transition: Transition.noTransition);
                  },
                  child: ProductGridListCard(product),
                );
              }).toList());
        }else if(shoptype=="LS"){
          return ResponsiveGridList(
              desiredItemWidth: 150,
              minSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: productController.shopListProducts.value.map((product) {
                return GestureDetector(
                  onTap: () {
                    Get.to(ProductView(product: product),
                        transition: Transition.noTransition);
                  },
                  child: ProductGridListCard(product),
                );
              }).toList());
        }else{

          return ResponsiveGridList(
              desiredItemWidth: 150,
              minSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: productController.groceryProducts.value.map((product) {
                return GestureDetector(
                  onTap: () {
                    Get.to(ProductView(product: product),
                        transition: Transition.noTransition);
                  },
                  child: ProductGridListCard(product),
                );
              }).toList());
        }

      }),
    ],
  );
}

