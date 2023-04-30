import 'package:get/get.dart';

class AppDimensions {
  static final double deviceWidth = Get.width; //856.7272727272727
  static final double deviceHeight = Get.height; //392.72727272727275

  /*=====Responsive heights=====*/
  static double height10 = deviceHeight * 0.01168;
  static double height5 = height10 / 2;
  static double height15 = deviceHeight * 0.01752;
  static double height20 = deviceHeight * 0.02336;
  static double height30 = deviceHeight * 0.03504;
  static double height40 = height10 * 4;
  static double height50 = deviceHeight * 0.0584;
  static double height70 = height30 + height40;
  static double height200 = deviceHeight * 0.2336;
  static double height250 = height200 + height50;
  static double height290 = height200 + height50 + height40;
  static double height300 = height200 + height100;
  static double height100 = height50 * 2;
  static double height150 = height50 * 3;
  static double height595 = deviceHeight * 0.6945;

  /*=====Responsive font sizes=====*/
  static double fontSize80 = deviceHeight * 0.0933;
  static double fontSize15 = height15;
  static double fontSize20 = deviceHeight * 0.02336;

  /*=====Border radius=====*/
  static double radius15 = deviceHeight * 0.01752;
  static double radius20 = height20;
}
