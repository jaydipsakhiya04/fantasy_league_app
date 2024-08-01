import 'package:fantasy_triathlon_league/auth/controller/auth_controller.dart';
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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthController _authController = Get.find();
  final signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(),
      body: Form(
        key: signUpKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.h.verticalSpace,
            CommonText(
              text: AppStrings.createYourAccount,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            8.h.verticalSpace,
            CommonText(
              text: AppStrings.youCantGetFar,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey,
            ),
            24.h.verticalSpace,
            Obx(
              () => CustomTextField(
                controller: _authController.emailController.value,
                label: AppStrings.email,
                hintText: "name@example.com",
                fillColor: _authController.emailController.value.text.isEmpty
                    ? AppColors.white
                    : AppColors.lightGrey,
                onChanged: (value) {
                  _authController.emailController.refresh();
                },
                validator: (value) => Validation.emailValidator(value),
              ),
            ),
            16.h.verticalSpace,
            Obx(
              () => CustomTextField(
                controller: _authController.passwordController.value,
                label: AppStrings.password,
                hintText: "Set password",
                isPassword: true,
                fillColor: _authController.passwordController.value.text.isEmpty
                    ? AppColors.white
                    : AppColors.lightGrey,
                onChanged: (value) {
                  _authController.passwordController.refresh();
                },
                validator: (value) => Validation.passwordValidator(value),
              ),
            ),
            32.h.verticalSpace,
            Obx(
              () => CustomButton(
                isLoader: _authController.isLoading.value,
                onTap: () async {
                  if (signUpKey.currentState?.validate() ?? false) {
                    await _authController.registerDataApi();
                  }
                },
                text: AppStrings.signUp,
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
