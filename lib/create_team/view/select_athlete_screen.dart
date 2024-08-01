import 'package:fantasy_triathlon_league/create_team/controller/select_athlete_controller.dart';
import 'package:fantasy_triathlon_league/create_team/view/my_team_screen.dart';
import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:fantasy_triathlon_league/utils/navigation_route/navigation.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:fantasy_triathlon_league/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SelectAthleteScreen extends StatelessWidget {
  SelectAthleteScreen({super.key});

  final SelectAthleteController _athleteController =
      Get.put(SelectAthleteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.indigo,
        title: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: SvgPicture.asset(ImageAsset.whiteBackButton),
                  ),
                ),
              ],
            ),
            16.w.horizontalSpace,
            CommonText(
              text: AppStrings.selectAthlete,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
            const Spacer(),
            SvgPicture.asset(
              ImageAsset.search,
              height: 20.h,
              width: 20.h,
              fit: BoxFit.scaleDown,
              color: AppColors.white,
            ),
          ],
        ).paddingOnly(top: 16.h, bottom: 16.h),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(85.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              16.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: AppStrings.male,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                      3.h.verticalSpace,
                      Obx(
                        () => RichText(
                          text: TextSpan(
                            text: "${_athleteController.selectedMale.length}",
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '/5',
                                style: TextStyle(
                                  color: AppColors.white.withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  CommonText(
                    text: AppStrings.maximumOfAthlete,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: AppStrings.female,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                      3.h.verticalSpace,
                      Obx(
                        () => RichText(
                          text: TextSpan(
                            text: "${_athleteController.selectedFemale.length}",
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '/5',
                                style: TextStyle(
                                  color: AppColors.white.withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              10.h.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  10,
                  (index) => Flexible(
                    child: Obx(
                      () => Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              right: 4.w,
                            ),
                            height: 15.h,
                            transform: Matrix4.skewX(-.3),
                            decoration: BoxDecoration(
                              color: index <
                                      (_athleteController.selectedMale.length +
                                          _athleteController
                                              .selectedFemale.length)
                                  ? AppColors.white
                                  : AppColors.lightPurple,
                            ),
                          ),
                          (index <
                                  (_athleteController.selectedMale.length +
                                      _athleteController.selectedFemale.length))
                              ? CommonText(
                                  text: (index == 9)
                                      ? "${index + 1}"
                                      : "0${index + 1}",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.indigo,
                                ).paddingOnly(right: 7, bottom: 2)
                              : (index == 9)
                                  ? CommonText(
                                      text: "${index + 1}",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ).paddingOnly(right: 7, bottom: 2)
                                  : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).marginOnly(left: 18, right: 12.w, bottom: 16.h),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 40.h,
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            title: TabBar(
              indicator: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(3),
                    topRight: Radius.circular(3),
                  ),
                  color: AppColors.indigo),
              indicatorPadding: EdgeInsets.only(
                top: 37.h,
              ),
              indicatorWeight: 0.h,
              dividerHeight: 0,
              indicatorColor: AppColors.indigo,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.indigo,
                  fontWeight: FontWeight.w500),
              unselectedLabelStyle: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.darkGrey.withOpacity(0.8),
                  fontWeight: FontWeight.w400),
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              onTap: (index) {},
              tabs: [
                const Tab(text: AppStrings.male),
                const Tab(text: AppStrings.female).marginOnly(left: 12),
              ],
            ).paddingOnly(top: 0.h),
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageAsset.sorting).paddingOnly(right: 16.w),
                ],
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Divider(
                height: 0,
                thickness: 1.8,
                color: AppColors.darkGrey.withOpacity(0.1),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    // Male Tab
                    maleContent(),
                    // Female Tab
                    femaleContent(),
                  ],
                ),
              ),
              CustomButton(
                onTap: () async {
                  Navigation.push(MyTeamScreen());
                },
                text: AppStrings.next,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                buttonColor: AppColors.lightPink,
                textColor: AppColors.lightPurple,
              ).paddingSymmetric(horizontal: 16.h, vertical: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget maleContent() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 16.h),
      itemCount: _athleteController.male.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                  ),
                  child: Image.asset(
                    ImageAsset.profilePic,
                  ),
                ),
              ),
              Image.asset(ImageAsset.flg)
            ],
          ),
          title: CommonText(
            text: _athleteController.female[index].name ?? "",
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          subtitle: CommonText(
            text: _athleteController.female[index].country ?? "",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
          ),
          trailing: InkWell(
            splashColor: Colors.transparent,
            onTap: () => _athleteController.toggleSelectionOfMale(index),
            child: Obx(
              () => !(_athleteController.selectedMale.contains(index))
                  ? Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.skyBlue,
                        ),
                      ),
                      child: Icon(
                        size: 19.sp,
                        Icons.add,
                        color: AppColors.skyBlue,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.red,
                        ),
                      ),
                      child: Icon(
                        size: 19.sp,
                        Icons.remove,
                        color: AppColors.red,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget femaleContent() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 16.h),
      itemCount: _athleteController.female.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipOval(
                child: Container(
                  height: 45.h,
                  width: 45.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                  ),
                  child: Image.asset(
                    ImageAsset.female,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Image.asset(ImageAsset.flg)
            ],
          ),
          title: CommonText(
            text: _athleteController.female[index].name ?? "",
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          subtitle: CommonText(
            text: _athleteController.female[index].country ?? "",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
          ),
          trailing: InkWell(
            splashColor: Colors.transparent,
            onTap: () => _athleteController.toggleSelectionOfFemale(index),
            child: Obx(
              () => !(_athleteController.selectedFemale.contains(index))
                  ? Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.skyBlue,
                        ),
                      ),
                      child: Icon(
                        size: 19.sp,
                        Icons.add,
                        color: AppColors.skyBlue,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.red,
                        ),
                      ),
                      child: Icon(
                        size: 19.sp,
                        Icons.remove,
                        color: AppColors.red,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
