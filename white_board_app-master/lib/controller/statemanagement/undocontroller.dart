import 'package:get/state_manager.dart';

class UndoControllers extends GetxController {
  RxBool isundo = false.obs;

  void toggleValue() {
    isundo.value = !isundo.value;
  }
}
