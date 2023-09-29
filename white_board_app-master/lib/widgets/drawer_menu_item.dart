import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_board_application/controller/statemanagement/draweritem.dart';
import 'package:white_board_application/controller/statemanagement/slidercontroller.dart';
import 'package:white_board_application/controller/white_board_behaviour.dart';

class DrawerMenuItem extends StatefulWidget {
  const DrawerMenuItem({super.key});

  @override
  State<DrawerMenuItem> createState() => _DrawerMenuItemState();
}

class _DrawerMenuItemState extends State<DrawerMenuItem> {
  final DrawerItemController colorController = Get.put(DrawerItemController());
  final SliderController sliderController = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.color_lens),
          title: const Text('green'),
          onTap: () {
            colorValue = colorController.firstColor.value;
            Get.back();
            // setState(() {
            //   colorValue = Colors.green;
            // });
            // Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.color_lens),
          title: const Text('blue'),
          onTap: () {
            colorValue = colorController.secondColor.value;
            Get.back();
            // setState(() {
            //   colorValue = Colors.blue;
            // });
            // Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.color_lens),
          title: const Text('amber'),
          onTap: () {
            colorValue = colorController.thirdColor.value;
            Get.back();
            // setState(() {
            //   colorValue = Colors.blueGrey;
            // });
            // Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.color_lens),
          title: const Text('black'),
          onTap: () {
            colorValue = colorController.fourthColor.value;
            Get.back();
            // setState(() {
            //   colorValue = Colors.black;
            // });
            // Navigator.pop(context);
          },
        ),
        const Divider(
          color: Colors.black45,
        ),
        Obx(() {
          return Slider(
            value: sliderController.slider.value,
            onChanged: (newValue) {
              sliderValue = sliderController.sliderVal(newValue);

              // sliderController.sliderVal;
              // setState(() {
              //   sliderValue = value;
              // });
            },
            activeColor: Colors.blueGrey,
          );
        })
      ],
    );
  }
}
