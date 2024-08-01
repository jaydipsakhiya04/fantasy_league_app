import 'package:fantasy_triathlon_league/auth/controller/auth_controller.dart';
import 'package:fantasy_triathlon_league/create_team/view/select_athlete_screen.dart';
import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'splash/view/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppPreference.initMySharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            fontFamily: "General Sans",
          ),
          home: SplashScreen(),
          initialBinding: AppBinding(),
        );
      },
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
