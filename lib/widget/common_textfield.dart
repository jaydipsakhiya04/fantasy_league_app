import 'package:fantasy_triathlon_league/utils/app_color.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:fantasy_triathlon_league/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextField extends StatelessWidget {
  final bool readOnly;
  final TextEditingController? controller;
  final int maxLine;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final int? maxLength;
  final double? radius;
  final bool enabled;
  final bool isPassword;
  final bool filled;
  final bool? autofocus;
  final FocusNode? focusNode;
  final String? hintText;
  final String? label;
  final TextAlign? textAlign;
  final Widget? prefix;
  final Widget? suffix;
  final Color fillColor;
  final Color? color;
  final VoidCallback? onTap;
  final Color? enableColor;
  final Color? focusedColor;
  final Color? hintColor;
  final Color? textColor;
  final double? hintSize;
  final BorderRadius? borderRadius;
  final Color? cursorColor;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  String? initialValue;
  final String? Function(String?)? validator;
  final String? prefixImage;
  final TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatters;
  bool isPrefix;
  bool inputLower;

  CustomTextField({
    Key? key,
    this.onChanged,
    this.maxLine = 1,
    this.maxLength,
    this.radius,
    this.isPrefix = true,
    this.fillColor = Colors.white,
    this.isPassword = false,
    this.enabled = true,
    this.filled = true,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.hintText,
    this.prefixImage,
    this.textColor,
    this.textAlign,
    this.borderRadius,
    this.label,
    this.prefix,
    this.hintColor,
    this.inputFormatters,
    this.hintSize,
    this.suffix,
    this.onTap,
    this.enableColor,
    this.focusedColor,
    this.cursorColor,
    this.inputLower = false,
    this.color,
    this.autofocus,
    this.controller,
    this.contentPadding,
    this.prefixWidget,
    this.suffixWidget,
    this.initialValue,
    this.readOnly = false,
    this.validator, // Validator function added
    this.textCapitalization, // Validator function added
  }) : super(key: key);

  final ValueNotifier<bool> _isObscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius ?? 8),
      child: ValueListenableBuilder(
          valueListenable: _isObscure,
          builder: (context, bool isObscure, _) {
            if (!isPassword) {
              isObscure = false;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: label ?? "",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                ),
                (label == null) ? 0.h.verticalSpace : 8.h.verticalSpace,
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: inputLower
                      ? [
                          LowerCaseTextInputFormatter(),
                        ]
                      : inputFormatters,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  autofocus: autofocus ?? false,
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.none,
                  readOnly: readOnly,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.black,
                    letterSpacing: 0.5,
                  ),
                  onTap: onTap,
                  obscureText: isObscure,
                  obscuringCharacter: '*',
                  onChanged: onChanged,
                  controller: controller,
                  maxLines: maxLine,
                  maxLength: maxLength,
                  keyboardType: keyboardType,
                  focusNode: focusNode,
                  cursorColor: AppColors.black,
                  cursorHeight: 22.h,
                  cursorWidth: 2.w,
                  textAlign: textAlign ?? TextAlign.start,
                  enabled: enabled,
                  decoration: InputDecoration(
                    fillColor: fillColor,
                    prefix: prefixWidget,
                    suffix: suffixWidget,
                    contentPadding: contentPadding ??
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    border: OutlineInputBorder(
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(6.r)),
                    // isDense: true,
                    suffixIcon: isPassword
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _isObscure.value = !isObscure;
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: SvgPicture.asset(
                                    isObscure
                                        ? ImageAsset.openEye
                                        : ImageAsset.openEye,
                                    height: 20.h,
                                    width: 20.h,
                                    // fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : suffix,
                    counterText: "",
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.middleGrey,
                    ),
                    filled: filled,
                    disabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: AppColors.lightGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(
                          color: enableColor ??
                              AppColors.middleGrey.withOpacity(0.2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide:
                          BorderSide(color: focusedColor ?? AppColors.darkGrey),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: Colors.red.shade700),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.red.shade700),
                    ),
                  ),
                  validator: validator, // Validator function applied
                ),
              ],
            );
          }),
    );
  }
}

class LowerCaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class SentenceCapitalizationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If new value is empty or just a single character, capitalize it and return.
    if (newValue.text.isEmpty) return newValue;
    if (newValue.text.length == 1) {
      return TextEditingValue(
        text: newValue.text.toUpperCase(),
        selection: newValue.selection,
      );
    }
    String newText = newValue.text;
    // Apply capitalization after specific punctuation marks followed by a space.
    if (newText.length > 2) {
      newText = newText.replaceAllMapped(RegExp(r'(\. |\? |! )[a-z]'),
          (Match match) => match[0]!.toUpperCase());
    }
    // Always capitalize the first letter of the string.
    newText = newText[0].toUpperCase() + newText.substring(1);
    return TextEditingValue(
      text: newText,
      selection: newValue.selection,
    );
  }
}
