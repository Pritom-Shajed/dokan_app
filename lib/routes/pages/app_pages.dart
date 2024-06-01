import 'package:dokan_app/modules/auth/auth.dart';
import 'package:dokan_app/modules/splash/splash.dart';
import 'package:get/get.dart';

part '../routes/app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    ///AUTH
    //SIGN IN
    GetPage(
      name: Routes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SingInBinding()
    ),

    //SIGN UP
    GetPage(
        name: Routes.SIGN_UP,
        page: () => const SignUpPage(),
        binding: SingUnBinding()
    ),
  ];
}