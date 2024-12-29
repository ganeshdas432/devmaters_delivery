class CartItem {
  int? productId;
  int? shopId;
  String? productName;
  double? price;
  int quantity;
  String? productImage;

  CartItem({
    required this.productId,
    required this.shopId,
    required this.productName,
    required this.price,
    this.quantity = 1,
    this.productImage,
  });
}
