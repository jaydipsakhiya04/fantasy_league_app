import 'package:fantasy_triathlon_league/auth/controller/auth_controller.dart';
import 'package:fantasy_triathlon_league/create_team/controller/create_team_controller.dart';
import 'package:fantasy_triathlon_league/create_team/view/select_athlete_screen.dart';
import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/navigation_route/navigation.dart';
import 'package:fantasy_triathlon_league/utils/validation.dart';
import 'package:fantasy_triathlon_league/widget/common_appbar.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:fantasy_triathlon_league/widget/common_textfield.dart';
import 'package:fantasy_triathlon_league/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateTeamScreen extends StatelessWidget {
  CreateTeamScreen({super.key});

  final CreateTeamController _createTeamController =
      Get.put(CreateTeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Form(
        key: _createTeamController.teamKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: AppStrings.createATeam,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            8.h.verticalSpace,
            CommonText(
              text: AppStrings.createYourUnique,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey,
            ),
            24.h.verticalSpace,
            Obx(
              () => CustomTextField(
                controller: _createTeamController.teamNameController.value,
                label: AppStrings.teamName,
                hintText: AppStrings.enterYourTeamName,
                validator: (value) => Validation.nameValidator(value),
                fillColor:
                    _createTeamController.teamNameController.value.text.isEmpty
                        ? AppColors.white
                        : AppColors.lightGrey,
                onChanged: (value) {
                  _createTeamController.teamNameController.refresh();
                },
              ),
            ),
            24.h.verticalSpace,
            CustomButton(
              onTap: () async {
                Navigation.push(SelectAthleteScreen());
              },
              text: AppStrings.selectAthletes,
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
