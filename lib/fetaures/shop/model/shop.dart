class Shop {
  int? id;
  String? shopName;
  String? image;
  String? vendorId;
  String? address;
  String? mobile;
  String? latitude;
  String? longitude;
  String? status;
  String? shopType;
  String? createdAt;
  String? updatedAt;

  Shop(
      {this.id,
        this.shopName,
        this.image,
        this.vendorId,
        this.address,
        this.mobile,
        this.latitude,
        this.longitude,
        this.status,
        this.shopType,
        this.createdAt,
        this.updatedAt});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopName = json['shop_name'];
    image = "https://drive.elayd.com/storage/" + json['image'];
    vendorId = json['vendor_id'];
    address = json['address'];
    mobile = json['mobile'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    shopType = json['shop_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_name'] = this.shopName;
    data['image'] = this.image;
    data['vendor_id'] = this.vendorId;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['shop_type'] = this.shopType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
