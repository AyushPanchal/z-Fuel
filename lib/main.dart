import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'export_all.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  init();
  runApp(
    GetMaterialApp(
      getPages: AppRoutes.getPages,
      debugShowCheckedModeBanner: false,
    ),
  );
}
