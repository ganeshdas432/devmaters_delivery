import '../fetaures/category/model/category.dart';

class Product {
  int? id;
  int? shopId;
  int? catId;
  String? productName;
  String? description;
  String? time;
  String? type;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? averageRating;
  Category? category;
  List<Ratings>? ratings;
  List<Attributes>? attributes;
  Shop? shop;

  Product(
      {this.id,
        this.shopId,
        this.catId,
        this.productName,
        this.description,
        this.time,
        this.type,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.averageRating,
        this.category,
        this.ratings,
        this.attributes,
        this.shop});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    catId = json['cat_id'];
    productName = json['product_name'];
    description = json['description'];
    time = json['time'];
    type = json['type'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    averageRating = json['average_rating'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(new Ratings.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['cat_id'] = this.catId;
    data['product_name'] = this.productName;
    data['description'] = this.description;
    data['time'] = this.time;
    data['type'] = this.type;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['average_rating'] = this.averageRating;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.ratings != null) {
      data['ratings'] = this.ratings!.map((v) => v.toJson()).toList();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    return data;
  }
}



class Ratings {
  int? id;
  int? productId;
  String? comment;
  int? stars;
  String? image;
  Null? createdAt;
  Null? updatedAt;

  Ratings(
      {this.id,
        this.productId,
        this.comment,
        this.stars,
        this.image,
        this.createdAt,
        this.updatedAt});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    comment = json['comment'];
    stars = json['stars'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['comment'] = this.comment;
    data['stars'] = this.stars;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Attributes {
  int? id;
  int? productId;
  String? title;
  int? value;
  int? price;
  String? mrp;
  int? unit;
  String? createdAt;
  String? updatedAt;

  Attributes(
      {this.id,
        this.productId,
        this.title,
        this.value,
        this.price,
        this.mrp,
        this.unit,
        this.createdAt,
        this.updatedAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    title = json['title'];
    value = json['value'];
    price = json['price'];
    mrp = json['mrp'];
    unit = json['unit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['title'] = this.title;
    data['value'] = this.value;
    data['price'] = this.price;
    data['mrp'] = this.mrp;
    data['unit'] = this.unit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

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
    image = json['image'];
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
