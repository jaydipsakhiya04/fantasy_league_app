import 'package:fantasy_triathlon_league/auth/controller/auth_controller.dart';
import 'package:fantasy_triathlon_league/auth/view/forgot_password/view/forgot_password_screen.dart';
import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:fantasy_triathlon_league/utils/validation.dart';
import 'package:fantasy_triathlon_league/widget/common_appbar.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:fantasy_triathlon_league/widget/common_textfield.dart';
import 'package:fantasy_triathlon_league/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController _authController = Get.find();
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(),
      body: Form(
        key: loginKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.h.verticalSpace,
            CommonText(
              text: AppStrings.welcomeBack,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            8.h.verticalSpace,
            CommonText(
              text: AppStrings.putzyourTriathlon,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey,
            ),
            24.h.verticalSpace,
            Obx(
              () => CustomTextField(
                controller: _authController.emailLoginController.value,
                label: AppStrings.email,
                hintText: "name@example.com",
                validator: (value) => Validation.emailValidator(value),
                fillColor:
                    _authController.emailLoginController.value.text.isEmpty
                        ? AppColors.white
                        : AppColors.lightGrey,
                onChanged: (value) {
                  _authController.emailLoginController.refresh();
                },
              ),
            ),
            16.h.verticalSpace,
            Obx(
              () => CustomTextField(
                // validator: (value) => Validation.passwordValidator(value),
                controller: _authController.passwordLoginController.value,
                label: AppStrings.password,
                hintText: AppStrings.typePassword,
                isPassword: true,
                fillColor:
                    _authController.passwordLoginController.value.text.isEmpty
                        ? AppColors.white
                        : AppColors.lightGrey,
                onChanged: (value) {
                  _authController.passwordLoginController.refresh();
                },
              ),
            ),
            4.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(ForgotPasswordScreen(), arguments: {
                      "emailValue":
                          _authController.emailLoginController.value.text
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CommonText(
                      textDecoration: TextDecoration.underline,
                      text: AppStrings.forgotPassword,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.indigo,
                    ),
                  ),
                ),
              ],
            ),
            32.h.verticalSpace,
            Obx(
              () => CustomButton(
                isLoader: _authController.isLoading.value,
                onTap: () async {
                  if (loginKey.currentState?.validate() ?? false) {
                    await _authController.loginApi();
                  }
                },
                text: AppStrings.signIn,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                buttonColor: AppColors.indigo,
              ),
            ),
            24.h.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Divider(
                  thickness: 1,
                  color: AppColors.middleGrey.withOpacity(0.2),
                )),
                CommonText(
                  text: "or",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.middleGrey,
                ).paddingSymmetric(horizontal: 8.w),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: AppColors.middleGrey.withOpacity(0.2),
                  ),
                ),
              ],
            ),
            30.h.verticalSpace,
            CustomButton(
              onTap: () {},
              svg: ImageAsset.google,
              text: AppStrings.continueWithGoogle,
              textColor: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              buttonColor: AppColors.lightGrey,
            ),
            12.h.verticalSpace,
            CustomButton(
              onTap: () {},
              svg: ImageAsset.apple,
              text: AppStrings.continueWithGoogle,
              textColor: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              buttonColor: AppColors.lightGrey,
            ),
          ],
        ).paddingSymmetric(horizontal: 16.w),
      ),
    );
  }
}
