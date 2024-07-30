import 'package:flutter/material.dart';

class PorterPage extends StatelessWidget {
  const PorterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pickupc=new TextEditingController();
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            SizedBox(height: 26,),
            // Phone number layout equivalent
            Visibility(
              visible: true,
        
        
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4), // Equivalent to @dimen/_20sdp
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Pickup Location',
                      border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                      contentPadding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0), // Equivalent to @dimen/_3sdp for padding top
                      hintStyle: TextStyle(color: Colors.grey), // Equivalent to @color/text_color_grey
                    ),
                    controller:pickupc,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Email ';
                      }
                      String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                      RegExp regExp = RegExp(pattern);
                      if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
        
                    },
                    style: const TextStyle(
                      color: Colors.black, // Equivalent to @color/text_color_black
                      fontSize: 13.0, // Equivalent to @dimen/_13sdp
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: true,
        
        
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8), // Equivalent to @dimen/_20sdp
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Drop Location',
                      border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                      contentPadding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0), // Equivalent to @dimen/_3sdp for padding top
                      hintStyle: TextStyle(color: Colors.grey), // Equivalent to @color/text_color_grey
                    ),
                    controller:pickupc,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Email ';
                      }
                      String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                      RegExp regExp = RegExp(pattern);
                      if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
        
                    },
                    style: const TextStyle(
                      color: Colors.black, // Equivalent to @color/text_color_black
                      fontSize: 13.0, // Equivalent to @dimen/_13sdp
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: true,
        
        
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8), // Equivalent to @dimen/_20sdp
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Weight',
                      border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                      contentPadding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0), // Equivalent to @dimen/_3sdp for padding top
                      hintStyle: TextStyle(color: Colors.grey), // Equivalent to @color/text_color_grey
                    ),
                    controller:pickupc,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Email ';
                      }
                      String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                      RegExp regExp = RegExp(pattern);
                      if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
        
                    },
                    style: const TextStyle(
                      color: Colors.black, // Equivalent to @color/text_color_black
                      fontSize: 13.0, // Equivalent to @dimen/_13sdp
                    ),
                  ),
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                  ),
                  onPressed: () {
        
        
                  }, child: SizedBox(
                height: 48,
                child: Row(children: [
                  Icon(Icons.calculate_outlined,color: Colors.white,),
                  SizedBox(width: 8,),
                  Text("Calculate Price",style: TextStyle(color: Colors.white),)
                ],),
              )),
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
              child: Text(
                "Bookings",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
        
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10),
                elevation: 5,
                child: ListTile(
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     index==1? Icon(Icons.done_all,color: Colors.green,):Icon(Icons.pending,color: Colors.orange,),
                      index==1?Text("Done"):Text("Pending"),
                    ],
                  ),
                  leading: Icon(Icons.location_on_rounded,size: 54,color: Colors.green,),
                  title: Text("#245824",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("24 No,Gitanjali Road,Kolkata,700001",maxLines: 1,overflow: TextOverflow.ellipsis,),
                    Icon(Icons.arrow_downward),
                    Text("24 No,Gitanjali Road,Kolkata,700001",maxLines: 1,overflow: TextOverflow.ellipsis,)

                  ],),
                ),
              );
            },)
        
          ],
        ),
      )),
    );
  }
}
