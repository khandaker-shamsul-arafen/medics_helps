import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegistrationView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: controller.name,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: const OutlineInputBorder(),
                  errorText: (controller.name.text.isEmpty)
                      ? controller.validate.value
                          ? 'Name Can\'t Be Empty'
                          : null
                      : null,
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                  labelText: "phone",
                  border: const OutlineInputBorder(),
                  errorText: (controller.phone.text.isEmpty)
                      ? controller.validate.value
                          ? 'Phone Number Can\'t Be Empty'
                          : null
                      : null,
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.age,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                  labelText: "Age",
                  border: const OutlineInputBorder(
                      //  borderSide: BorderSide(color: Colors.deepPurpleAccent)
                      ),
                  errorText: (controller.age.text.isEmpty)
                      ? controller.validate.value
                          ? 'Age Can\'t Be Empty'
                          : null
                      : null,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (controller.name.text.isEmpty ||
                      controller.age.text.isEmpty ||
                      controller.phone.text.isEmpty) {
                    controller.validate.value = true;
                  } else {
                    Get.toNamed(Routes.OTPPAGE);
                  }
                },
                child: const Text('Submit'),
              )
            ],
          );
        }),
      ),
    );
  }
}
