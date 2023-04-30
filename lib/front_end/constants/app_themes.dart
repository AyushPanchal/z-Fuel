import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zfuel/export_all.dart';

class AppThemes {
  static TextStyle kOnboardingTextTheme = GoogleFonts.inter(
      color: Colors.black,
      fontSize: AppDimensions.fontSize80,
      fontWeight: FontWeight.normal,
      letterSpacing: -6);
  static TextStyle kOnboardingTextThemeWithStroke = TextStyle(
    height: 0.9,
    foreground: Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2,
    fontSize: AppDimensions.fontSize80,
    letterSpacing: -2,
  );

  static TextStyle kOnboardingSmallTextTheme = GoogleFonts.inter(
    color: AppColors.kLightTextColor,
    fontSize: AppDimensions.fontSize20,
    fontWeight: FontWeight.normal,
  );

  static TextStyle kNormalTextForm = GoogleFonts.inter(
    color: AppColors.kLightTextColor,
    fontSize: AppDimensions.height15,
    fontWeight: FontWeight.normal,
  );
  static TextStyle kSmallText = GoogleFonts.inter(
    fontSize: AppDimensions.height15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle kMidText = GoogleFonts.inter(
    fontSize: AppDimensions.height20,
    fontWeight: FontWeight.w400,
  );

  static List<BoxShadow> kBoxShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
    BoxShadow(
      color: Colors.grey.withOpacity(0.01),
      spreadRadius: 2,
      blurRadius: 5,
      offset: Offset(0, 10),
    ),
  ];

  static SizedBox kSizedBoxHeight100 = SizedBox(
    height: AppDimensions.height100,
  );
  static SizedBox kSizedBoxHeight150 = SizedBox(
    height: AppDimensions.height150,
  );
  static SizedBox kSizedBoxHeight200 = SizedBox(
    height: AppDimensions.height200,
  );
  static SizedBox kSizedBoxHeight10 = SizedBox(
    height: AppDimensions.height10,
  );
  static SizedBox kSizedBoxHeight50 = SizedBox(
    height: AppDimensions.height50,
  );
  static SizedBox kSizedBoxHeight20 = SizedBox(
    height: AppDimensions.height20,
  );
  static SizedBox kSizedBoxHeight5 = SizedBox(
    height: AppDimensions.height5,
  );
}
