class CartItem {
  int? productId;
  int? shopId;
  String? productName;
  double? price;
  int quantity;
  String? productImage;
  String? shopname;
  double? shoplat;
  double? shoplong;
  String? selectedAttribute;


  CartItem({
    required this.productId,
    required this.shopId,
    required this.productName,
    required this.price,
    this.quantity = 1,
    this.productImage,
    this.shopname,
    this.shoplat,
    this.shoplong,
    this.selectedAttribute

});

  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'product_name': productName,
    'product_price': price,
    'quantity': quantity,
    'selected_attribute': selectedAttribute,
  };


}
