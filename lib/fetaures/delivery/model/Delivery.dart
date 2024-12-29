class Delivery {
  int? id;
  String pickupLatitude;
  String pickupLongitude;
  String dropLatitude;
  String dropLongitude;
  String pickup_address;
  String drop_address;
  String deliveryType;
  String deliveryDetails;
  String pickupContact;
  String dropContact;
  String dropTo;
  String orderValue;
  String orderWeight;
  String orderPaymentStatus;
  String orderPaymentType;
  String distance;
  String deliveryCost;
  String tips;
  String riderEarning;
  String riderId;
  String customerId;

  Delivery({
     this.id,
    required this.pickupLatitude,
    required this.pickupLongitude,
    required this.dropLatitude,
    required this.dropLongitude,
    required this.pickup_address,
    required this.drop_address,
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
  });

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'pickup_latitude': pickupLatitude,
      'pickup_longitude': pickupLongitude,
      'drop_latitude': dropLatitude,
      'drop_longitude': dropLongitude,
      'pickup_address':pickup_address,
      'drop_address':drop_address,
      'delivery_type': deliveryType,
      'delivery_details': deliveryDetails,
      'pickup_contact': pickupContact,
      'drop_contact': dropContact,
      'drop_to': dropTo,
      'order_value': orderValue,
      'order_weight': orderWeight,
      'order_payment_status': orderPaymentStatus,
      'order_payment_type': orderPaymentType,
      'distance': distance,
      'delivery_cost': deliveryCost,
      'tips': tips,
      'rider_earning': riderEarning,
      'rider_id': riderId,
      'customer_id': customerId,
    };
  }

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      id: json['id'],
      pickupLatitude: json['pickup_latitude'],
      pickupLongitude: json['pickup_longitude'],
      dropLatitude: json['drop_latitude'],
      dropLongitude: json['drop_longitude'],
      pickup_address: json['pickup_address'],
      drop_address: json['drop_address'],
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
    );
  }
}
