import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zfuel/export_all.dart';

import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  static const String id = '/sign_up_page_id';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ValidationController _validationController = Get.find();
  final AuthDataController _authDataController = Get.find();
  final AuthController _authController = Get.find();
  bool showPassword = false;
  bool showConfirmPassword = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.height15,
              top: AppDimensions.height15,
            ),
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: AppColors.kIconColor,
              size: AppDimensions.height30,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.height15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppThemes.kSizedBoxHeight50,
                //zFuel LOGO
                Center(
                  child: Text(
                    'zFuel',
                    style: AppThemes.kOnboardingTextThemeWithStroke,
                  ),
                ),
                AppThemes.kSizedBoxHeight50,
                //Create account text
                Text(
                  'Create your Account',
                  style: AppThemes.kOnboardingSmallTextTheme.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppThemes.kSizedBoxHeight20,
                //Email field
                CustomTextFormField(
                  hintText: 'Email',
                  validator: (value) {
                    bool isValid = _validationController.validateEmail(value);
                    return isValid
                        ? null
                        : _validationController.emailError.value;
                  },
                  leadingIcon: const FaIcon(
                    FontAwesomeIcons.envelope,
                    color: AppColors.kIconColor,
                  ),
                  controller: _authDataController.emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                AppThemes.kSizedBoxHeight20,
                //Password field
                CustomTextFormField(
                    hintText: 'Password',
                    validator: (value) {
                      bool isValid =
                          _validationController.validatePassword(value);
                      return isValid
                          ? null
                          : _validationController.passwordError.value;
                    },
                    onSuffixTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    suffixIcon: FaIcon(
                      showPassword
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      color: AppColors.kIconColor,
                    ),
                    leadingIcon: const FaIcon(
                      FontAwesomeIcons.lock,
                      color: AppColors.kIconColor,
                    ),
                    obscureText: showPassword,
                    controller: _authDataController.passwordController,
                    keyboardType: TextInputType.visiblePassword),
                AppThemes.kSizedBoxHeight20,
                //Confirm Password
                CustomTextFormField(
                  validator: (value) {
                    bool isValid =
                        _validationController.validateConfirmPassword(
                            _authDataController.password, value);
                    return isValid
                        ? null
                        : _validationController.confirmPasswordError.value;
                  },
                  hintText: 'Confirm Password',
                  leadingIcon: const FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: AppColors.kIconColor,
                  ),
                  onSuffixTap: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                  suffixIcon: FaIcon(
                    showConfirmPassword
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye,
                    color: AppColors.kIconColor,
                  ),
                  obscureText: showConfirmPassword,
                  controller: _authDataController.confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                AppThemes.kSizedBoxHeight20,
                //Sign up Button
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radius20,
                        ),
                      ),
                      elevation: 2,
                      primary: AppColors.kRoadColor,
                      maximumSize: Size(
                        double.maxFinite,
                        AppDimensions.height100,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimensions.height20,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _authController.registerWithEmailAndPassword(
                          _authDataController.email,
                          _authDataController.password,
                        );
                      }
                    },
                    child: Text(
                      'SIGN UP',
                      style: AppThemes.kOnboardingSmallTextTheme.copyWith(
                        letterSpacing: 3,
                        color: Colors.white,
                        fontSize: AppDimensions.height15,
                      ),
                    ),
                  ),
                ),
                AppThemes.kSizedBoxHeight20,
                // SIGN UP option
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppThemes.kOnboardingSmallTextTheme
                          .copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      width: AppDimensions.height5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(SignUpPage.id);
                      },
                      child: Text(
                        "LOG IN",
                        style: AppThemes.kOnboardingSmallTextTheme.copyWith(
                          fontSize: 14,
                          color: AppColors.kRoadColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                AppThemes.kSizedBoxHeight50,
                //Or sign in with
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Divider(
                        thickness: 2,
                        color: AppColors.kIconColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.height10),
                      child: Text(
                        'Or sign in with',
                        style: AppThemes.kOnboardingSmallTextTheme
                            .copyWith(fontSize: 18),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 2,
                        color: AppColors.kIconColor,
                      ),
                    ),
                  ],
                ),
                AppThemes.kSizedBoxHeight20,
                //Google Logo
                Center(
                  child: Card(
                    shape: const CircleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(AppDimensions.height10 / 2),
                      child: Image.asset(
                        'assets/images/google_logo.png',
                        height: AppDimensions.height50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
