import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../constants/export_constant.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.leadingIcon,
      this.validator,
      required this.obscureText,
      required this.controller,
      this.errorText,
      this.suffixIcon,
      this.onSuffixTap,
      required this.keyboardType})
      : super(key: key);
  final String hintText;
  final FaIcon leadingIcon;
  final bool obscureText;
  Widget? suffixIcon;
  String? errorText;
  final TextInputType keyboardType;
  FormFieldValidator? validator;
  TextEditingController? controller;
  VoidCallback? onSuffixTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.kRoadColor,
      cursorHeight: AppDimensions.height20,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: onSuffixTap,
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.height15),
            child: suffixIcon,
          ),
        ),
        errorText: errorText,
        prefixIconColor: AppColors.kIconColor,
        suffixIconColor: AppColors.kIconColor,
        prefixIcon: Padding(
          padding: EdgeInsets.all(AppDimensions.height15),
          child: leadingIcon,
        ),
        hintText: hintText,
        hintStyle: AppThemes.kOnboardingSmallTextTheme.copyWith(
          fontSize: AppDimensions.height15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radius20),
          borderSide: BorderSide(color: AppColors.kRoadColor.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radius20),
          borderSide: BorderSide(color: AppColors.kRoadColor, width: 2),
        ),
      ),
    );
  }
}
