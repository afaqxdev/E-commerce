import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/const/color.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color = AppColors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  /// Factory constructors for common sizes
  factory CustomText.tooSmall(
    String text, {
    Color color = AppColors.black,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text: text,
      fontSize: 10.sp,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
    );
  }

  factory CustomText.small(
    String text, {
    Color color = AppColors.black,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text: text,
      fontSize: 12.sp,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
    );
  }

  factory CustomText.medium(
    String text, {
    Color color = AppColors.black,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text: text,
      fontSize: 16.sp,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
    );
  }

  factory CustomText.large(
    String text, {
    Color color = AppColors.black,
    FontWeight fontWeight = FontWeight.bold,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text: text,
      fontSize: 20.sp,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
    );
  }

  factory CustomText.extraLarge(
    String text, {
    Color color = AppColors.black,
    FontWeight fontWeight = FontWeight.bold,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text: text,
      fontSize: 24.sp,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
