import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:devmaters_delivery/Core/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/slider_controller.dart';

class DashboardSlider extends StatefulWidget {
  String shoptype;
  DashboardSlider(this.shoptype);

  @override
  State<DashboardSlider> createState() => _DashboardSliderState();
}

class _DashboardSliderState extends State<DashboardSlider> {
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
        items: widget.shoptype=="FS"?_sliderController.fs.map((slide) {
          print("test"+ConstantData.baseurl+'storage'+slide['url']);
          return Builder(
            builder: (BuildContext context) {

              return GestureDetector(
                onTap: () {

                },
                child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: CachedNetworkImage(
                      imageUrl: ConstantData.baseurl+'storage/'+slide['url'],
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
        }).toList():_sliderController.gs.map((slide) {
          print("test"+ConstantData.baseurl+'storage'+slide['url']);
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {

                },
                child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: CachedNetworkImage(
                      imageUrl: ConstantData.baseurl+'storage/'+slide['url'],
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
