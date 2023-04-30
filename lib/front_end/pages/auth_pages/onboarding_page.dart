import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:zfuel/export_all.dart';


class OnboardingPage extends StatefulWidget {
  static const String id = '/onboarding_page_id';
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /*=====Road with cars=====*/
            Stack(
              children: [
                Positioned(
                  right: 0,
                  top: AppDimensions.height50,
                  child: Image.asset('assets/images/petrol_handler.png'),
                ),

                /*=====Road=====*/
                CustomPaint(
                  painter: MyCustomPainter(),
                  size: Size.fromHeight(
                    AppDimensions.deviceHeight,
                  ),
                ),
                /*=====Car=====*/
                Positioned(
                  top: AppDimensions.height595 + AppDimensions.height10,
                  child: Image.asset('assets/images/car_image.png'),
                ),
                /*=====Car=====*/
                Positioned(
                  top: AppDimensions.height595,
                  right: 0,
                  child: Image.asset('assets/images/car_image.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppDimensions.height200,
                    left: AppDimensions.height10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Out of fuel on your road trip?',
                        style: AppThemes.kOnboardingSmallTextTheme,
                      ),
                      Text(
                        "Don't worry!",
                        style: AppThemes.kOnboardingSmallTextTheme,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: AppDimensions.height10),
                        child: Text(
                          'We are here to help.',
                          style: AppThemes.kOnboardingSmallTextTheme,
                        ),
                      ),
                      Text(
                        'Fast &',
                        style: AppThemes.kOnboardingTextTheme,
                      ),
                      Text(
                        'Reliable',
                        style: AppThemes.kOnboardingTextThemeWithStroke,
                      ),
                      Text(
                        'Get fuel wherever you need, we are there for you.',
                        style: TextStyle(fontSize: AppDimensions.height15),
                      ),
                      SizedBox(
                        height: AppDimensions.height10,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radius15,
                            ),
                          ),
                          backgroundColor: AppColors.kPrimaryColor,
                          side: const BorderSide(
                            color: AppColors.kTextColor,
                          ),
                        ),
                        onPressed: () {
                          Get.offAllNamed(SignInPage.id);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Get started',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.kTextColor),
                            ),
                            SizedBox(
                              width: AppDimensions.height10 / 2,
                            ),
                            const FaIcon(
                              FontAwesomeIcons.circleArrowRight,
                              color: AppColors.kIconColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
