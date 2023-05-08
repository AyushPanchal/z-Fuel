import 'package:zfuel/export_all.dart';

showSnackBar(String message, String subMessage) {
  Get.snackbar(
    message,
    subMessage,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
    backgroundColor: Colors.red.withOpacity(0.7),
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
  );
}
