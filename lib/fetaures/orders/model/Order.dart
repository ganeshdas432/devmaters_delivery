import 'package:devmaters_delivery/fetaures/orders/model/Customer.dart';
import 'package:devmaters_delivery/fetaures/orders/model/Delivery.dart';
import 'package:devmaters_delivery/fetaures/orders/model/OrderDetail.dart';
import 'package:devmaters_delivery/fetaures/orders/model/OrderStatus.dart';

class Order {
  final int id;
  final String cid;
  final int did;
  final String subtotal;
  final OrderStatus orderStatus;
  final Customer customer;
  final List<OrderDetail> orderDetails;
  final Delivery delivery;
  final String updatedAt;

  Order({
    required this.id,
    required this.cid,
    required this.did,
    required this.subtotal,
    required this.orderStatus,
    required this.customer,
    required this.orderDetails,
    required this.delivery,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      cid: json['cid'],
      did: json['did'],
      subtotal: json['subtotal'],
      orderStatus: OrderStatus.fromJson(json['order_status']),
      customer: Customer.fromJson(json['customer']),
      orderDetails: (json['order_details'] as List)
          .map((item) => OrderDetail.fromJson(item))
          .toList(),
      delivery: Delivery.fromJson(json['delivery']),
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

