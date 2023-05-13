import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addmedicin_controller.dart';

class AddmedicinView extends GetView<AddmedicinController> {
  const AddmedicinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddmedicinView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddmedicinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
