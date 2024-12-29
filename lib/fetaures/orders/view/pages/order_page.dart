import 'package:devmaters_delivery/fetaures/orders/controller/OrderController.dart';
import 'package:devmaters_delivery/fetaures/orders/view/pages/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  final OrderController orderController = Get.find<OrderController>(tag: "Order Controller");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: Obx(() {
        if (orderController.loading.value) {
          return const Center(child: CircularProgressIndicator()); // Show loading indicator
        }
        if (orderController.orders.isEmpty) {
          return const Center(child: Text('No orders found')); // Show message if no orders
        }
        return RefreshIndicator(
          onRefresh: () async{
            orderController.fetchOrders();
          },

          child: ListView.builder(
            itemCount: orderController.orders.length,
            itemBuilder: (context, index) {
              final order = orderController.orders[index];
              return OrderCard(order: order);
            },
          ),
        );
      }),
    );
  }
}
