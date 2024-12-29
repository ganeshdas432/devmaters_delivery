import 'package:devmaters_delivery/fetaures/auth/view/pages/address_page.dart';
import 'package:devmaters_delivery/fetaures/product/view/pages/invite_page.dart';
import 'package:devmaters_delivery/fetaures/orders/view/pages/order_page.dart';
import 'package:devmaters_delivery/fetaures/profile/view/pages/support_page.dart';
import 'package:devmaters_delivery/fetaures/orders/view/pages/transaction_page.dart';
import 'package:devmaters_delivery/fetaures/profile/view/pages/voucher_page.dart';
import 'package:devmaters_delivery/fetaures/auth/controller/auth_controller.dart';
import 'package:devmaters_delivery/fetaures/auth/controller/user_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController=Get.put(AuthController());
    final UserDetailController userDetailController =Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              CircleAvatar(
                minRadius: 28,
                maxRadius: 30,
                child: Icon(
                  Icons.person,
                  size: 28,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Obx(()=>Text(
                        "${userDetailController.userDetail.value.name}",
                        style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                      ),
                    ),
                    Obx(() =>  Text("${userDetailController.userDetail.value.mobileNo}")),
                  ],
                ),
              ),
              IconButton(onPressed: () {
                authController.logout();

              }, icon: Icon(Icons.logout))
            ],
          ),
          SizedBox(height: 36,),
          Expanded(
            child: ListView(
              children:  [
                Card(

                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {
                        Get.to(AddressPage());
                      },
                      leading: Icon(Icons.location_on_rounded),
                      title: Text("Address"),
                      trailing: Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {
                        Get.to(VoucherPage());
                      },
                      leading: Icon(Icons.local_attraction),
                      title: Text("My Vouchers"),
                      trailing: Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {
                        Get.to(TransactionPage());

                      },
                      leading: Icon(Icons.credit_card),
                      title: Text("Transactions"),
                      trailing: Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {

                        Get.to(OrderPage());
                      },
                      leading: Icon(Icons.shopping_cart),
                      title: Text("Orders"),
                      trailing: Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {

                        Get.to(InvitePage());
                      },
                      leading: Icon(Icons.group_add),
                      title: Text("Invite Friends"),
                      trailing: Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {
                        Get.to(SupportPage());
                      },
                      leading: Icon(Icons.support_agent_outlined),
                      title: Text("Support"),
                      trailing: Icon(Icons.chevron_right),
                    )),
              ],
            ),
          )
        ],
      )),
    );
  }
}
