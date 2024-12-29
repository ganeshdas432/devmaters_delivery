import 'package:devmaters_delivery/fetaures/orders/controller/OrderController.dart';
import 'package:devmaters_delivery/fetaures/orders/view/pages/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RideListScreen extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: Obx(() {
        if (orderController.loading.value) {
          return Center(child: CircularProgressIndicator()); // Show loading indicator
        }
        if (orderController.orders.isEmpty) {
          return Center(child: Text('No orders found')); // Show message if no orders
        }
        return ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) {
            final order = orderController.orders[index];
            return OrderCard(order: order);
          },
        );
      }),
    );
  }
}
