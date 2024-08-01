import 'package:flutter/material.dart';


class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Transaction Page"),),
      body: SafeArea(child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {

        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
          child: ListTile(
            title: Text("#24524"),
            subtitle: Text("Paid"),
            trailing: Text("100.00"),
          ),
        );
      },))
    );
  }
}
