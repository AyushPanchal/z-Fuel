import 'package:flutter/material.dart';
import 'package:zfuel/export_all.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  static const String id = '/home_page_id';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('welcome ${_authController.currentUser.value!.email}'),
          ),
          OutlinedButton(
            onPressed: () {
              _authController.logoutUser();
            },
            child: Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
