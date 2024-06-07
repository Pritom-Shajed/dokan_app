import 'dart:async';
import 'dart:io';
import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/helper/helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:dokan_app/helper/dependencies/dependencies.dart' as dep;

abstract class Initializer {
  static void init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return AppErrorWidget(message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        Get.printInfo(info: details.stack.toString());
      };

      await _initServices();

      await Future.delayed(const Duration(milliseconds: 150));

      FlutterNativeSplash.remove();
      runApp();
    }, (error, stack) {
      Get.printInfo(info: 'runZonedGuarded: ${error.toString()}');
    });
  }

  static Future<void> _initServices() async {
    try {

      _initScreenPreference();

      _initHttp();

      await _initStorage();

      await _loadEnv();

      await _dependencyInjection();

    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initStorage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.put(sharedPreferences, permanent: true);
  }

  static void _initHttp (){
    HttpOverrides.global = MyHttpOverrides();
  }

  static Future<void> _loadEnv () async {
    await dotenv.load(fileName: Environment.fileName);
  }

  static Future<void> _dependencyInjection () async {
    await dep.init();
  }


  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}