import 'package:fantasy_triathlon_league/create_team/controller/create_team_controller.dart';
import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:fantasy_triathlon_league/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TeamDetailScreen extends StatelessWidget {
  TeamDetailScreen({super.key});

  final CreateTeamController _createTeamController =
      Get.put(CreateTeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.indigo,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 7.h, horizontal: 24.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: AppColors.indigo,
                      border: Border.all(color: AppColors.white)),
                  child: CommonText(
                    text: AppStrings.following,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ).paddingOnly(top: 16.h, bottom: 16.h),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(240.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    CommonText(
                                      text: "Mark",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                    CommonText(
                                      text: "Kelly",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ).paddingOnly(left: 16.w),
                            16.h.verticalSpace,
                            Row(
                              children: [
                                Image.asset(
                                  ImageAsset.usFlag,
                                  height: 40.h,
                                  width: 40.w,
                                  fit: BoxFit.cover,
                                ),
                                4.w.horizontalSpace,
                                Column(
                                  children: [
                                    CommonText(
                                      text: "United",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                    CommonText(
                                      text: "Kingdom",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ).paddingOnly(left: 12.w),
                            16.h.verticalSpace,
                            Row(
                              children: [
                                Image.asset(
                                  ImageAsset.star,
                                  height: 18.h,
                                  width: 18.w,
                                  fit: BoxFit.cover,
                                ),
                                10.w.horizontalSpace,
                                Column(
                                  children: [
                                    CommonText(
                                      text: "1.4 M",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                    CommonText(
                                      text: "Followers",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ).paddingOnly(left: 16.w),
                            16.h.verticalSpace,
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.r),
                              child: Image.asset(
                                ImageAsset.man,
                                height: 160.w,
                                width: 160.w,
                              ),
                            ).paddingOnly(bottom: 30.h)
                          ],
                        ),
                      ),
                    ],
                  ),
                  TabBar(
                    indicator: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(3),
                          topRight: Radius.circular(3),
                        ),
                        color: AppColors.white),
                    indicatorPadding: EdgeInsets.only(top: 39.h, left: 0),
                    indicatorWeight: 0.h,
                    dividerHeight: 0,
                    indicatorColor: AppColors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600),
                    unselectedLabelStyle: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w400),
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    onTap: (index) {},
                    tabs: [
                      const Tab(text: AppStrings.info),
                      const Tab(text: AppStrings.upComingRaces)
                          .marginOnly(left: 0),
                      const Tab(text: AppStrings.recentResults)
                          .marginOnly(left: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    infoWidget(),
                    upcomingRaces(),
                    recentResults(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget infoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: AppStrings.personalInformation,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        12.h.verticalSpace,
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              color: AppColors.darkGrey.withOpacity(0.2),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  informationCard(
                      image: ImageAsset.calender,
                      title: AppStrings.birthdate,
                      subTile: "11-09-1991"),
                  50.w.horizontalSpace,
                  informationCard(
                      image: ImageAsset.starband,
                      title: AppStrings.starts,
                      subTile: "30"),
                ],
              ),
              16.h.verticalSpace,
              Row(
                children: [
                  informationCard(
                      image: ImageAsset.podium,
                      title: AppStrings.podium,
                      subTile: "22"),
                  50.w.horizontalSpace,
                  informationCard(
                      image: ImageAsset.win,
                      title: AppStrings.wins,
                      subTile: "12"),
                ],
              ),
            ],
          ),
        ),
        16.h.verticalSpace,
        CommonText(
          text: AppStrings.athleteOverview,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        12.h.verticalSpace,
        Container(
          color: Colors.transparent,
          height: 120.h,
          child: ListView.builder(
            itemCount: _createTeamController.infoList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              width: 106.w,
              padding: const EdgeInsets.all(12),
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  color: AppColors.darkGrey.withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                          _createTeamController.infoList[index].logo ?? ""),
                    ],
                  ),
                  36.h.verticalSpace,
                  CommonText(
                    text: _createTeamController.infoList[index].title ?? "",
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.middleGrey,
                  ),
                  Expanded(
                    child: CommonText(
                      text:
                          _createTeamController.infoList[index].subTitle ?? "",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        36.h.verticalSpace,
        CustomButton(
          text: AppStrings.selectAthlete,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          buttonColor: AppColors.indigo,
        ),
      ],
    ).paddingOnly(left: 16.w, right: 16.w, top: 16.h, bottom: 10.h);
  }

  Widget informationCard(
      {required String image, required String title, required String subTile}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(25.r)),
          child: SvgPicture.asset(image),
        ),
        12.w.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: title,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            CommonText(
              text: subTile,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.middleGrey,
            ),
          ],
        )
      ],
    );
  }

  Widget upcomingRaces() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: AppStrings.upcomingRaces,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        12.h.verticalSpace,
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(bottom: 8.h),
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGrey),
                  borderRadius: BorderRadius.circular(6.r)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    text: AppStrings.africaTriathlon,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkGrey,
                  ),
                  14.h.verticalSpace,
                  Row(
                    children: [
                      Image.asset(
                        ImageAsset.flag2,
                        height: 24.h,
                        width: 24.h,
                      ),
                      8.w.horizontalSpace,
                      CommonText(
                        text: AppStrings.freetownSierra,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      Spacer(),
                      CommonText(
                        text: AppStrings.date,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.indigo,
                      ),
                    ],
                  ),
                  14.h.verticalSpace,
                  Row(
                    children: [
                      CommonText(
                        text: AppStrings.regional,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGrey,
                      ),
                      4.w.horizontalSpace,
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 10,
                      ),
                      4.w.horizontalSpace,
                      CommonText(
                        text: AppStrings.triathlon,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGrey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        CustomButton(
          onTap: () async {},
          text: AppStrings.selectAthlete,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          buttonColor: AppColors.indigo,
        ).paddingSymmetric(vertical: 10.h),
      ],
    ).paddingOnly(left: 16.w, right: 16.w, top: 16.h);
  }

  Widget recentResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: AppStrings.recentResultsUpper,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        12.h.verticalSpace,
        // DataTable(
        //   headingRowColor: MaterialStateColor.resolveWith(
        //     (states) {
        //       return AppColors.lightGrey;
        //     },
        //   ),
        //   horizontalMargin: 6,

        //   columnSpacing: 9,
        //   columns: [

        //     DataColumn(
        //       label: CommonText(
        //         text: "Event",
        //         fontSize: 12.sp,
        //         fontWeight: FontWeight.w500,
        //         color: AppColors.middleGrey,
        //       ),
        //     ),
        //     DataColumn(
        //       label: CommonText(
        //         text: "Position",
        //         fontSize: 12.sp,
        //         fontWeight: FontWeight.w500,
        //         color: AppColors.middleGrey,
        //       ),
        //     ),
        //     DataColumn(
        //       label: CommonText(
        //         text: "Points",
        //         fontSize: 12.sp,
        //         fontWeight: FontWeight.w500,
        //         color: AppColors.middleGrey,
        //       ).paddingOnly(right: 12),
        //     ),
        //   ],
        //   rows: [
        //     DataRow(
        //       cells: [
        //         DataCell(
        //           CommonText(
        //             text: "2024-04-22",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ).paddingOnly(left: 12),
        //         ),
        //         DataCell(
        //           CommonText(
        //             text: "2023 world Triathlon Cup,Miyazaki",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ).paddingOnly(right: 16),
        //         ),
        //         DataCell(
        //           CommonText(
        //             text: "2nd",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ),
        //         ),
        //         DataCell(
        //           CommonText(
        //             text: "300",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ),
        //         ),
        //       ],
        //     ),
        //     DataRow(
        //       cells: [
        //         DataCell(
        //           CommonText(
        //             text: "2023-07-20",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ).paddingOnly(left: 12),
        //         ),
        //         DataCell(
        //           CommonText(
        //             text: "2023 Africa Triathlon, Championship, Freetown",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ),
        //         ),
        //         DataCell(
        //           CommonText(
        //             text: "1nd",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ),
        //         ),
        //         DataCell(
        //           CommonText(
        //             text: "360",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ),
        //         ),
        //       ],
        //     ),
        //     DataRow(
        //       cells: [
        //         DataCell(
        //           CommonText(
        //             text: "2023-01-10",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ).paddingOnly(left: 12),
        //         ),
        //         DataCell(
        //           CommonText(
        //             text: "2023 Regional Triathlon, Championship, Japan",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ),
        //         ),
        //         DataCell(
        //           CommonText(
        //             text: "2nd",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ),
        //         ),
        //         DataCell(
        //           CommonText(
        //             text: "600",
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.darkGrey,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.transparent)),
          //
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(2.5),
              1: FlexColumnWidth(4),
              2: FlexColumnWidth(1.5),
              3: FlexColumnWidth(1.5),
            },
            border: TableBorder.symmetric(
              inside: BorderSide(color: Colors.grey.shade300),
            ),
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                children: [
                  CommonText(
                    text: "Date",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.middleGrey,
                  ),
                  CommonText(
                    text: "Event",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.middleGrey,
                  ),
                  CommonText(
                    text: "Position",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.middleGrey,
                  ),
                  CommonText(
                    text: "Points",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.middleGrey,
                  ),
                ],
              ),
              buildTableRow('2024-04-22', '2023 world Triathlon Cup, Miyazaki',
                  '2nd', '300'),
              buildTableRow(
                  '2023-07-20',
                  '2023 Africa Triathlon, Championship, Freetown',
                  '1nd',
                  '360'),
              buildTableRow('2023-01-10',
                  '2023 Regional Triathlon, Championship, Japan', '2nd', '600'),
            ],
          ),
        ),
        Spacer(),
        CustomButton(
          text: AppStrings.selectAthlete,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          buttonColor: AppColors.indigo,
        ).paddingOnly(bottom: 16.h),
      ],
    ).paddingOnly(left: 16.w, right: 16.w, top: 16.h);
  }

  TableRow buildTableRow(
      String date, String event, String position, String points) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(date),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(event),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(position),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(points),
        ),
      ],
    );
  }
}
