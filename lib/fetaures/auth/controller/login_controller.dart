import 'dart:convert';

import 'package:devmaters_delivery/fetaures/home/view/page/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';

import '../../../Core/constant.dart';

class LoginController extends GetxController{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var token = ''.obs;
  final storage = GetStorage();



// Method to perform login
  Future<void> website_login(String email, String password) async {
    isLoading(true);  // Show loading spinner

    try {
      final response = await http.post(
        Uri.parse('${ConstantData.baseurl}api/login'),  // Replace with your actual API URL
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        storage.write('token', responseData['token']);  // Store token
        storage.write('user', responseData['user']);  // Store token


        isLoggedIn(true);
        Get.snackbar('Success', 'Login successful');
        Get.to(Homepage());
      } else {
        Get.snackbar('Error', 'Invalid email or password');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);  // Hide loading spinner
    }
  }

  Future<void> fetchUserData() async {
    final token = storage.read('token');
    final response = await http.get(
      Uri.parse('${ConstantData.baseurl}api/user'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Handle successful response
    } else {
      // Handle error
    }
  }

  String? getToken() {
    return storage.read('token');
  }


}