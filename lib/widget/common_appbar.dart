import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool? isSimpleAppBar;
  final String? title;
  final String? titleText;
  final Color? statusBarColor;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpace;
  final double? toolbarHeight;
  void Function()? onTap;
  final Brightness? statusBarIconBrightness;

  CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.statusBarColor,
    this.backgroundColor,
    this.bottom,
    this.titleText,
    this.flexibleSpace,
    this.toolbarHeight,
    this.onTap,
    this.statusBarIconBrightness,
    this.isSimpleAppBar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(68.h),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor ?? Colors.transparent,
        elevation: 0,
        flexibleSpace: flexibleSpace,
        title: (isSimpleAppBar == true)
            ? InkWell(
                onTap: onTap ??
                    () {
                      Get.back();
                    },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 15.w,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(4.5.r)),
                  child: SvgPicture.asset(ImageAsset.backButton),
                ),
              )
            : Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: onTap ??
                            () {
                              Get.back();
                            },
                        child: Container(
                          child: SvgPicture.asset(ImageAsset.whiteBackButton),
                        ),
                      ),
                    ],
                  ),
                  16.w.horizontalSpace,
                  CommonText(
                    text: titleText ?? "",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ],
              ),
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(68.h); // Increase the height here
}
