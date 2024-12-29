class OrderStatus {
  final int id;
  final String title;
  final String createdAt;
  final String updatedAt;

  OrderStatus({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> json) {
    return OrderStatus(
      id: json['id'],
      title: json['title'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
