class OrderDetail {
  final int id;
  final int orderId;
  final int productId;
  final String productName;
  final String productPrice;
  final String selectedAttribute;
  final int quantity;

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.selectedAttribute,
    required this.quantity,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      productName: json['product_name'],
      productPrice: json['product_price'],
      selectedAttribute: json['selected_attribute'],
      quantity: json['quantity'],
    );
  }
}
