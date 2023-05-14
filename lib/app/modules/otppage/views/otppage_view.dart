import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/text_field.dart';
import '../controllers/otppage_controller.dart';

class OtppageView extends GetView<OtppageController> {
  const OtppageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                    child: const Icon(
                      Icons.message,
                      size: 90,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    child: const Text(
                      'Verification Code',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    child: const Text(
                      'Please enter the OTP sent to your email',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    child: Form(
                      key: controller.formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .2,
                              child: TextFormFieldData.getTextFormField(
                                  context, controller.firstOtp)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .2,
                            child: TextFormFieldData.getTextFormField(
                                context, controller.secondOtp),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .2,
                              child: TextFormFieldData.getTextFormField(
                                  context, controller.thirdOtp)),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .2,
                              child: TextFormFieldData.getTextFormField(
                                  context, controller.fourthOtp)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.toNamed(Routes.ADDMEDICIN);
                          // if (controller.formKey.currentState!.validate()) {
                          //   debugPrint(
                          //       "The pin code is : ${controller.firstOtp.text} ${controller.secondOtp.text} ${controller.thirdOtp.text} ${controller.fourthOtp.text}");
                          // } else {
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(const SnackBar(
                          //           backgroundColor: Colors.white,
                          //           elevation: 0,
                          //           duration: Duration(seconds: 1),
                          //           content: Text(
                          //             " OTP can't be null ",
                          //             style: TextStyle(
                          //                 color: Colors.black,
                          //                 fontSize: 20,
                          //                 fontWeight: FontWeight.bold),
                          //           )));
                          // }
                        },
                        child: const Text('verify'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
