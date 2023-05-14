import 'package:get/get.dart';

import '../controllers/ttf_controller.dart';

class TtfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TtfController>(
      () => TtfController(),
    );
  }
}
