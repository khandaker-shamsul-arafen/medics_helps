import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../../data/remote_impl/sql_helper.dart';

class AddmedicinController extends GetxController {
  //TODO: Implement AddmedicinController
  final TextEditingController medecinenameController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController signController = TextEditingController();
  RxBool isLoading = true.obs;
  RxList medecineData = [].obs;
  FlutterTts ftts = FlutterTts();

  void refreshData() async {
    final data = await SqlHelper.getItems();
    medecineData.value = data;
    isLoading.value = false;
  }

  Future<void> addItem() async {
    await SqlHelper.createItem(
      medecinenameController.text,
      timeController.text,
      signController.text,
    );
    refreshData();
  }

  Future<void> updateItem(int id) async {
    await SqlHelper.updateItem(id, medecinenameController.text,
        timeController.text, signController.text);
    refreshData();
  }

  void deleteItem(int id, context) async {
    await SqlHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a Student Details!'),
    ));
    refreshData();
  }

  final count = 0.obs;

  @override
  void onInit() {
    refreshData();
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
