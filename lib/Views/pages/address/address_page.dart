import 'package:flutter/material.dart';


class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Address"),),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 16,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
                onPressed: () {


                }, child: SizedBox(
              height: 40,
              child: Row(children: [
                Icon(Icons.add,color: Colors.white,),
                SizedBox(width: 8,),
                Text("Add New Address",style: TextStyle(color: Colors.white),)
              ],),
            )),
            Expanded(child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.location_on_rounded),
                  title: Text("25/D, Kolkata Sector 5 ,742202"),
                  subtitle: Text("9876543210"),
                ),
              );
            },))
          ],
        ),
      )),
    );
  }
}

