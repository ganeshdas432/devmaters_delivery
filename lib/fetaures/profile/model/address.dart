class Address {
  int id;
  String cid;
  String lat;
  String long;
  String address;
  DateTime createdAt;
  DateTime updatedAt;

  Address({
    required this.id,
    required this.cid,
    required this.lat,
    required this.long,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to create a Location object from JSON
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      cid: json['cid'],
      lat: json['lat'],
      long: json['long'],
      address: json['address'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert a Location object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cid': cid,
      'lat': lat,
      'long': long,
      'address': address,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
