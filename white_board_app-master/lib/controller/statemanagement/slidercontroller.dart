import 'dart:ui';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SliderController extends GetxController {
  RxDouble slider = 0.5.obs;

  double sliderVal(double value) {
    return slider(value);
  }
}
