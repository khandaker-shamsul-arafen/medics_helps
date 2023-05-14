import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/remote_impl/sql_helper.dart';

class RegistrationController extends GetxController {
  //TODO: Implement RegistrationController

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController age = TextEditingController();
  RxBool validate = false.obs;
  RxBool isLoading = true.obs;

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
  }

  void increment() => count.value++;
}
