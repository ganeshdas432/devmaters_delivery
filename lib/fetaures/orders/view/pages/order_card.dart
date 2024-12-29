import 'package:devmaters_delivery/fetaures/orders/model/Order.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: ${order.id}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Customer Name: ${order.customer.name}'),
            Text('Mobile: ${order.customer.mobile}'),
            Text('Subtotal: ${order.subtotal}'),
            Text('Status: ${order.orderStatus.title}'),
            SizedBox(height: 8),
            Text(
              'Order Details:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...order.orderDetails.map((detail) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '- ${detail.productName} x${detail.quantity} @ ${detail.productPrice}',
              ),
            )),
            SizedBox(height: 8),
            Text(
              'Delivery Address:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(order.delivery.dropAddress),
          ],
        ),
      ),
    );
  }
}
