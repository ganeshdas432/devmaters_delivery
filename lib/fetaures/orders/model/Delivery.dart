class Delivery {
  final int id;
  final String pickupLatitude;
  final String pickupLongitude;
  final String dropLatitude;
  final String dropLongitude;
  final String pickupAddress;
  final String dropAddress;
  final String deliveryType;
  final String deliveryDetails;
  final String pickupContact;
  final String dropContact;
  final String dropTo;
  final String orderValue;
  final String orderWeight;
  final String orderPaymentStatus;
  final String orderPaymentType;
  final String distance;
  final String deliveryCost;
  final String tips;
  final String riderEarning;
  final String riderId;
  final String customerId;
  final String updatedAt;

  Delivery({
    required this.id,
    required this.pickupLatitude,
    required this.pickupLongitude,
    required this.dropLatitude,
    required this.dropLongitude,
    required this.pickupAddress,
    required this.dropAddress,
    required this.deliveryType,
    required this.deliveryDetails,
    required this.pickupContact,
    required this.dropContact,
    required this.dropTo,
    required this.orderValue,
    required this.orderWeight,
    required this.orderPaymentStatus,
    required this.orderPaymentType,
    required this.distance,
    required this.deliveryCost,
    required this.tips,
    required this.riderEarning,
    required this.riderId,
    required this.customerId,
    required this.updatedAt,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      id: json['id'],
      pickupLatitude: json['pickup_latitude'],
      pickupLongitude: json['pickup_longitude'],
      dropLatitude: json['drop_latitude'],
      dropLongitude: json['drop_longitude'],
      pickupAddress: json['pickup_address'],
      dropAddress: json['drop_address'],
      deliveryType: json['delivery_type'],
      deliveryDetails: json['delivery_details'],
      pickupContact: json['pickup_contact'],
      dropContact: json['drop_contact'],
      dropTo: json['drop_to'],
      orderValue: json['order_value'],
      orderWeight: json['order_weight'],
      orderPaymentStatus: json['order_payment_status'],
      orderPaymentType: json['order_payment_type'],
      distance: json['distance'],
      deliveryCost: json['delivery_cost'],
      tips: json['tips'],
      riderEarning: json['rider_earning'],
      riderId: json['rider_id'],
      customerId: json['customer_id'],
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
