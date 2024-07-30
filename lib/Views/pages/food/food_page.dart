import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/dasboardSlideshow.dart';
import '../../../controllers/home_controller.dart';
import '../../customwidgets/product_grid_list_with_title.dart';


class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> categories = [
      'Biriyani',
      'Pitza',
      'Burger',
      'Eggroll',
      'Chikenroll'
    ];

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
                      Dashboard_Slideshow(
                         "https://static.vecteezy.com/system/resources/previews/007/296/872/non_2x/online-delivery-food-by-scooter-website-on-a-mobile-food-order-concept-web-banner-free-vector.jpg",
                          "https://usmsystems.com/wp-content/uploads/2022/10/Cost-To-Develop-A-Food-Delivery-App-Like-EatClub.png",
                          "https://i.pinimg.com/originals/7e/07/54/7e075483a8b06caa3b84a5fee7edaeae.jpg"
                      ),
                      SizedBox(
                        height: 54,
                        child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              child: Container(
                                width: 150,
                                height: 48,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(Icons.emoji_food_beverage_rounded),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      categories[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ProductGridList("You May Like"),
                      SizedBox(height: 16,),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider("https://img.freepik.com/premium-vector/50-percent-off-discount-creative-composition-summer-sale-banner-with-watermelon-sale-banner-poster_3482-7242.jpg",)),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),

                        ),
                      ),
                      ProductGridList("Best Selling")
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
