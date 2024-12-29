import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../features/product/view/screen/productListView.dart';
import '../controller/slider_controller.dart';

class Dashboard_Slider extends StatefulWidget {
  @override
  State<Dashboard_Slider> createState() => _Dashboard_SliderState();
}

class _Dashboard_SliderState extends State<Dashboard_Slider> {
  final SliderController _sliderController = Get.put(SliderController());

  @override
  void initState() {
    super.initState();
    _sliderController.fetchSlides(); // Fetch slides when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CarouselSlider(
        items: _sliderController.slides.map((slide) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Get.to(ProductListView(),arguments: [slide['id'].toString(),'col',slide['title']]);

                },
                child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: CachedNetworkImage(
                      imageUrl: slide['image'],
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.maxFinite,
                      placeholder: (context, url) {
                        return Center(child:Text("Loading..."));
                      },
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      );
    });
  }
}
