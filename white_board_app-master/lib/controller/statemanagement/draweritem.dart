import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DrawerItemController extends GetxController {
  Rx<Color> firstColor = Colors.green.obs;
  Rx<Color> secondColor = Colors.blue.obs;
  Rx<Color> thirdColor = Colors.amber.obs;
  Rx<Color> fourthColor = Colors.black.obs;

  void changefirstColor(Color color) {
    firstColor(color);
  }

  void changeSecodColor(Color color) {
    secondColor(color);
  }

  void changeThirdColor(Color color) {
    thirdColor(color);
  }

  void changefourthColor(Color color) {
    fourthColor(color);
  }
}
