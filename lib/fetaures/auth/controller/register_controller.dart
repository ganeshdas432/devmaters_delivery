import 'dart:convert';

import 'package:devmaters_delivery/Core/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart'as http;
class RegistrationController extends GetxController {
  var isLoading = false.obs;
  final storage = GetStorage();

  Future<void> register(String name, String email, String password, String confirmPassword,int mobile,int age, int status,String gender) async {
    isLoading(true);

    try {
      final response = await http.post(
        Uri.parse('${ConstantData.baseurl}api/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
          'age':age,
          'gender':gender,
          'mobile':mobile,
          'status':status
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        storage.write('token', responseData['token']);  // Store token
        storage.write('user', responseData['user']);  // Store token
        Get.snackbar('Success', 'User registered successfully');
      } else if (response.statusCode == 422) {
        final errors = json.decode(response.body);
        Get.snackbar('Error', errors.toString());
        print(errors.toString());
      } else {
        Get.snackbar('Error', 'Failed to register user');
        print(response.body.toString());
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      print(e.toString());

    } finally {
      isLoading(false);
    }
  }
}
