import 'package:fantasy_triathlon_league/auth/controller/auth_controller.dart';
import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/widget/common_appbar.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:fantasy_triathlon_league/widget/common_textfield.dart';
import 'package:fantasy_triathlon_league/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          15.h.verticalSpace,
          CommonText(
            text: "${AppStrings.createNewPassword}.",
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          8.h.verticalSpace,
          CommonText(
            text: AppStrings.createNewPasswordForYorAccount,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
          ),
          24.h.verticalSpace,
          Obx(
            () => CustomTextField(
              controller: _authController.createNewPasswordController.value,
              label: AppStrings.createNewPassword,
              isPassword: true,
              hintText: AppStrings.createNewPassword,
              fillColor:
                  _authController.createNewPasswordController.value.text.isEmpty
                      ? AppColors.white
                      : AppColors.lightGrey,
              onChanged: (value) {
                _authController.createNewPasswordController.refresh();
              },
            ),
          ),
          16.h.verticalSpace,
          Obx(
            () => CustomTextField(
              controller: _authController.confirmPasswordController.value,
              label: AppStrings.confirmPassword,
              hintText: AppStrings.confirmPassword,
              isPassword: true,
              fillColor:
                  _authController.confirmPasswordController.value.text.isEmpty
                      ? AppColors.white
                      : AppColors.lightGrey,
              onChanged: (value) {
                _authController.confirmPasswordController.refresh();
              },
            ),
          ),
          32.h.verticalSpace,
          Obx(
            () => CustomButton(
              isLoader: _authController.isLoading.value,
              onTap: () {
                _authController.passwordChange();
              },
              text: AppStrings.confirm,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              buttonColor: AppColors.indigo,
            ),
          ),
          24.h.verticalSpace,
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}
