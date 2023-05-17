import 'package:zfuel/export_all.dart';

class PaymentPage extends StatefulWidget {
  static const String id = "/PaymentPageId";
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var data = Get.arguments;
  int? selectedIndex;
  List<String> imageList = [
    "assets/images/cash_logo.png",
    "assets/images/gpay_logo.png",
    "assets/images/phonepe_logo.png",
    "assets/images/paytm_logo.png",
  ];
  List<String> nameList = [
    "Cash on delivery",
    "Google Pay",
    "Phone Pe",
    "Paytm",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const FaIcon(FontAwesomeIcons.arrowLeft)),
              SizedBox(
                width: AppDimensions.height20,
              ),
              Text(
                'Payment',
                style: GoogleFonts.inter(
                    fontSize: AppDimensions.height20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                        backgroundColor2: Colors.transparent,
                        backgroundColor3: Colors.black,
                        content1: FaIcon(
                          Icons.check,
                        ),
                        content2: FaIcon(
                          FontAwesomeIcons.two,
                        ),
                        content3: FaIcon(
                          FontAwesomeIcons.three,
                          color: Colors.white,
                        ),
                        text1: 'Location',
                        text2: 'Order Summary',
                        text3: 'Payment'),
                  ),
                ],
              ),
            ),
            /*=====Order summary=====*/
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.height20,
                vertical: AppDimensions.height20,
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
                            'Price (${data['quantity']} ltr)',
                            style: AppThemes.kSmallText,
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.indianRupeeSign,
                                size: AppDimensions.height15,
                              ),
                              Text(
                                '${data['price']}',
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
                            'Company charges',
                            style: AppThemes.kSmallText,
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.indianRupeeSign,
                                size: AppDimensions.height15,
                              ),
                              Text(
                                data['companyCharges'],
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
                                data['deliveryCharges'],
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
                                "${data['roundOfAmount']}",
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
                                "${data['totalAmount']}",
                                style: AppThemes.kSmallText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.height20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Payment Option",
                    style: AppThemes.kMidText,
                  ),
                  SingleChildScrollView(
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.height10,
                        ),
                        shrinkWrap: true,
                        itemCount: nameList.length,
                        itemBuilder: (context, index) {
                          // print(index);
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppDimensions.height5),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: AppDimensions.height10,
                                vertical: AppDimensions.height10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radius15,
                                ),
                                side: BorderSide(color: Colors.black, width: 0),
                              ),
                              title: Text(
                                nameList[index],
                                style: AppThemes.kMidText.copyWith(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              tileColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.white,
                              trailing: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  imageList[index],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  AppThemes.kSizedBoxHeight10,
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
            )
          ],
        ),
      ),
    );
  }
}
