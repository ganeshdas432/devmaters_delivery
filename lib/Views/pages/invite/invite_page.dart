import 'package:flutter/material.dart';

class InvitePage extends StatelessWidget {
  const InvitePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Invite Page"),),
      body: SafeArea(child: Column(
        children: [
          Image.asset("assets/res/invite.jpg"),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 48,
              width: double.maxFinite,
              decoration: BoxDecoration(
                 border: Border.all(width: 0.2,),
                borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Center(
                child: Text(
                  "http://google.com/125425"
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white
            ),
              onPressed: () {
            
          }, child: Text("Copy"))
          
        ],
      )),
    );
  }
}
