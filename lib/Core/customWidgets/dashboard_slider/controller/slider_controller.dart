import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class SliderController extends GetxController {
  RxList slides = [].obs;
  static const String slidesCacheKey = "cachedSlidesData";

  @override
  void onInit() {
    super.onInit();
    fetchSlides();
    updateSlides();
  }

  Future<void> fetchSlides() async {
    // Check if data is already cached

      await _fetchSlidesFromApi();

  }

  Future<void> _fetchSlidesFromApi() async {
    try {
      final response = await http.get(Uri.parse('https://elayd.com/api/product_collection'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        // Filter the data to include only items where type is 'banner'
        List<Map<String, dynamic>> bannerSlides = data
            .where((item) => item['type'] == 'banner')
            .cast<Map<String, dynamic>>()
            .toList();

        // Update the slides value with the filtered list
        slides.value = bannerSlides;
      } else {
        throw Exception('Failed to load slides');
      }
    } catch (e) {
      print('Error: $e');
    }
  }



  void updateSlides() async {
    await _fetchSlidesFromApi();
  }
}
