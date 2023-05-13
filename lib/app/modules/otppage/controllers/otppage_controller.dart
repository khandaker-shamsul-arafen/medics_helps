import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtppageController extends GetxController {
  //TODO: Implement OtppageController
  final TextEditingController firstOtp = TextEditingController();
  final TextEditingController secondOtp = TextEditingController();
  final TextEditingController thirdOtp = TextEditingController();
  final TextEditingController fourthOtp = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    firstOtp.dispose();
    secondOtp.dispose();
    thirdOtp.dispose();
    firstOtp.dispose();
  }

  void increment() => count.value++;
}
