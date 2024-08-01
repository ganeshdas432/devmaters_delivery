import 'package:devmaters_delivery/Views/pages/order/order_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {

        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
          child: ListTile(
            onTap: () {
              Get.to(OrderDetails());
            },
            title: Text("#125475"),
            subtitle: Text("100.00"),
            trailing: Text("Delivered"),
          ),
        );
      },),
    );
  }
}
