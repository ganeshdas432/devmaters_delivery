import 'dart:async';

import 'package:devmaters_delivery/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class SplashScreen extends  StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer( const Duration (seconds: 5),()
    {
        Get.off(LoginPage(),transition: Transition.noTransition);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(

         height: double.maxFinite,
         width: double.maxFinite,
         decoration: const BoxDecoration(
           color: Colors.white,
             image: DecorationImage(
         image:AssetImage('assets/res/22.png'),
           fit: BoxFit.fitWidth

       )
         ),

         child: Align(alignment: Alignment.bottomCenter,child: LoadingAnimationWidget.prograssiveDots(
           color: Colors.black26,
           size: 48,
         ),),


       ),

    );
  }
}

