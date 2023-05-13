import 'package:get/get.dart';

import '../controllers/addmedicin_controller.dart';

class AddmedicinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddmedicinController>(
      () => AddmedicinController(),
    );
  }
}
