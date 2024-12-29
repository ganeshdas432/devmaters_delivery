import 'package:cached_network_image/cached_network_image.dart';
import 'package:devmaters_delivery/Core/constant.dart';
import 'package:devmaters_delivery/fetaures/product/model/product.dart';
import 'package:flutter/material.dart';

Card ProductGridListCard(Product product) {
  return Card(
    elevation: 5,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Stack(
      children: [
        Container(
          height: 190,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(10)),
          ),
          alignment: const Alignment(0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: product.image!.isNotEmpty
                      ? "${ConstantData.baseurl}storage/${product.image}"
                      : "https://via.placeholder.com/100", // Placeholder if no image
                  height: 100,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  product.productName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "₹ ${product.attributes!.isNotEmpty ? product.attributes![0].price : "0.00"}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${product.attributes!.isNotEmpty ? product.attributes![0].title : ""}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600),
                ),
              ),

            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 24,
            width: 80,
            margin: const EdgeInsets.only(top: 8.0),
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
                    "${product.averageRating!=null?product.averageRating:0.0}",
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
  );
}
