import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zfuel/export_all.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  static const String id = '/sign_in_page_id';
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ValidationController _validationController = Get.find();
  final AuthDataController _authDataController = Get.find();
  final AuthController _authController = Get.find();
  bool showPassword = false;
  bool showConfirmPassword = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                AppThemes.kSizedBoxHeight150,
                // zFuel Logo
                Center(
                  child: Text(
                    'zFuel',
                    style: AppThemes.kOnboardingTextThemeWithStroke,
                  ),
                ),
                AppThemes.kSizedBoxHeight50,
                //Login to your account text
                Text(
                  'Login to your Account',
                  style: AppThemes.kOnboardingSmallTextTheme.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppThemes.kSizedBoxHeight20,
                // Email field
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
                  controller: _authDataController.loginEmailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                AppThemes.kSizedBoxHeight20,
                // Password field
                CustomTextFormField(
                    hintText: 'Password',
                    validator: (value) {},
                    onSuffixTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    suffixIcon: FaIcon(
                      !showPassword
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      color: AppColors.kIconColor,
                    ),
                    leadingIcon: FaIcon(
                      FontAwesomeIcons.lock,
                      color: AppColors.kIconColor,
                    ),
                    obscureText: !showPassword,
                    controller: _authDataController.loginPasswordController,
                    keyboardType: TextInputType.visiblePassword),
                AppThemes.kSizedBoxHeight10,
                // Forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: AppThemes.kOnboardingSmallTextTheme.copyWith(
                        color: AppColors.kRoadColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                AppThemes.kSizedBoxHeight10,
                // LOGIN button
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radius20),
                      ),
                      elevation: 2,
                      primary: AppColors.kRoadColor,
                      maximumSize:
                          Size(double.maxFinite, AppDimensions.height100),
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimensions.height20,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _authController.signInWithEmailAndPassword(
                            _authDataController.loginEmail,
                            _authDataController.loginPassword);
                      }
                    },
                    child: Text(
                      'LOGIN',
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
                      "Don't have account?",
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
                        "SIGN UP",
                        style: AppThemes.kOnboardingSmallTextTheme.copyWith(
                            fontSize: 14,
                            color: AppColors.kRoadColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                AppThemes.kSizedBoxHeight50,
                // Or sign in with
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
                //Google logo
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
