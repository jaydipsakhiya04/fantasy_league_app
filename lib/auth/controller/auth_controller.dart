import 'dart:async';
import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:fantasy_triathlon_league/auth/service/auth_service.dart';
import 'package:fantasy_triathlon_league/auth/view/login/model/login_data_model.dart';
import 'package:fantasy_triathlon_league/auth/view/otp/view/otp_send_screen.dart';
import 'package:fantasy_triathlon_league/auth/view/signup/model/register_data_model.dart';
import 'package:fantasy_triathlon_league/auth/view/user_data/model/user_raw_data_model.dart';
import 'package:fantasy_triathlon_league/auth/view/user_data/view/user_data_fill_screen.dart';
import 'package:fantasy_triathlon_league/create_team/view/create_team_screen.dart';
import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_preferences.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:fantasy_triathlon_league/utils/navigation_route/navigation.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:fantasy_triathlon_league/widget/common_textfield.dart';
import 'package:fantasy_triathlon_league/widget/custom_button.dart';
import 'package:fantasy_triathlon_league/widget/custom_checkbox.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AuthController extends GetxController {
  ///signup
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  ///signin
  Rx<TextEditingController> emailLoginController = TextEditingController().obs;
  Rx<TextEditingController> passwordLoginController =
      TextEditingController().obs;

  ///forgot password
  Rx<TextEditingController> forgotPasswordLoginController =
      TextEditingController().obs;

  ///otp
  TextEditingController pinController = TextEditingController();

  ///userdata
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> createNewPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  TextEditingController ageController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  RxBool isSearch = false.obs;

  final FocusNode focusNode = FocusNode();
  RxInt i = 0.obs;

  ///for select image from gallery

  // Rx<String>? imageFromGallery;
  // Rx<XFile>? imageFromGallery;
  Rxn<XFile> imageFromGallery = Rxn();
  // Future<void> pickImageFromGallery() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     imageFromGallery?.value = XFile(imageFromGallery?.value.path ?? "");
  //   }
  // }

  Future<void> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFromGallery.value = pickedFile;
      print("image--${imageFromGallery.value}");
      print("image 2--${pickedFile}");
    }
  }

  /// for selecting gender

  var selectedOption = ''.obs;
  final options = ['Male', 'Female', 'Other'].obs;

  void setSelectedOption(String option) {
    selectedOption.value = option;
    update();
  }

  /// for country data sheet

  List<Country> countries = <Country>[].obs;
  RxList<Country> filteredCountries = <Country>[].obs;

  void loadCountries() {
    final countryList = [
      'AD',
      'AE',
      'AF',
      'AG',
      'AI',
      'AL',
      'AM',
      'AO',
      'AQ',
      'AR',
      'AS',
      'AT',
      'AU',
      'AW',
      'AX',
      'AZ',
      'BA',
      'BB',
      'BD',
      'BE',
      'BF',
      'BG',
      'BH',
      'BI',
      'BJ',
      'BL',
      'BM',
      'BN',
      'BO',
      'BQ',
      'BR',
      'BS',
      'BT',
      'BV',
      'BW',
      'BY',
      'BZ',
      'CA',
      'CC',
      'CD',
      'CF',
      'CG',
      'CH',
      'CI',
      'CK',
      'CL',
      'CM',
      'CN',
      'CO',
      'CR',
      'CU',
      'CV',
      'CW',
      'CX',
      'CY',
      'CZ',
      'DE',
      'DJ',
      'DK',
      'DM',
      'DO',
      'DZ',
      'EC',
      'EE',
      'EG',
      'EH',
      'ER',
      'ES',
      'ET',
      'FI',
      'FJ',
      'FM',
      'FO',
      'FR',
      'GA',
      'GB',
      'GD',
      'GE',
      'GF',
      'GG',
      'GH',
      'GI',
      'GL',
      'GM',
      'GN',
      'GP',
      'GQ',
      'GR',
      'GT',
      'GU',
      'GW',
      'GY',
      'HK',
      'HM',
      'HN',
      'HR',
      'HT',
      'HU',
      'ID',
      'IE',
      'IL',
      'IM',
      'IN',
      'IO',
      'IQ',
      'IR',
      'IS',
      'IT',
      'JE',
      'JM',
      'JO',
      'JP',
      'KE',
      'KG',
      'KH',
      'KI',
      'KM',
      'KN',
      'KP',
      'KR',
      'KW',
      'KY',
      'KZ',
      'LA',
      'LB',
      'LC',
      'LI',
      'LK',
      'LR',
      'LS',
      'LT',
      'LU',
      'LV',
      'LY',
      'MA',
      'MC',
      'MD',
      'ME',
      'MF',
      'MG',
      'MH',
      'MK',
      'ML',
      'MM',
      'MN',
      'MO',
      'MP',
      'MQ',
      'MR',
      'MS',
      'MT',
      'MU',
      'MV',
      'MW',
      'MX',
      'MY',
      'MZ',
      'NA',
      'NC',
      'NE',
      'NF',
      'NG',
      'NI',
      'NL',
      'NO',
      'NP',
      'NR',
      'NU',
      'NZ',
      'OM',
      'PA',
      'PE',
      'PF',
      'PG',
      'PH',
      'PK',
      'PL',
      'PM',
      'PN',
      'PR',
      'PT',
      'PW',
      'PY',
      'QA',
      'RE',
      'RO',
      'RS',
      'RU',
      'RW',
      'SA',
      'SB',
      'SC',
      'SD',
      'SE',
      'SG',
      'SH',
      'SI',
      'SJ',
      'SK',
      'SL',
      'SM',
      'SN',
      'SO',
      'SR',
      'SS',
      'ST',
      'SV',
      'SX',
      'SY',
      'SZ',
      'TC',
      'TD',
      'TF',
      'TG',
      'TH',
      'TJ',
      'TK',
      'TL',
      'TM',
      'TN',
      'TO',
      'TR',
      'TT',
      'TV',
      'TZ',
      'UA',
      'UG',
      'US',
      'UY',
      'UZ',
      'VA',
      'VC',
      'VE',
      'VG',
      'VI',
      'VN',
      'VU',
      'WF',
      'WS',
      'YE',
      'YT',
      'ZA',
      'ZM',
      'ZW'
    ];
    countries.assignAll(countryList
        .map((code) => Country.tryParse(code))
        .where((country) => country != null)
        .cast<Country>()
        .toList());

    filteredCountries.assignAll(countries);
  }

  void showCountry(BuildContext context) {
    FocusScope.of(context).unfocus();
    RxInt selectedIndex = (-1).obs;
    String selectedCountry = '';
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        FocusNode focusNode = FocusNode();
        return Container(
          height: 0.62.sh,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.middleGrey.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
              24.h.verticalSpace,
              CommonText(
                text: AppStrings.chooseCountry,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              CustomTextField(
                focusNode: focusNode,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    isSearch.value = true;
                    filteredCountries.assignAll(countries
                        .where((element) => element.name
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList());
                    filteredCountries.refresh();

                    // Maintain the selected country index in the filtered list
                    selectedIndex.value = filteredCountries.indexWhere(
                        (element) => element.name == selectedCountry);
                  } else {
                    isSearch.value = false;
                    filteredCountries.assignAll(countries);
                    filteredCountries.refresh();

                    // Maintain the selected country index in the full list
                    selectedIndex.value = countries.indexWhere(
                        (element) => element.name == selectedCountry);
                  }
                },
                hintText: AppStrings.searchCountry,
                borderRadius: BorderRadius.circular(40),
                fillColor: AppColors.lightGrey,
                radius: 40,
                suffix: SvgPicture.asset(
                  ImageAsset.search,
                  height: 24.h,
                  width: 24.h,
                  fit: BoxFit.scaleDown,
                ),
              ).paddingSymmetric(horizontal: 8.w),
              10.h.verticalSpace,
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: filteredCountries.length,
                    itemBuilder: (BuildContext context, int index) {
                      final country = filteredCountries[index];
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            trailing: Obx(
                              () => CustomCheckbox(
                                isChecked: selectedIndex.value == index,
                                onChanged: (value) {
                                  selectedIndex.value =
                                      (value ?? false) ? index : -1;
                                  selectedCountry = (value ?? false)
                                      ? filteredCountries[index].name
                                      : '';
                                },
                                iconSize: 20,
                                checkColor: AppColors.white,
                              ),
                            ),
                            leading: CommonText(
                              text: country.flagEmoji,
                              color: AppColors.black,
                            ),
                            title: CommonText(
                              text: country.name,
                              color: AppColors.black,
                            ),
                            onTap: () {
                              selectedIndex.value = index;
                              selectedCountry = filteredCountries[index].name;
                            },
                          ),
                          Divider(
                            height: 0,
                            color: AppColors.middleGrey.withOpacity(0.2),
                            thickness: 1,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              CustomButton(
                onTap: () {
                  if (selectedIndex.value != -1) {
                    countryController.text = selectedCountry;
                    FocusScope.of(context).unfocus();
                  }
                  Navigator.pop(context);
                },
                text: AppStrings.confirm,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                buttonColor: AppColors.indigo,
              ).paddingOnly(left: 16.w, right: 16.w, bottom: 16.h),
            ],
          ).paddingOnly(
            left: 16.w,
            right: 16.w,
          ),
        );
      },
    );
  }

  ///for decrease timer

  RxInt minutes = 2.obs;
  RxInt seconds = 0.obs;
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (minutes.value == 0 && seconds.value == 0) {
        _timer?.cancel();
      } else {
        if (seconds.value == 0) {
          minutes.value--;
          seconds.value = 59;
        } else {
          seconds.value--;
        }
      }
    });
  }

  String formattedTime() {
    String minStr = minutes.value.toString().padLeft(2, '0');
    String secStr = seconds.value.toString().padLeft(2, '0');
    String suffix = minutes.value != 0 ? "Min" : "Sec";
    return "$minStr:$secStr $suffix";
  }

  // void resetTimer() {
  //   _timer?.cancel();
  //   _timer = null;
  //   minutes.value = 2;
  //   seconds.value = 0;
  // }

  ///for selecting date of birth
  DateTime dateTime = DateTime.now();

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1985),
        lastDate: DateTime.now());
    if (picked != null) {
      dateTime = picked;
      ageController.text = DateFormat('dd/MM/yyyy').format(dateTime);
    }
  }

  RxBool isLoading = false.obs;

  Rx<RegisterApiDataModel> registerData = RegisterApiDataModel().obs;
  Future registerDataApi() async {
    try {
      isLoading.value = true;
      RegisterApiDataModel registerData = await AuthService.registerApi(
          email: emailController.value.text,
          password: passwordController.value.text);
      await AppPreference.setUserToken(registerData.token ?? "");

      Navigation.push(OtpSendScreen());
      // resetTimer();
      startTimer();
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      print("registerDataApi()---$e $st");
    }
  }

  Future verifyRegisterDataApi({required String email}) async {
    try {
      isLoading.value = true;
      await AuthService.verifyRegisterApi(
          email: email, otp: pinController.text);
      Get.to(UserDataFillScreen());
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      print("verifyRegisterDataApi()---$e $st");
    }
  }

  Future loginApi() async {
    try {
      isLoading.value = true;
      LoginDataModel registerData = await AuthService.loginApi(
          email: emailLoginController.value.text,
          password: passwordLoginController.value.text);
      Get.to(CreateTeamScreen());
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      print("loginApi()---$e $st");
    }
  }

  Future forgotPasswordApi() async {
    try {
      isLoading.value = true;
      await AuthService.forgotPasswordApi(
          email: forgotPasswordLoginController.value.text);
      Get.to(
        OtpSendScreen(),
        arguments: {"isLogin": true},
      );
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      print("forgotPasswordApi()---$e $st");
    }
  }

  Future registerUserData() async {
    try {
      isLoading.value = true;
      await AuthService.userDataApiCalling(
          userDataRawModel: UserRawDataModel(
        email: emailController.value.text,
        age: ageController.text,
        caption: captionController.text,
        country: countryController.text,
        firstName: firstNameController.value.text,
        gender: genderController.text,
        lastName: lastNameController.value.text,
        profileImg: imageFromGallery.value,
      ));
      i.value++;
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      print("registerUserData()---$e $st");
    }
  }

  Future passwordChange() async {
    try {
      isLoading.value = true;
      AuthService.newPasswordSet(
          email: emailLoginController.value.text,
          password: createNewPasswordController.value.text);
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      print("passwordChange()---$e $st");
    }
  }
}
