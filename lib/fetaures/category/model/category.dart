class Category {
  final int id;
  final String title;
  final String createdAt;
  final String updatedAt;
  final String shopType;

  Category({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.shopType,
  });

  // Factory constructor to create a Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      shopType: json['shop_type'],
    );
  }
}
