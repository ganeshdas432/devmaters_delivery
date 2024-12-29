import '../../../Core/constant.dart';

class Category {
  int? id;
  String? title;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? shopType;

  Category(
      {this.id, this.title, this.image,this.createdAt, this.updatedAt, this.shopType});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image="${ConstantData.baseurl}storage/" + json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shopType = json['shop_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image']=this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['shop_type'] = this.shopType;
    return data;
  }
}
