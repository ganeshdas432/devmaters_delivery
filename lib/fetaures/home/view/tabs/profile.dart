import 'package:devmaters_delivery/fetaures/auth/view/pages/address_page.dart';
import 'package:devmaters_delivery/fetaures/product/view/pages/invite_page.dart';
import 'package:devmaters_delivery/fetaures/orders/view/pages/order_page.dart';
import 'package:devmaters_delivery/fetaures/profile/view/pages/support_page.dart';
import 'package:devmaters_delivery/fetaures/orders/view/pages/transaction_page.dart';
import 'package:devmaters_delivery/fetaures/profile/view/pages/voucher_page.dart';
import 'package:devmaters_delivery/fetaures/auth/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController=Get.put(AuthController());
    final storage = GetStorage();
    String name=storage.read('user')['name'];
    int mobile=storage.read('user')['mobile']??00000;



    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              const CircleAvatar(
                minRadius: 28,
                maxRadius: 30,
                child: Icon(
                  Icons.person,
                  size: 28,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      name,
                      style:
                      const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                     Text("$mobile"),
                  ],
                ),
              ),
              IconButton(onPressed: () {
                authController.logout();

              }, icon: const Icon(Icons.logout))
            ],
          ),
          const SizedBox(height: 36,),
          Expanded(
            child: ListView(
              children:  [
                Card(

                    margin:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {
                        Get.to(const AddressPage());
                      },
                      leading: const Icon(Icons.location_on_rounded),
                      title: const Text("Address"),
                      trailing: const Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {
                        Get.to(const VoucherPage());
                      },
                      leading: const Icon(Icons.local_attraction),
                      title: const Text("My Vouchers"),
                      trailing: const Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {
                        Get.to(const TransactionPage());

                      },
                      leading: const Icon(Icons.credit_card),
                      title: const Text("Transactions"),
                      trailing: const Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {

                        Get.to(OrderScreen());
                      },
                      leading: const Icon(Icons.shopping_cart),
                      title: const Text("Orders"),
                      trailing: const Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {

                        Get.to(OrderScreen());
                      },
                      leading: const Icon(Icons.pedal_bike),
                      title: const Text("Ride Bookings"),
                      trailing: const Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {

                        Get.to(OrderScreen());
                      },
                      leading: const Icon(Icons.fire_truck),
                      title: const Text("Porter Bookings"),
                      trailing: const Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {

                        Get.to(const InvitePage());
                      },
                      leading: const Icon(Icons.group_add),
                      title: const Text("Invite Friends"),
                      trailing: const Icon(Icons.chevron_right),
                    )),
                Card(
                    margin:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      onTap: () {
                        Get.to(const SupportPage());
                      },
                      leading: const Icon(Icons.support_agent_outlined),
                      title: const Text("Support"),
                      trailing: const Icon(Icons.chevron_right),
                    )),
              ],
            ),
          )
        ],
      )),
    );
  }
}
