import 'package:flutter/material.dart';

import '../../Core/constant.dart';
import '../../models/shop.dart';

class ShopCard extends StatelessWidget {
  final Shop shop;

  ShopCard({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      margin: const EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Shop image
          ClipOval(
            child: Image.network(
              shop.image!,
              height: 100,
              width: 100,  // Make sure width and height are the same for a perfect circle
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              shop.shopName!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}