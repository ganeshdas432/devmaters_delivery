import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../auth/controller/auth_controller.dart';

class AuthWrapper extends StatelessWidget {

  final AuthController authController=Get.put(AuthController());



  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      authController.checkLoginStatus();
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),  // Optional: Display loading while checking
      ),
    );
  }
}