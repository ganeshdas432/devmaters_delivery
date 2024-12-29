class Customer {
  final int id;
  final String name;
  final int mobile;
  final String gender;
  final int age;
  final int userStatus;
  final String createdAt;
  final String updatedAt;

  Customer({
    required this.id,
    required this.name,
    required this.mobile,
    required this.gender,
    required this.age,
    required this.userStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as int,
      name: json['name'] as String,
      mobile: json['mobile'] as int,
      gender: json['gender'] as String,
      age: json['age'] as int,
      userStatus: json['status'] as int, // Mapped 'status' to 'userStatus'
      createdAt: json['created_at'] ?? '', // Use default if null
      updatedAt: json['updated_at'] ?? '', // Use default if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'gender': gender,
      'age': age,
      'status': userStatus, // Map 'userStatus' back to 'status'
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
