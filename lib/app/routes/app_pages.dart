import 'package:get/get.dart';

import '../modules/addmedicin/bindings/addmedicin_binding.dart';
import '../modules/addmedicin/views/addmedicin_view.dart';
import '../modules/otppage/bindings/otppage_binding.dart';
import '../modules/otppage/views/otppage_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/ttf/bindings/ttf_binding.dart';
import '../modules/ttf/views/ttf_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.REGISTRATION;

  static final routes = [
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.ADDMEDICIN,
      page: () => const AddmedicinView(),
      binding: AddmedicinBinding(),
    ),
    GetPage(
      name: _Paths.OTPPAGE,
      page: () => const OtppageView(),
      binding: OtppageBinding(),
    ),
    GetPage(
      name: _Paths.TTF,
      page: () => const TtfView(),
      binding: TtfBinding(),
    ),
  ];
}
