import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Dashboard_Slideshow extends StatelessWidget {
  String image1,image2,image3;
   Dashboard_Slideshow(this.image1,this.image2,this.image3, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(

        items: [

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                    imageUrl: image1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                    imageUrl: image2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child:CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                    imageUrl:image3),
              ),
            ),
          ),
        ], options: CarouselOptions(
      height: 200,
      aspectRatio: 16/9,
      viewportFraction: 1.0,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    ),
        );
  }
}
