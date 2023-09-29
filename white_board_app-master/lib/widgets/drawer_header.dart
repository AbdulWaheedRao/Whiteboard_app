import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:white_board_application/widgets/drawer_menu_item.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pop(context);
        Get.back();
      },
      child: const Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CircleAvatar(
            radius: 52,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Waheed',
            style: TextStyle(fontSize: 28, color: Colors.black),
          ),
          Text(
            'Waheed@gmail.com',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          DrawerMenuItem(),
        ],
      ),
    );
  }
}
