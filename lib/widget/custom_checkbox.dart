import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox({
    Key? key,
    this.width = 24.0,
    this.height = 24.0,
    this.color,
    this.iconSize,
    required this.onChanged,
    this.checkColor,
    this.isChecked = false, // Default to false if not provided
  }) : super(key: key);

  final double width;
  final double height;
  final Color? color;
  final double? iconSize;
  final Color? checkColor;
  final Function(bool?) onChanged; // No longer nullable
  final bool isChecked; // Non-observable parameter

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Toggle the checkbox state
        final newValue = !isChecked;
        onChanged(newValue); // Call the onChanged callback
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.indigo : Colors.transparent,
          border: Border.all(
            color: isChecked
                ? AppColors.indigo
                : AppColors.middleGrey.withOpacity(0.3),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: isChecked
            ? Center(child: SvgPicture.asset(ImageAsset.check))
            : null,
      ),
    );
  }
}
