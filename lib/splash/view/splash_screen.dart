import 'package:fantasy_triathlon_league/onboarding/view/onboarding_screen.dart';
import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(
        OnboardingScreen(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonText(
            text: AppStrings.splashIntro,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          8.h.verticalSpace,
          Container(
            width: 230.w,
            height: 1.5.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.3),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ).paddingSymmetric(horizontal: 66.w)
        ],
      ).paddingOnly(bottom: 16.h),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAsset.splashBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SvgPicture.asset(
          ImageAsset.splashLogo,
          height: 80.h,
          width: 220.w,
        ),
      ),
    );
  }
}
