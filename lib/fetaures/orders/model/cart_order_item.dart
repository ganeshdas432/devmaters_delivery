class CartOrderitem {
  final int productId;
  final String productName;
  final double productPrice;
  final int quantity;
  final String selectedAttribute;

  CartOrderitem({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.selectedAttribute,
  });

  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'product_name': productName,
    'product_price': productPrice,
    'quantity': quantity,
    'selected_attribute': selectedAttribute,
  };
}
