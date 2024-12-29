import 'package:get/get.dart';

import '../../orders/controller/OrderController.dart';

class HomeController extends GetxController{
  RxInt current_bootom_nav_index=0.obs;
  RxInt current_home_tab_index=0.obs;
  RxInt orderProcessing=0.obs;


  final OrderController orderController = Get.find<OrderController>(tag: "Order Controller");









  @override
  void onInit() {
    super.onInit();
    orderController.orders.listen((orders) {
      _updateProcessingOrders();
    });
    _updateProcessingOrders(); // Initial count update
  }


  changeBottomNavIndex(int value){
    current_bootom_nav_index.value=value;
  }

  changeHomeTabIndex(int value){
    current_home_tab_index.value=value;
  }


  void _updateProcessingOrders() {
    orderProcessing.value = orderController.orders
        .where((order) =>
    order.orderStatus.id != 4 &&
        order.orderStatus.id !=5 )
        .length;
  }


}