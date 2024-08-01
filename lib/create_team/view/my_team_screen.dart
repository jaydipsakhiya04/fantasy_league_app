import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:fantasy_triathlon_league/utils/navigation_route/navigation.dart';
import 'package:fantasy_triathlon_league/widget/common_appbar.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:fantasy_triathlon_league/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'team_detail_screen.dart';

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          15.h.verticalSpace,
          CommonText(
            text: AppStrings.myTeam,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ).paddingSymmetric(horizontal: 16.w),
          8.h.verticalSpace,
          CommonText(
            text: AppStrings.selectFiveMaleAndFemale,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
          ).paddingSymmetric(horizontal: 16.w),
          40.h.verticalSpace,
          Row(
            children: [
              CommonText(
                text: AppStrings.maleAthletes,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ).paddingSymmetric(horizontal: 16.w),
              36.w.horizontalSpace,
              CommonText(
                text: AppStrings.femaleAthletes,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ).paddingSymmetric(horizontal: 16.w),
              40.h.verticalSpace,
            ],
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: AppColors.darkGrey.withOpacity(0.2)),
                        bottom: BorderSide(
                            color: (index == 4)
                                ? AppColors.darkGrey.withOpacity(0.2)
                                : Colors.transparent)),
                  ),
                  padding: EdgeInsets.only(
                      left: 16.w, top: 16.h, bottom: 16.h, right: 53.w),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ClipOval(
                            child: Container(
                              height: 36.h,
                              width: 36.h,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                              ),
                              child: Image.asset(
                                ImageAsset.profilePic,
                              ),
                            ),
                          ),
                          Image.asset(
                            ImageAsset.flg,
                            height: 16,
                            width: 16.w,
                          ),
                        ],
                      ),
                      10.w.horizontalSpace,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonText(
                            text: AppStrings.markKelly,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                          CommonText(
                            text: "1245 pts",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGrey,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: AppColors.darkGrey.withOpacity(0.2)),
                        left: BorderSide(
                            color: AppColors.darkGrey.withOpacity(0.2)),
                        bottom: BorderSide(
                            color: (index == 4)
                                ? AppColors.darkGrey.withOpacity(0.2)
                                : Colors.transparent)),
                  ),
                  padding: EdgeInsets.only(
                      right: 16.w, top: 16.h, bottom: 16.h, left: 53.w),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonText(
                            text: AppStrings.markKelly,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                          CommonText(
                            text: "1245 pts",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGrey,
                          ),
                        ],
                      ),
                      10.w.horizontalSpace,
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          ClipOval(
                            child: Container(
                              height: 36.h,
                              width: 36.h,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                              ),
                              child: Image.asset(
                                ImageAsset.female,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Image.asset(
                            ImageAsset.flg,
                            height: 16,
                            width: 16.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          28.h.verticalSpace,
          CustomButton(
            onTap: () async {},
            text: AppStrings.ediTeam,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            buttonColor: AppColors.white,
            textColor: AppColors.indigo,
            buttonBorderColor: AppColors.indigo,
          ).paddingSymmetric(horizontal: 16.w),
          12.h.verticalSpace,
          CustomButton(
            onTap: () async {
              Navigation.push(TeamDetailScreen());
            },
            text: AppStrings.lockTeam,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            buttonColor: AppColors.indigo,
            textColor: AppColors.white,
          ).paddingSymmetric(horizontal: 16.w),
        ],
      ),
    );
  }
}
