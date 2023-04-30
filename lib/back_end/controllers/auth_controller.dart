import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zfuel/export_all.dart';

class AuthController extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;

  late final Rx<User?> _currentUser;
  Rx<User?> get currentUser => (_currentUser);

  RxBool isLoading = false.obs;

  /*=====ON READY FUNCTION TO FETCH CURRENT USER=====*/
  @override
  void onReady() {
    _currentUser = Rx<User?>(_firebaseAuth.currentUser);
    _currentUser.bindStream(_firebaseAuth.userChanges());
    ever(_currentUser, _setInitialScreen);
  }

  /*=====CHECK IF THE USER IS LOGGED IN OR NOT=====*/
  _setInitialScreen(User? user) {
    user == null ? Get.offAllNamed('/') : Get.offAllNamed(HomePage.id);
  }

  /*=====METHOD TO REGISTER A NEW USER USING EMAIL AND PASSWORD=====*/
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      isLoading.value = true;
      //creating account
      await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        isLoading.value = false;
        Get.offAllNamed(HomePage.id);
        return value;
      });
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      //Handling various exceptions
      if (e.code == 'weak-password') {
        // Handle weak password
        Get.snackbar(
          'Weak Password',
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      } else if (e.code == 'email-already-in-use') {
        // Handle email already in use error
        Get.snackbar(
          'Email already in use',
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      } else {
        // Handle other errors
        Get.snackbar(
          e.code,
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    } finally {
      isLoading.value = false;
    }
  }

  /*=====METHOD TO LOGIN USER USING EMAIL AND PASSWORD=====*/
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Show loading indicator
      isLoading.value = true;

      // Sign in the user with email and password
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.to(() => const HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Handle user not found error
        Get.snackbar(
          'User not found',
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      } else if (e.code == 'wrong-password') {
        // Handle wrong password error
        Get.snackbar(
          'Incorrect password!',
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      } else {
        // Handle other errors
        Get.snackbar(
          e.code,
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    } finally {
      // Hide loading indicator
      isLoading.value = false;
    }
  }

  /*=====METHOD TO LOGOUT USER=====*/
  Future<void> logoutUser() async {
    await _firebaseAuth.signOut();
  }
}
