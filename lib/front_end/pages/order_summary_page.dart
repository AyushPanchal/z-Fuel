import 'package:google_fonts/google_fonts.dart';
import 'package:zfuel/export_all.dart';

class OrderSummaryPage extends StatefulWidget {
  const OrderSummaryPage({Key? key}) : super(key: key);

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*=====Horizontal Stepper=====*/
      appBar: PreferredSize(
        preferredSize: Size(
          AppDimensions.deviceWidth,
          AppDimensions.height70,
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: AppDimensions.height70,
            left: AppDimensions.height20,
          ),
          child: Row(
            children: <Widget>[
              const FaIcon(FontAwesomeIcons.arrowLeft),
              SizedBox(
                width: AppDimensions.height20,
              ),
              Text(
                'Order Summary',
                style: GoogleFonts.inter(
                    fontSize: AppDimensions.height20,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppThemes.kSizedBoxHeight10,
          /*=====Order status=====*/
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(
              left: AppDimensions.height30,
              right: AppDimensions.height30,
              top: AppDimensions.height20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Expanded(
                  child: IconWithText(
                      backgroundColor1: Colors.transparent,
                      backgroundColor2: Colors.black,
                      backgroundColor3: Colors.transparent,
                      content1: FaIcon(Icons.check),
                      content2: FaIcon(
                        FontAwesomeIcons.two,
                        color: Colors.white,
                      ),
                      content3: FaIcon(FontAwesomeIcons.three),
                      text1: 'Location',
                      text2: 'Order Summary',
                      text3: 'Payment'),
                ),
              ],
            ),
          ),
          AppThemes.kSizedBoxHeight20,
          /*=====Delivery information=====*/
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.height20,
            ),
            width: AppDimensions.deviceWidth,
            // height: AppDimensions.height100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Deliver to:',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.height30,
                        ),
                        primary: AppColors.kRoadColor,
                        side: const BorderSide(width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.height10,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Change'),
                    ),
                  ],
                ),
                Text(
                  'Ayush Panchal',
                  style: GoogleFonts.inter(
                    fontSize: AppDimensions.height30 - AppDimensions.height5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppThemes.kSizedBoxHeight10,
                SizedBox(
                  width: AppDimensions.height200,
                  child: Text(
                    'Nr. Gh-2 Circle, Gh Road Gandhinagar 382007, Gujarat',
                    style: GoogleFonts.inter(color: AppColors.kLightTextColor),
                  ),
                ),
                AppThemes.kSizedBoxHeight5,
                SizedBox(
                  width: AppDimensions.height200,
                  child: Text(
                    '+91 9327453256',
                    style: GoogleFonts.inter(
                      color: AppColors.kLightTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppThemes.kSizedBoxHeight20,
          AppThemes.kSizedBoxHeight10,
          /*=====Fuel information=====*/
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.height20,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /*=====Fuel logo and quantity=====*/
                SizedBox(
                  width: AppDimensions.height100 + AppDimensions.height10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical:
                              AppDimensions.height20 + AppDimensions.height5,
                          horizontal: AppDimensions.height30,
                        ),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radius20,
                          ),
                          border: Border.all(color: AppColors.kRoadColor),
                        ),
                        child: Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.gasPump,
                              size: AppDimensions.height30,
                            ),
                            AppThemes.kSizedBoxHeight10,
                            Text(
                              'Petrol',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: AppDimensions.height15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppThemes.kSizedBoxHeight10,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.height15,
                          vertical: AppDimensions.height10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.height10,
                          ),
                          border: Border.all(color: AppColors.kRoadColor),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Qty.',
                              style:
                                  AppThemes.kOnboardingSmallTextTheme.copyWith(
                                fontSize: AppDimensions.height15,
                              ),
                            ),
                            Text(
                              '1.0 ltr.',
                              style: AppThemes.kNormalTextForm.copyWith(
                                color: AppColors.kRoadColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: AppDimensions.height10,
                ),
                /*=====Fuel information and delivery time=====*/
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'XP-95 Petrol Indian Oil',
                      style: GoogleFonts.inter(
                        fontSize: AppDimensions.height20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kRoadColor,
                      ),
                    ),
                    AppThemes.kSizedBoxHeight5,
                    SizedBox(
                      height: AppDimensions.height30,
                      width: AppDimensions.height100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return FaIcon(
                            index != 4
                                ? FontAwesomeIcons.solidStar
                                : FontAwesomeIcons.star,
                            size: AppDimensions.height15,
                          );
                        },
                      ),
                    ),
                    AppThemes.kSizedBoxHeight5,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.indianRupeeSign,
                          size: AppDimensions.height20 + AppDimensions.height5,
                        ),
                        Text(
                          '100.2',
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    AppThemes.kSizedBoxHeight10,
                    Text(
                      'Delivery in 27 mins.',
                      style: GoogleFonts.inter(
                        fontSize: AppDimensions.height15,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          /*=====Order summary=====*/
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.height20,
              vertical: AppDimensions.height40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price details',
                      style: GoogleFonts.inter(
                        fontSize: AppDimensions.height20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppThemes.kSizedBoxHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price (1 ltr)',
                          style: AppThemes.kSmallText,
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.indianRupeeSign,
                              size: AppDimensions.height15,
                            ),
                            Text(
                              '100.2',
                              style: AppThemes.kSmallText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppThemes.kSizedBoxHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Addon charges',
                          style: AppThemes.kSmallText,
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.indianRupeeSign,
                              size: AppDimensions.height15,
                            ),
                            Text(
                              '30.0',
                              style: AppThemes.kSmallText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppThemes.kSizedBoxHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Delivery charges',
                          style: AppThemes.kSmallText,
                        ),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.indianRupeeSign,
                              size: AppDimensions.height15,
                            ),
                            Text(
                              '30.0',
                              style: AppThemes.kSmallText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppThemes.kSizedBoxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Round off',
                          style: AppThemes.kSmallText.copyWith(
                            color: AppColors.kRoadColor.withOpacity(0.5),
                          ),
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.indianRupeeSign,
                              size: AppDimensions.height15,
                            ),
                            Text(
                              '-0.2',
                              style: AppThemes.kSmallText.copyWith(
                                color: AppColors.kRoadColor.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppThemes.kSizedBoxHeight5,
                    Divider(
                      color: AppColors.kRoadColor.withOpacity(
                        0.5,
                      ),
                      height: 2,
                    ),
                    AppThemes.kSizedBoxHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: AppThemes.kSmallText,
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.indianRupeeSign,
                              size: AppDimensions.height15,
                            ),
                            Text(
                              '130.0',
                              style: AppThemes.kSmallText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                AppThemes.kSizedBoxHeight20,
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radius15),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimensions.height15,
                      ),
                      primary: AppColors.kRoadColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Continue',
                      style: AppThemes.kSmallText.copyWith(
                        color: Colors.white,
                        fontSize: AppDimensions.height15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          /*=====Continue Button=====*/
        ],
      ),
    );
  }
}
