import 'package:devmaters_delivery/fetaures/orders/model/Order.dart';
import 'package:devmaters_delivery/fetaures/orders/service/ApiClient.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class OrderController extends GetxController {
  var orders = <Order>[].obs;
  var loading = true.obs; // Loading observable
  final storage = GetStorage();




  @override
  void onInit() {
    super.onInit();

    fetchOrders();
  }

  void fetchOrders() async {
    int id=storage.read('user')['id'];

    print("id : $id");
    loading.value = true; // Start loading
    var response = await ApiClient.getOrders(userId: id); // Adjust userId if needed
    if (response != null) {
      List<Order> fetchedOrders = (response['orders'] as List)
          .map((json) => Order.fromJson(json))
          .toList();
      orders.assignAll(fetchedOrders);
    }
    loading.value = false; // Stop loading after data is fetched
  }
}
