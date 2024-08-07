import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class BookRide extends StatefulWidget {
  const BookRide({super.key});

  @override
  State<BookRide> createState() => _BookRideState();
}

class _BookRideState extends State<BookRide> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),              child: SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Icon(
                          Icons.list,
                          size: 16,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Select Vehicle',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 160,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.green,
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.green,
                      ),
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                            child: SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Icon(
                          Icons.list,
                          size: 16,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Select Passengers',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 160,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.green,
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.green,
                      ),
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
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
