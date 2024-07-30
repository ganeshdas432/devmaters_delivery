import 'package:get/get.dart';

class HomeController extends GetxController{
  RxInt current_bootom_nav_index=0.obs;
  RxInt current_home_tab_index=0.obs;








  @override
  void onInit() {
    super.onInit();
  }


  changeBottomNavIndex(int value){
    current_bootom_nav_index.value=value;
  }

  changeHomeTabIndex(int value){
    current_home_tab_index.value=value;
  }



}