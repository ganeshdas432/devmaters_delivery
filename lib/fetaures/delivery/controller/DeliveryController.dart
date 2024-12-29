import 'package:devmaters_delivery/Core/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/Delivery.dart';

class DeliveryController extends GetxController {
  var isLoading = false.obs;
  var deliveries = <Delivery>[].obs;

  var foodDelivery = <Delivery>[].obs;
  var groceryDelivery = <Delivery>[].obs;
  var rideDelivery = <Delivery>[].obs;
  var porterDelivery = <Delivery>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchDeliveries();
  }


  // Method to submit delivery data to the API
  Future<void> submitDelivery(Delivery delivery) async {
    isLoading(true);  // Show loading spinner

    print(json.encode(delivery.toJson()));
    try {
      final response = await http.post(
        Uri.parse('${ConstantData.baseurl}api/deliveries'),  // Replace with your actual API URL
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(delivery.toJson()),
      );

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Delivery created successfully ');
      } else {
        print('Failed to create delivery: ${response.body} ${response.statusCode}');
        print('Headers: ${response.headers}'); // Log headers for additional context
        Get.snackbar('Error', 'Failed to create delivery: ${response.body} ${response.statusCode}');

      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);  // Hide loading spinner
    }
  }

  void fetchDeliveries() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('${ConstantData.baseurl}api/deliveries_by_cid/2'));
      if (response.statusCode == 200) {
        List data = json.decode(response.body)['deliveries'];
        deliveries.value = data.map((json) => Delivery.fromJson(json)).toList();
        filterDeliveriesByType();
      } else {
        Get.snackbar('Error', 'Failed to load deliveries');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }


  void filterDeliveriesByType() {
    // Clear existing lists before filtering
    foodDelivery.clear();
    groceryDelivery.clear();
    rideDelivery.clear();
    porterDelivery.clear();

    // Filter the deliveries and add them to respective lists
    for (var delivery in deliveries) {
      switch (delivery.deliveryType.toLowerCase()) {
        case 'food':
          foodDelivery.add(delivery);
          break;
        case 'grocery':
          groceryDelivery.add(delivery);
          break;
        case 'ride':
          rideDelivery.add(delivery);
          break;
        case 'porter':
          porterDelivery.add(delivery);
          break;
        default:
          break;
      }
    }
  }

  // Optional: Function to reload the filtered lists after updating deliveries
  void reloadFilteredDeliveries() {
    filterDeliveriesByType(); // Reapply filtering when needed
  }
}
