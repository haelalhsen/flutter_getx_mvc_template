import 'package:get/get.dart';

import '../modules/add_address/bindings/add_address_binding.dart';
import '../modules/add_address/views/add_address_view.dart';
import '../modules/add_new_card/bindings/add_new_card_binding.dart';
import '../modules/add_new_card/views/add_new_card_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    // GetPage(
    //   name: _Paths.PROJECT_DETAILS,
    //   page: () => const ProjectDetailsView(),
    //   binding: ProjectDetailsBinding(),
    //   showCupertinoParallax: true,
    //   transition: Transition.rightToLeft,
    // ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ADDRESS,
      page: () => const AddAddressView(),
      binding: AddAddressBinding(),
      showCupertinoParallax: true,
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.ADD_NEW_CARD,
      page: () => const AddNewCardView(),
      binding: AddNewCardBinding(),
      showCupertinoParallax: true,
      transition: Transition.rightToLeft,
    ),
  ];
}
