import 'package:devmaters_delivery/fetaures/product/view/pages/product_list.dart';
import 'package:flutter/material.dart';


class SearchProductListView extends StatefulWidget {
  String title;
  SearchProductListView(this.title);

  @override
  State<SearchProductListView> createState() => _SearchProductListViewState();
}

class _SearchProductListViewState extends State<SearchProductListView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
            child: SearchBar(
              leading: Icon(Icons.search),
              hintText: "Search",
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              padding: WidgetStatePropertyAll(EdgeInsets.only(left: 16)),
            ),
          ),
          Expanded(child: ProductListScreen()),
        ],
      ), // Reuse ProductListScreen
    );
  }
}
