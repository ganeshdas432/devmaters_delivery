import 'dart:convert';
import 'package:devmaters_delivery/Core/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SliderController extends GetxController {
  RxList fs = [].obs;
  RxList gs = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSlides();
    updateSlides();
  }

  Future<void> fetchSlides() async {
    // Fetch data from the API
    await _fetchSlidesFromApi();
  }

  Future<void> _fetchSlidesFromApi() async {
    try {

      // Use the custom client for the request
      final response = await http.get(Uri.parse('${ConstantData.baseurl}api/slider_images'));

      if (response.statusCode == 200) {
        // Parse the response body
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Extract the "sliders" list from the JSON object
        List<dynamic> sliders = jsonResponse['sliders'];

        // Filter the data to include only items where shop_type is 'FS'
        List<Map<String, dynamic>> fsd = sliders
            .where((item) => item['shop_type'] == 'FS')
            .cast<Map<String, dynamic>>()
            .toList();

        // Filter the data to include only items where shop_type is 'GS'
        List<Map<String, dynamic>> gsd = sliders
            .where((item) => item['shop_type'] == 'GS')
            .cast<Map<String, dynamic>>()
            .toList();

        // Update the RxList with the filtered list
        fs.value = fsd;
        gs.value = gsd;

        print("API response: " + sliders.toString());
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
