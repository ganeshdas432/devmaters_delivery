import 'package:devmaters_delivery/fetaures/home/view/page/homepage.dart';
import 'package:devmaters_delivery/fetaures/auth/view/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AuthController extends GetxController {
  final storage = GetStorage();  // To access local storage


  // Method to handle logout
  Future<void> logout() async {
    storage.remove('token');
    storage.remove('user');
    Get.offAll(LoginPage());
  }

  void checkLoginStatus() {
    final token = storage.read('token');

    if (token != null) {

      Get.offAll(Homepage());
    } else {
      // If no token, navigate to login page
      Get.to(LoginPage());
    }
  }





}
