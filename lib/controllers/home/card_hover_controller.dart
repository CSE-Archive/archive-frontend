import 'package:get/get.dart';

class CardHoverController extends GetxController {
  var hover = false.obs;

  void onEnter() {
    hover.value = true;
  }

  void onExit() {
    hover.value = false;
  }
}
