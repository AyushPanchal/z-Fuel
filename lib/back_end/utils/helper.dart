import 'package:zfuel/export_all.dart';

Future<void> init() async {
  Get.put(MapController(), permanent: true);
  Get.put(AuthController(), permanent: true);
  Get.put(AuthDataController(), permanent: true);
  Get.put(ValidationController(), permanent: true);

  Get.put(FirestoreController(), permanent: true);
}
