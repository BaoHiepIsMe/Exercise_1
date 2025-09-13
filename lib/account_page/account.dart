import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/account_page/account_cubit.dart';
import 'package:login/account_page/account_state.dart';
import 'package:login/loading/loadingscreen.dart';
import 'package:login/login_page/login_cubit_cubit.dart';
import 'package:login/login_page/login_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget buildListItem(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 26),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18, // Cỡ chữ to hơn
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        const Divider(height: 1, thickness: 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<UserCubit,AccountState>(
        builder: (context,state){
          if(state is UserLoaded){
            final user = state.user;
            return SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile section
            Row(
              children: [
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(user.avata), // đổi ảnh nếu cần
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                     Text(
                      user.gmail,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(Icons.edit, color: Colors.green),
                const SizedBox(width: 20),
              ],
            ),

            const SizedBox(height: 30),

            // List items
            Expanded(
              child: ListView(
                children: [
                  buildListItem(Icons.shopping_bag_outlined, "Orders"),
                  buildListItem(Icons.credit_card_outlined, "My Details"),
                  buildListItem(Icons.location_on_outlined, "Delivery Address"),
                  buildListItem(Icons.payment_outlined, "Payment Methods"),
                  buildListItem(Icons.card_giftcard_outlined, "Promo Cord"),
                  buildListItem(Icons.notifications_none, "Notifications"),
                  buildListItem(Icons.help_outline, "Help"),
                  buildListItem(Icons.info_outline, "About"),
                ],
              ),
            ),

            // Delete & Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Delete",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Thông báo'),
                        content: Text('Are you sure want to Logout?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Xử lý OK ở đây
                              Navigator.of(context).pop();
                               Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => BlocProvider(
                                  create: (_) => LoginCubit(),
                                  child: LoginPage(),
                                )),
                              );
                            },
                            child: Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('No'),
                          ),
                        ],
                      );
                    },
                  );

                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      );
          } return LoadingScreen();
        },
      ),
    );
  }
}
