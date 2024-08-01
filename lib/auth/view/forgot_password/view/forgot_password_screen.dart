import 'package:fantasy_triathlon_league/auth/controller/auth_controller.dart';
import 'package:fantasy_triathlon_league/auth/view/otp/view/otp_send_screen.dart';
import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/validation.dart';
import 'package:fantasy_triathlon_league/widget/common_appbar.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:fantasy_triathlon_league/widget/common_textfield.dart';
import 'package:fantasy_triathlon_league/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final AuthController _authController = Get.put(AuthController());
  final forgotPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final String? emailArgument = Get.arguments["emailValue"] ?? "";
    if (emailArgument != null) {
      _authController.forgotPasswordLoginController.value.text = emailArgument;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(),
      body: Form(
        key: forgotPasswordKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.h.verticalSpace,
            CommonText(
              text: AppStrings.forgotPassword,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            8.h.verticalSpace,
            CommonText(
              text: AppStrings.dontWorryWeHave,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey,
            ),
            24.h.verticalSpace,
            Obx(
              () => CustomTextField(
                validator: (value) => Validation.emailValidator(value),
                controller: _authController.forgotPasswordLoginController.value,
                label: AppStrings.email,
                hintText: "name@example.com",
                fillColor: _authController
                        .forgotPasswordLoginController.value.text.isEmpty
                    ? AppColors.white
                    : AppColors.lightGrey,
                onChanged: (value) {
                  _authController.forgotPasswordLoginController.refresh();
                },
              ),
            ),
            32.h.verticalSpace,
            CustomButton(
              onTap: () async {
                if (forgotPasswordKey.currentState?.validate() ?? false) {
                  await _authController.forgotPasswordApi();
                  // _authController.resetTimer();
                  _authController.startTimer();
                  // Get.to(
                  //   OtpSendScreen(),
                  //   arguments: {"isLogin": true},
                  // );
                }
                _authController.startTimer();
              },
              text: AppStrings.verify,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              buttonColor: AppColors.indigo,
            ),
          ],
        ).paddingSymmetric(horizontal: 16.w),
      ),
    );
  }
}
