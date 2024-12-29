import 'dart:convert';
import 'package:devmaters_delivery/fetaures/orders/controller/cart_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../home/controllers/my_location_picker_controller.dart';

class ApiClient {
  static const String _baseUrl = 'https://drive.elayd.com/api';
  CartController cartController=Get.find();
  MyLocationPickerController myLocationPickerController = Get.find();

  final storage = GetStorage();


  /// Fetches a list of orders by user ID.
  static Future<Map<String, dynamic>?> getOrders({int userId = 1}) async {
    final String url = '$_baseUrl/orderlist/$userId';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the JSON data into a Map
        return jsonDecode(response.body);
      } else {
        print('Failed to load orders: ${response.statusCode} ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error fetching orders: $e');
      return null;
    }
  }

  Future<void> placeOrder() async {
    int mobile=storage.read('user')['mobile'];
    int cid=storage.read('user')['id'];
    String name=storage.read('user')['name'];

    String subtotal=cartController.subtotal.toStringAsFixed(2);
    String deliveryCharges=cartController.delivery_charge.toStringAsFixed(2);
    String distance=cartController.distance.value.toString();
    String shopname=cartController.cartItems.first.shopname!;

    String pickuplat=cartController.cartItems.first.shoplat!.toString();
    String pickuplong=cartController.cartItems.first.shoplong!.toString();
    String pickupaddress=cartController.cartItems.first.shopname!.toString();


   String destlat = myLocationPickerController.pickuplat.value.toString();
   String droplong=myLocationPickerController.pickuplong.value.toString();
   String dropaddress=myLocationPickerController.pickupaddress.value.toString();



    final url = Uri.parse('$_baseUrl/orders');
    final orderData = prepareOrderData(cid,subtotal,mobile,name,deliveryCharges,distance,shopname,pickuplat,pickuplong,destlat,droplong,dropaddress);

    try {

      print(json.encode(orderData));
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(orderData),
      );

      if (response.statusCode == 201) {
        // Order created successfully
        final responseData = json.decode(response.body);
        print('Order created successfully: ${responseData['order_id']}');
        Get.snackbar("order Placed", "Order Placed Successfully . Order Id :  ${responseData['order_id']}",backgroundColor: Colors.green,colorText: Colors.white);

      } else {
        // Error occurred
        print('Failed to create order: ${response.statusCode}');
        print('Error message: ${response.body}');
      }
    } catch (error) {
      print('Error creating order: $error');
    }
  }

  Map<String, dynamic> prepareOrderData(int cid, String subtotal, int mobile, String name, String deliveryCharges, String distance, String shopname, String pickuplat, String pickuplong, String destlat, String droplong, String dropaddress) {
    return {
      'cid': cid, // Customer ID
      'subtotal': subtotal,
      'order_status':  1, // Assuming status ID is 2 for "PICKED UP"
      'delivery': {
        'pickup_latitude': '${pickuplat}',
        'pickup_longitude': '${pickuplong}',
        'drop_latitude': '${destlat}',
        'drop_longitude': '${droplong}',
        'pickup_address': '${shopname}',
        'drop_address': '${dropaddress}',
        'delivery_type': 'standard',
        'delivery_details': '...',
        'pickup_contact': '$shopname',
        'drop_contact': '$mobile',
        'drop_to': '$name',
        'order_value': '${double.parse(subtotal)}',
        'order_weight': '500',
        'order_payment_status': 'due',
        'order_payment_type': 'cash',
        'distance': '$distance',
        'delivery_cost': '$deliveryCharges',
        'tips': '00.00',
        'rider_earning': '00.00',
        'rider_id': '1',
        'customer_id': '$cid',
      },
      'order_details': cartController.cartItems.map((item) => item.toJson()).toList(),
    };
  }
}
