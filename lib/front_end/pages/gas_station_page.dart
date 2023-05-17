import 'package:zfuel/export_all.dart';

class GasStationPage extends StatefulWidget {
  static const String id = '/GasStationPage';
  const GasStationPage({Key? key}) : super(key: key);

  @override
  State<GasStationPage> createState() => _GasStationPageState();
}

class _GasStationPageState extends State<GasStationPage> {
  int selectedIndex = 0;
  double quantity = 1;
  double price = 100;
  double petrolPrice = 0.0;
  bool isPetrolPriceFetched = false;

  ///data coming from NearbyGasStationPage
  GasStationModel snapshot = Get.arguments;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var data = await HttpHelper.fetchPetrolPrices();
    setState(() {
      if (data.isNotEmpty) {
        isPetrolPriceFetched = true;
      }
      price = data['Ahmedabad'];
      petrolPrice = data['Ahmedabad'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Image of gas station
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(
                    AppDimensions.radius20 + AppDimensions.radius15,
                  ),
                  bottomLeft: Radius.circular(
                    AppDimensions.radius20 + AppDimensions.radius15,
                  ),
                ),
                child: snapshot.gasStationImageURL!.isEmpty
                    ? Image.asset(
                        'assets/images/gas_station_image.jpg',
                        height: AppDimensions.height250,
                        width: AppDimensions.deviceWidth,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        snapshot.gasStationImageURL!,
                        height: AppDimensions.height250,
                        width: AppDimensions.deviceWidth,
                        fit: BoxFit.cover,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppDimensions.height20,
                    top: AppDimensions.height40,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(AppDimensions.height10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Petrol pump name and location

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.height20,
                right: AppDimensions.height20,
                top: AppDimensions.height10,
                // vertical: AppDimensions.height20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*=====Gas station name and Location=====*/
                  Text(
                    '${snapshot.name} - ${snapshot.area}, ${snapshot.city}',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  AppThemes.kSizedBoxHeight10,
                  /*=====Rating stars=====*/
                  SizedBox(
                    height: AppDimensions.height20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('4.0'),
                        SizedBox(
                          width: AppDimensions.height5,
                        ),
                        /*=====Rating stars=====*/
                        Expanded(
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
                        )
                      ],
                    ),
                  ),
                  /*=====Address and status=====*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Petrol Pump in ${snapshot.area}, ${snapshot.city}',
                          style: AppThemes.kNormalTextForm,
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.height5,
                      ),
                      Container(
                        height: AppDimensions.height5,
                        width: AppDimensions.height5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.height5,
                      ),
                      Text(
                        'Open',
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                  AppThemes.kSizedBoxHeight20,
                  /*=====Select Petrol type=====*/
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppDimensions.height50,
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.height5,
                      ),
                      Text(
                        'Select Petrol Type',
                        style: AppThemes.kNormalTextForm.copyWith(
                          color: AppColors.kRoadColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.height5,
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.height50,
                      ),
                    ],
                  ),
                  AppThemes.kSizedBoxHeight10,
                  /*=====Petrol tile=====*/
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppDimensions.height5,
                          ),
                          child: Material(
                            elevation: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(AppDimensions.height15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.kLightTextColor
                                        .withOpacity(0.4),
                                  ),
                                  color: selectedIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.radius20),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: Offset(0, AppDimensions.height5),
                                      blurRadius: 3,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.2),
                                      offset: Offset(0, AppDimensions.height5),
                                      blurRadius: 1,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.2),
                                      offset: const Offset(0, 1),
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Regular',
                                      style: AppThemes.kOnboardingTextTheme
                                          .copyWith(
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: AppDimensions.height20 +
                                            AppDimensions.height5,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.indianRupeeSign,
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                          size: AppDimensions.height20 +
                                              AppDimensions.height5,
                                        ),
                                        Text(
                                          '$price/',
                                          style: GoogleFonts.inter(
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: AppDimensions.height20 +
                                                AppDimensions.height5,
                                          ),
                                        ),
                                        Baseline(
                                          baselineType: TextBaseline.alphabetic,
                                          baseline: 1,
                                          child: Text(
                                            'ltr',
                                            style: AppThemes
                                                .kOnboardingSmallTextTheme,
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  /*=====Quantity and Price of petrol=====*/
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppDimensions.height10,
                                      vertical: AppDimensions.height10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.kRoadColor,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                          AppDimensions.radius15,
                                        ),
                                        bottomLeft: Radius.circular(
                                          AppDimensions.radius15,
                                        ),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Qty',
                                          style: TextStyle(
                                            fontSize: AppDimensions.height20,
                                            color: AppColors.kLightTextColor,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                // default quantity
                                                return AlertDialog(
                                                  title: const Text(
                                                    'Enter Quantity',
                                                  ),
                                                  content: TextField(
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText:
                                                          'Enter quantity',
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (value) {
                                                      try {
                                                        if (value.length < 3) {
                                                          setState(() {
                                                            quantity =
                                                                double.parse(
                                                                    value);
                                                            petrolPrice = double
                                                                .parse((quantity *
                                                                        price)
                                                                    .toStringAsFixed(
                                                                        2));
                                                          });
                                                        }
                                                      } catch (e) {}
                                                    },
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        // do something with the quantity
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      AppDimensions.height10,
                                                ),
                                                child: Text(
                                                  '${quantity.toStringAsFixed(2)} / ltr',
                                                  style: AppThemes
                                                      .kOnboardingTextTheme
                                                      .copyWith(
                                                    fontSize:
                                                        AppDimensions.height17,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppDimensions.height10,
                                      vertical: AppDimensions.height10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.kRoadColor,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                          AppDimensions.radius15,
                                        ),
                                        bottomRight: Radius.circular(
                                          AppDimensions.radius15,
                                        ),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Enter Price'),
                                              content: TextField(
                                                decoration: InputDecoration(
                                                  hintText: 'Enter Price',
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (value) {
                                                  try {
                                                    if (value.length < 5) {
                                                      setState(() {
                                                        petrolPrice =
                                                            double.parse(value);
                                                        quantity = double.parse(
                                                            (petrolPrice /
                                                                    price)
                                                                .toStringAsFixed(
                                                                    2));
                                                      });
                                                    }
                                                  } catch (e) {}
                                                },
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    // do something with the quantity

                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Price',
                                            style: TextStyle(
                                              fontSize: AppDimensions.height20,
                                              color: AppColors.kLightTextColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons
                                                    .indianRupeeSign,
                                                size: AppDimensions.height17,
                                              ),
                                              SizedBox(
                                                width: AppDimensions.height5,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      AppDimensions.height10,
                                                ),
                                                child: Text(
                                                  '${(petrolPrice)}',
                                                  style: AppThemes
                                                      .kOnboardingTextTheme
                                                      .copyWith(
                                                    fontSize:
                                                        AppDimensions.height17,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 0,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      AppThemes.kSizedBoxHeight20,
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppDimensions.radius15),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: AppDimensions.height10,
                          ),
                          primary: AppColors.kRoadColor,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          if (isPetrolPriceFetched) {
                            Get.toNamed(OrderSummaryPage.id, arguments: {
                              "quantity": quantity,
                              "price": petrolPrice
                            });
                          } else {
                            showSnackBar("Wait!", "Let us fetch prices.");
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(FontAwesomeIcons.truckFast),
                            SizedBox(
                              width: AppDimensions.height10,
                            ),
                            const Text('Ask for delivery')
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppThemes.kSizedBoxHeight10,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// return Scaffold(
//   appBar: PreferredSize(
//     preferredSize: Size(
//       Get.width,
//       AppDimensions.height250,
//     ),
//     child: Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(AppDimensions.radius20 * 2),
//                 bottomRight: Radius.circular(AppDimensions.radius20 * 2)),
//             image: const DecorationImage(
//               image: AssetImage('assets/images/indian_oil.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(
//             left: AppDimensions.height20,
//             top: AppDimensions.height40,
//           ),
//           child: Container(
//             padding: EdgeInsets.all(AppDimensions.height10),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.7),
//               shape: BoxShape.circle,
//             ),
//             child: const FaIcon(
//               FontAwesomeIcons.arrowLeft,
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
//   body: Padding(
//     padding: EdgeInsets.symmetric(
//       horizontal: AppDimensions.height20,
//       vertical: AppDimensions.height20,
//     ),
//     child: Column(
//       children: [
//         Text(
//           'Indian Oil Petrol Pump - Vijay Automobiles Gandhinagar.',
//           style: TextStyle(
//             fontSize: 26,
//           ),
//         ),
//         AppThemes.kSizedBoxHeight10,
//         //Rating stars
//         SizedBox(
//           height: AppDimensions.height20,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text('4.0'),
//               SizedBox(
//                 width: AppDimensions.height5,
//               ),
//               /*=====Rating stars=====*/
//               Expanded(
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 5,
//                   itemBuilder: (context, index) {
//                     return FaIcon(
//                       index != 4
//                           ? FontAwesomeIcons.solidStar
//                           : FontAwesomeIcons.star,
//                       size: 14,
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               flex: 1,
//               child: Text(
//                 'Petrol Pump in Gandhinagar, Gujarat',
//                 style: AppThemes.kNormalTextForm,
//               ),
//             ),
//             SizedBox(
//               width: AppDimensions.height5,
//             ),
//             Container(
//               height: AppDimensions.height5,
//               width: AppDimensions.height5,
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle, color: Colors.green),
//             ),
//             SizedBox(
//               width: AppDimensions.height5,
//             ),
//             Text(
//               'Open',
//               style: TextStyle(color: Colors.green),
//             )
//           ],
//         ),
//         AppThemes.kSizedBoxHeight20,
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: AppDimensions.height50,
//             ),
//             const Expanded(
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//             SizedBox(
//               width: AppDimensions.height5,
//             ),
//             Text(
//               'Select Petrol Type',
//               style: AppThemes.kNormalTextForm.copyWith(
//                 color: AppColors.kRoadColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               width: AppDimensions.height5,
//             ),
//             const Expanded(
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//             SizedBox(
//               width: AppDimensions.height50,
//             ),
//           ],
//         ),
//         AppThemes.kSizedBoxHeight10,
//         //Petrol tile
//         Expanded(
//           child: ListView.builder(
//             itemCount: 3,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: EdgeInsets.symmetric(
//                   vertical: AppDimensions.height5,
//                 ),
//                 child: Material(
//                   elevation: 0,
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                       });
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(AppDimensions.height15),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: AppColors.kLightTextColor.withOpacity(0.4),
//                         ),
//                         color: selectedIndex == index
//                             ? Colors.black
//                             : Colors.white,
//                         borderRadius:
//                             BorderRadius.circular(AppDimensions.radius20),
//                         boxShadow: <BoxShadow>[
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             offset: Offset(0, AppDimensions.height5),
//                             blurRadius: 3,
//                           ),
//                           BoxShadow(
//                             color: Colors.white.withOpacity(0.2),
//                             offset: Offset(0, AppDimensions.height5),
//                             blurRadius: 1,
//                           ),
//                           BoxShadow(
//                             color: Colors.white.withOpacity(0.2),
//                             offset: const Offset(0, 1),
//                             blurRadius: 1,
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Regular',
//                             style: AppThemes.kOnboardingTextTheme.copyWith(
//                               color: selectedIndex == index
//                                   ? Colors.white
//                                   : Colors.black,
//                               fontSize: AppDimensions.height20 +
//                                   AppDimensions.height5,
//                               letterSpacing: 0,
//                             ),
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.baseline,
//                             textBaseline: TextBaseline.alphabetic,
//                             children: [
//                               Icon(
//                                 FontAwesomeIcons.indianRupeeSign,
//                                 color: selectedIndex == index
//                                     ? Colors.white
//                                     : Colors.black,
//                                 size: AppDimensions.height20 +
//                                     AppDimensions.height5,
//                               ),
//                               Text(
//                                 '99.20/',
//                                 style: GoogleFonts.inter(
//                                   color: selectedIndex == index
//                                       ? Colors.white
//                                       : Colors.black,
//                                   fontSize: AppDimensions.height20 +
//                                       AppDimensions.height5,
//                                 ),
//                               ),
//                               Baseline(
//                                 baselineType: TextBaseline.alphabetic,
//                                 baseline: 1,
//                                 child: Text(
//                                   'ltr',
//                                   style:
//                                       AppThemes.kOnboardingSmallTextTheme,
//                                   textAlign: TextAlign.right,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         AppThemes.kSizedBoxHeight10,
//         showDialogue
//             ? const SizedBox.shrink()
//             : Column(
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: AppDimensions.height10,
//                                   vertical: AppDimensions.height10,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.kRoadColor),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(
//                                         AppDimensions.radius15),
//                                     bottomLeft: Radius.circular(
//                                         AppDimensions.radius15),
//                                   ),
//                                   color: Colors.white,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Qty',
//                                       style: TextStyle(
//                                         fontSize: AppDimensions.height20,
//                                         color: AppColors.kLightTextColor,
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           showDialogue = true;
//                                         });
//                                         showDialog(
//                                           context: context,
//                                           builder: (context) {
//                                             quantity =
//                                                 2.5; // default quantity
//                                             return AlertDialog(
//                                               title: Text('Enter Quantity'),
//                                               content: TextField(
//                                                 decoration: InputDecoration(
//                                                   hintText:
//                                                       'Enter quantity',
//                                                 ),
//                                                 keyboardType:
//                                                     TextInputType.number,
//                                                 onChanged: (value) {
//                                                   try {
//                                                     quantity =
//                                                         double.parse(value);
//                                                   } catch (e) {}
//                                                 },
//                                               ),
//                                               actions: [
//                                                 TextButton(
//                                                   onPressed: () {
//                                                     Navigator.pop(context);
//                                                   },
//                                                   child: Text('Cancel'),
//                                                 ),
//                                                 TextButton(
//                                                   onPressed: () {
//                                                     // do something with the quantity
//                                                     Navigator.pop(context);
//                                                     setState(() {
//                                                       showDialogue = false;
//                                                     });
//                                                   },
//                                                   child: Text('OK'),
//                                                 ),
//                                               ],
//                                             );
//                                           },
//                                         );
//                                       },
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             '$quantity Ltr',
//                                             style: AppThemes
//                                                 .kOnboardingTextTheme
//                                                 .copyWith(
//                                               fontSize:
//                                                   AppDimensions.height30,
//                                               fontWeight: FontWeight.bold,
//                                               letterSpacing: 0,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: AppDimensions.height10,
//                             ),
//                             Expanded(
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: AppDimensions.height10,
//                                   vertical: AppDimensions.height10,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: AppColors.kRoadColor),
//                                   borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(
//                                         AppDimensions.radius15),
//                                     bottomRight: Radius.circular(
//                                         AppDimensions.radius15),
//                                   ),
//                                   color: Colors.white,
//                                 ),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     showDialog(
//                                       context: context,
//                                       builder: (context) {
//                                         price = 200; // default quantity
//                                         return AlertDialog(
//                                           title: Text('Enter Price'),
//                                           content: TextField(
//                                             decoration: InputDecoration(
//                                               hintText: 'Enter Price',
//                                             ),
//                                             keyboardType:
//                                                 TextInputType.number,
//                                             onChanged: (value) {
//                                               try {
//                                                 price = double.parse(value);
//                                               } catch (e) {}
//                                             },
//                                           ),
//                                           actions: [
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Text('Cancel'),
//                                             ),
//                                             TextButton(
//                                               onPressed: () {
//                                                 // do something with the quantity
//                                                 setState(() {});
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Text('OK'),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     );
//                                   },
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         'Price',
//                                         style: TextStyle(
//                                           fontSize: AppDimensions.height20,
//                                           color: AppColors.kLightTextColor,
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           FaIcon(
//                                             FontAwesomeIcons
//                                                 .indianRupeeSign,
//                                           ),
//                                           Text(
//                                             '${price.round()}',
//                                             style: AppThemes
//                                                 .kOnboardingTextTheme
//                                                 .copyWith(
//                                               fontSize:
//                                                   AppDimensions.height30,
//                                               fontWeight: FontWeight.bold,
//                                               letterSpacing: 0,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   AppThemes.kSizedBoxHeight20,
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius:
//                             BorderRadius.circular(AppDimensions.radius15),
//                       ),
//                       padding: EdgeInsets.symmetric(
//                         vertical: AppDimensions.height10,
//                       ),
//                       primary: AppColors.kRoadColor,
//                       onPrimary: Colors.white,
//                     ),
//                     onPressed: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         FaIcon(FontAwesomeIcons.truckFast),
//                         SizedBox(
//                           width: AppDimensions.height10,
//                         ),
//                         Text('Ask for delivery')
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//       ],
//     ),
//   ),
// );
