import 'package:devmaters_delivery/Core/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../category/model/category.dart';
import '../model/product.dart';

class ProductController extends GetxController {
  var allProducts = <Product>[].obs; // Full product list
  var filteredProducts = <Product>[].obs; // Filtered product list for category, search, etc.
  var foodProducts = <Product>[].obs; // Filtered product list for category, search, etc.
  var shopListProducts=<Product>[].obs;
  var groceryProducts = <Product>[].obs; // Filtered product list for category, search, etc.
  var categories = <Category>[].obs; // Category list
  var isLoading = true.obs;
  var searchQuery = ''.obs;
  var selectedCategory = Rxn<Category>(); // For filtering by category

  final String baseUrl = '${ConstantData.baseurl}api/products';

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  // Fetch products from the API
  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        var products = jsonData.map((data) => Product.fromJson(data)).toList();
        allProducts.assignAll(products); // Populate full product list
        filteredProducts.assignAll(allProducts); // Initialize filtered list
        categories.assignAll(products.map((p) => p.category!).toSet().toList()); // Extract unique categories
        foodProducts.assignAll(
          allProducts.where((p) => p.shop!.shopType! =="FS").toList(),
        );

        groceryProducts.assignAll(
          allProducts.where((p) => p.shop!.shopType! =="GS").toList(),
        );




      }
      print("product list ${response.statusCode}");
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch products");
      print("productlist error ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }

  // Filter by category
  void filterByCategory(Category category) {
    selectedCategory(category); // Set selected category
    if (category != null) {
      filteredProducts.assignAll(
        allProducts.where((p) => p.catId == category.id).toList(),
      );
    } else {
      // If no category is selected, show all products
      filteredProducts.assignAll(allProducts);
    }
  }



  // Search products by name or description
  void searchProducts(String query) {
    searchQuery(query); // Set search query
    filteredProducts.assignAll(
      allProducts.where((p) =>
      p.productName!.toLowerCase().contains(query.toLowerCase()) ||
          p.description!.toLowerCase().contains(query.toLowerCase())
      ).toList(),
    );
  }

  void getshopProducts(int id){
    shopListProducts.assignAll(
        allProducts.where((p0) => p0.shopId==id,).toList()
    );
  }

  // Reset filters (show all products)
  void resetFilters() {
    searchQuery('');
    selectedCategory(null);
    filteredProducts.assignAll(allProducts); // Reset filtered list to all products
  }
}
