import 'dart:convert';
import 'package:devmaters_delivery/Core/constant.dart';
import 'package:devmaters_delivery/fetaures/product/model/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String apiUrl = '${ConstantData.baseurl}api/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['products'];
      return data.map((productJson) => Product.fromJson(productJson)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
