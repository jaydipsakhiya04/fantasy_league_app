import 'package:fantasy_triathlon_league/auth/controller/auth_controller.dart';
import 'package:fantasy_triathlon_league/auth/view/create_new_password/view/create_new_password_screen.dart';
import 'package:fantasy_triathlon_league/auth/view/user_data/view/user_data_fill_screen.dart';
import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/widget/common_appbar.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:fantasy_triathlon_league/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpSendScreen extends StatelessWidget {
  OtpSendScreen({super.key});

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments ?? {};
    bool isLogin = argument["isLogin"] ?? false;
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.h.verticalSpace,
            RichText(
              text: TextSpan(
                text: AppStrings.enterTheCodeWeHaveSentTo,
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (isLogin == true)
                        ? _authController
                            .forgotPasswordLoginController.value.text
                        : _authController.emailController.value.text,
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
            8.h.verticalSpace,
            CommonText(
              text: AppStrings.weJustSentYoyuAnEmail,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey,
            ),
            24.h.verticalSpace,
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                controller: _authController.pinController,
                focusNode: _authController.focusNode,
                defaultPinTheme: PinTheme(
                  height: 74.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                  ),
                  textStyle: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w600),
                ),
                focusedPinTheme: PinTheme(
                  height: 74.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    border: Border.all(color: AppColors.black),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                separatorBuilder: (index) => const SizedBox(width: 8),
                onClipboardFound: (value) {
                  debugPrint('onClipboardFound: $value');
                  _authController.pinController.text = value;
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: AppColors.lightGrey,
                  ).paddingSymmetric(vertical: 26.h, horizontal: 13.w),
                ),
              ),
            ),
            10.h.verticalSpace,
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (_authController.minutes.value == 0 &&
                          _authController.seconds.value == 0)
                      ? InkWell(
                          onTap: () {
                            // _authController.resetTimer();
                            _authController.startTimer();
                          },
                          child: Container(
                            padding: EdgeInsets.zero,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.blue))),
                            child: CommonText(
                              text: AppStrings.resendOtp,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.skyBlue,
                            ),
                          ),
                        )
                      : Row(
                          children: [
                            CommonText(
                              text: AppStrings.resentAgainIn,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGrey,
                            ),
                            CommonText(
                              text: _authController.formattedTime(),
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.skyBlue,
                            ),
                          ],
                        ),
                ],
              ),
            ),
            24.h.verticalSpace,
            Obx(
              () => CustomButton(
                isLoader: _authController.isLoading.value,
                onTap: () async {
                  if (_authController.pinController.text.isNotEmpty &&
                      _authController.pinController.text.length == 4) {
                    if (isLogin == true) {
                      await _authController.verifyRegisterDataApi(
                          email: _authController
                              .forgotPasswordLoginController.value.text);
                      Get.to(CreateNewPasswordScreen());
                    } else {
                      await _authController.verifyRegisterDataApi(
                          email: _authController.emailController.value.text);
                    }
                    _authController.pinController.clear();
                    // _authController.resetTimer();
                  } else {
                    Get.snackbar("Otp:", "Please enter valid otp");
                  }
                },
                text: AppStrings.confirm,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                buttonColor: AppColors.indigo,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16.w));
  }
}
