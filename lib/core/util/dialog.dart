import 'package:get/get.dart';

class AppDialog {
  static void defaultDialog(
      {required String title, required String middleText}) {
    Get.defaultDialog(radius: 5, title: title, middleText: middleText);
  }

  static void defaultError() {
    Get.defaultDialog(
        radius: 5,
        title: "Error".tr,
        middleText: "An unknown error occurred. Please try again later.".tr);
  }
}
