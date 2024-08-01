import 'dart:io';
import 'package:fantasy_triathlon_league/auth/controller/auth_controller.dart';
import 'package:fantasy_triathlon_league/onboarding/view/onboarding_screen.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserDataFillScreen extends StatelessWidget {
  UserDataFillScreen({super.key});

  final AuthController _authController = Get.put(AuthController());
  RxBool isCheck = false.obs;
  final userDetailKey = GlobalKey<FormState>();
  final userPersonalDetailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (_authController.i.value == 2)
                ? 16.h.verticalSpace
                : 0.h.verticalSpace,
            (_authController.i.value == 2)
                ? Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Checkbox(
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => BorderSide(
                                    width: 1.0,
                                    color:
                                        AppColors.middleGrey.withOpacity(0.3)),
                              ),
                              value: isCheck.value,
                              onChanged: (value) {
                                isCheck.value = value ?? false;
                              },
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: [
                            CommonText(
                              text: AppStrings.iAcceptAllTheAboveTerms,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 16.w, right: 16.w, bottom: 10.h)
                : const SizedBox.shrink(),
            Obx(
              () => CustomButton(
                isLoader: _authController.isLoading.value,
                onTap: () async {
                  if (_authController.i.value == 0) {
                    if (userDetailKey.currentState?.validate() ?? false) {
                      // await _authController.registerUserData();
                      _authController.i.value++;
                    }
                  } else if (_authController.i.value == 1) {
                    if ((userPersonalDetailKey.currentState?.validate() ??
                        false)) {
                      if (_authController.imageFromGallery.value != null) {
                        await _authController.registerUserData();
                      } else {
                        Get.snackbar(
                            "image is required :-", "please select a image");
                      }
                    }
                  } else if (_authController.i.value == 2) {
                    if (isCheck.isTrue) {
                      Get.offAll(const OnboardingScreen());
                      _authController.i.value = 0;
                    }
                  } else if (_authController.i.value == 3) {}
                },
                text: (_authController.i.value == 2)
                    ? AppStrings.acceptAndFinish
                    : AppStrings.next,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                buttonColor: AppColors.indigo,
              ).paddingOnly(left: 16.w, right: 16.w, bottom: 16.h),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        onTap: () {
          if (_authController.i.value == 2 || _authController.i.value == 1) {
            _authController.i.value--;
          } else if (_authController.i.value == 0) {
            Get.back();
          }
        },
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => RichText(
                  text: TextSpan(
                    text: "${_authController.i.value + 1}",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '/3 Steps',
                        style: TextStyle(
                          color: AppColors.middleGrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).paddingOnly(right: 16.w),
        ],
      ),
      body: Column(
        children: [
          swipeIndicator(),
          Obx(
            () => _authController.i.value == 0
                ? userDatails(context)
                : _authController.i.value == 1
                    ? userPersonalDetails()
                    : _authController.i.value == 2
                        ? termsAndConditions()
                        : SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget userDatails(BuildContext context) {
    return Obx(
      () => Form(
        key: userDetailKey,
        child: Expanded(
          child: ListView(
            children: [
              24.h.verticalSpace,
              CommonText(
                text: AppStrings.kindlyFillInYourPesonalInformation,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              8.h.verticalSpace,
              CommonText(
                text: AppStrings.weJustNeedToKnow,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.darkGrey,
              ),
              24.h.verticalSpace,
              CustomTextField(
                controller: _authController.firstNameController.value,
                label: AppStrings.firstName,
                hintText: AppStrings.typeYourFirstName,
                fillColor:
                    _authController.firstNameController.value.text.isEmpty
                        ? AppColors.white
                        : AppColors.lightGrey,
                onChanged: (value) {
                  _authController.firstNameController.refresh();
                },
                validator: (value) => Validation.nameValidator(value),
              ),
              16.h.verticalSpace,
              CustomTextField(
                controller: _authController.lastNameController.value,
                label: AppStrings.lastName,
                hintText: AppStrings.typeYourLastName,
                fillColor: _authController.lastNameController.value.text.isEmpty
                    ? AppColors.white
                    : AppColors.lightGrey,
                onChanged: (value) {
                  _authController.lastNameController.refresh();
                },
                validator: (value) => Validation.nameValidator(value),
              ),
              16.h.verticalSpace,
              CustomTextField(
                keyboardType: TextInputType.none,
                readOnly: true,
                controller: _authController.countryController,
                label: AppStrings.country,
                hintText: AppStrings.selectCountry,
                validator: (value) => Validation.nameValidator(value),
                suffix: GestureDetector(
                  onTap: () {
                    _authController.loadCountries();
                    _authController.showCountry(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(2),
                    color: Colors.transparent,
                    child: SvgPicture.asset(
                      ImageAsset.down,
                      fit: BoxFit.scaleDown,
                      height: 22.h,
                      width: 22.h,
                    ),
                  ),
                ),
              ),
              16.h.verticalSpace,
              CustomTextField(
                keyboardType: TextInputType.none,
                readOnly: true,
                validator: (value) => Validation.nameValidator(value),
                controller: _authController.genderController,
                label: AppStrings.gender,
                hintText: AppStrings.selectGender,
                suffix: PopupMenuButton<String>(
                  color: AppColors.white,
                  icon: SvgPicture.asset(
                    ImageAsset.down,
                    fit: BoxFit.scaleDown,
                    height: 22.h,
                    width: 22.h,
                  ),
                  onSelected: (String value) {
                    _authController.setSelectedOption(value);
                    _authController.genderController.text =
                        _authController.selectedOption.value;
                  },
                  itemBuilder: (BuildContext context) {
                    return _authController.options
                        .map<PopupMenuItem<String>>((String value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList();
                  },
                ),
              ),
              16.h.verticalSpace,
              CustomTextField(
                keyboardType: TextInputType.none,
                validator: (value) => Validation.nameValidator(value),
                onTap: () {
                  _authController.selectDate(context);
                },
                readOnly: true,
                controller: _authController.ageController,
                label: AppStrings.age,
                hintText: AppStrings.ddMMYY,
              ),
              24.h.verticalSpace,
            ],
          ).paddingSymmetric(horizontal: 16.w),
        ),
      ),
    );
  }

  Widget userPersonalDetails() {
    final galleryImage = _authController.imageFromGallery.value;
    return Form(
      key: userPersonalDetailKey,
      child: Column(
        children: [
          24.h.verticalSpace,
          CommonText(
            text: AppStrings.kindlyFillInYourPesonalInformation,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          8.h.verticalSpace,
          CommonText(
            text: AppStrings.personaliseYourProfile,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
          ),
          24.h.verticalSpace,
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              InkWell(
                onTap: () {
                  (galleryImage != null)
                      ? _authController.pickImageFromGallery()
                      : _authController.pickImageFromGallery();
                },
                child: ClipOval(
                  child: Container(
                    height: 110.h,
                    width: 110.h,
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(60)),
                    child: galleryImage != null
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.file(
                                File(galleryImage.path),
                                fit: BoxFit.cover,
                              ),
                              ClipOval(
                                clipBehavior: Clip.none,
                                child: Container(
                                  height: 110.h,
                                  width: 110.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(60)),
                                ),
                              ),
                              SvgPicture.asset(
                                ImageAsset.edit,
                                height: 17.h,
                                width: 17.h,
                                fit: BoxFit.scaleDown,
                              ),
                            ],
                          )
                        : SvgPicture.asset(
                            ImageAsset.image,
                            height: 27.h,
                            width: 27.h,
                            fit: BoxFit.scaleDown,
                          ),
                  ),
                ),
              ),
              (galleryImage == null)
                  ? InkWell(
                      onTap: () {
                        _authController.pickImageFromGallery();
                      },
                      child: Container(
                          padding: EdgeInsets.all(4.r),
                          height: 36.h,
                          width: 36.w,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(60)),
                          child: SvgPicture.asset(ImageAsset.camera)),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          24.h.verticalSpace,
          CustomTextField(
            controller: _authController.captionController,
            validator: (value) => Validation.nameValidator(value),
            maxLine: 4,
            label: AppStrings.aCaption,
            hintText: AppStrings.thisIsMyMotivation,
          )
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }

  Widget swipeIndicator() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: (_authController.i.value == 0)
                    ? AppColors.black
                    : AppColors.middleGrey.withOpacity(0.2),
              ),
            ).paddingOnly(right: 8.w),
          ),
          Expanded(
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: (_authController.i.value == 1)
                    ? AppColors.black
                    : AppColors.middleGrey.withOpacity(0.2),
              ),
            ).paddingOnly(right: 8.w),
          ),
          Expanded(
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: (_authController.i.value == 2)
                    ? AppColors.black
                    : AppColors.middleGrey.withOpacity(0.2),
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }

  Widget termsAndConditions() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                24.h.verticalSpace,
                CommonText(
                  text: AppStrings.termsAndConditions,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                20.h.verticalSpace,
                Divider(
                  height: 0,
                  color: AppColors.darkGrey.withOpacity(0.2),
                  thickness: 1,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                24.h.verticalSpace,
                CommonText(
                  text: AppStrings.dummyText1,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                ),
                12.h.verticalSpace,
                CommonText(
                  text: AppStrings.dummyText2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                ),
                12.h.verticalSpace,
                CommonText(
                  text: AppStrings.dummyText3,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                ),
                12.h.verticalSpace,
                CommonText(
                  text: AppStrings.dummyText3,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                ),
                12.h.verticalSpace,
                CommonText(
                  text: AppStrings.dummyText3,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
