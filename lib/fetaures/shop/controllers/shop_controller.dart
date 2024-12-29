import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';

import '../models/shop.dart';

class ShopController extends GetxController {
  var shopList = <Shop>[].obs;
  var fshopList = <Shop>[].obs;
  var gshopList = <Shop>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchShops();

  }

  void fetchShops() async {
    final response = await http.get(Uri.parse('https://drive.elayd.com/api/shoplist'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      var shops = data['shops'] as List;
      shopList.value = shops.map((shop) => Shop.fromJson(shop)).toList();

      fshopList.assignAll(
        shopList.where((p) => p.shopType =="FS").toList(),
      );

      gshopList.assignAll(
        shopList.where((p) => p.shopType =="GS").toList(),
      );
    } else {
      Get.snackbar("Error", "Failed to fetch shop data");
    }
    isLoading.value = false;
  }
}