import 'package:flutter/material.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Vouchers"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("Vouche Name"),
                subtitle: Text("50% Discount"),
                trailing: OutlinedButton(

                    style: OutlinedButton.styleFrom(

                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green,width: 0.2,style: BorderStyle.solid),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onPressed: () {},
                    child: Text("Copy")),
              ),
            );
          },
        ),
      )),
    );
  }
}
