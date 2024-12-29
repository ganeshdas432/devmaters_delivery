import 'package:devmaters_delivery/Core/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import '../../category/model/category.dart';

class CategoryController extends GetxController {
  // Observable lists for food and grocery categories
  var foodCatList = <Category>[].obs;
  var groceryCatList = <Category>[].obs;
  var isLoading = true.obs;  // To handle loading state
  var errorMessage = ''.obs;  // To handle errors
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Function to fetch and filter categories based on shop_type
  Future<void> fetchCategories() async {
    isLoading.value = true;  // Show loading indicator
    errorMessage.value = '';  // Clear previous errors
    try {
      // Make the HTTP GET request
      final response = await http.get(Uri.parse('${ConstantData.baseurl}api/catlist'),
        headers: {
        'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Decode the JSON response
        var jsonData = jsonDecode(response.body);

        // Parse the categories and filter them based on shop_type
        List<Category> categories = (jsonData['categories'] as List)
            .map((data) => Category.fromJson(data))
            .toList();

        // Separate categories into food and grocery lists
        foodCatList.value = categories.where((category) => category.shopType == 'FS').toList();
        groceryCatList.value = categories.where((category) => category.shopType == 'GS').toList();
      } else {
        // Handle the case when the server responds with an error
        errorMessage.value = 'Failed to load categories: ${response.statusCode}';
      }
    } catch (error) {
      // Handle the error if the request fails
      errorMessage.value = 'Failed to load categories: $error';
    } finally {
      isLoading.value = false;  // Hide loading indicator
    }
  }
}
