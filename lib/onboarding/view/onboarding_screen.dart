import 'package:fantasy_triathlon_league/auth/view/login/login_screen.dart';
import 'package:fantasy_triathlon_league/auth/view/signup/view/sign_up_screen.dart';
import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:fantasy_triathlon_league/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Background image
          Container(
            height: 556.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageAsset.onboardingBg2,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.white.withOpacity(0.2),
                  AppColors.white.withOpacity(0.4),
                  AppColors.white.withOpacity(0.7),
                  AppColors.white,
                  AppColors.white,
                  AppColors.white,
                  AppColors.white,
                  AppColors.white.withOpacity(0.9),
                  AppColors.white.withOpacity(0.9),
                  AppColors.white.withOpacity(1),
                  AppColors.white,
                  AppColors.white,
                ],
              ),
            ),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonText(
                text: AppStrings.welcomeText,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              CommonText(
                text: AppStrings.fantasyTriathlonLeague,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              12.h.verticalSpace,
              CommonText(
                text: AppStrings.onBordingText,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.darkGrey,
              ),
              30.h.verticalSpace,
              CustomButton(
                onTap: () {
                  Get.to(SignUpScreen());
                },
                text: AppStrings.getStarted,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                buttonColor: AppColors.indigo,
              ),
              32.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: AppStrings.alreadyOnFantasy,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: CommonText(
                        textDecoration: TextDecoration.underline,
                        text: AppStrings.signIn,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.indigo,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, bottom: 24.h),
        ],
      ),
    );
  }
}
