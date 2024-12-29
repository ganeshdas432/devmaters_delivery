import 'package:devmaters_delivery/fetaures/product/view/pages/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';
import '../../../category/model/category.dart';

class CategoryProductListView extends StatefulWidget {
  final Category category;

  CategoryProductListView({required this.category});

  @override
  State<CategoryProductListView> createState() => _CategoryProductListViewState();
}

class _CategoryProductListViewState extends State<CategoryProductListView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.category.title}"),
      ),
      body: ProductListScreen(), // Reuse ProductListScreen
    );
  }
}
