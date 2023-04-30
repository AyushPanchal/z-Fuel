import 'package:zfuel/export_all.dart';

class FleetDriverPage extends StatefulWidget {
  const FleetDriverPage({Key? key}) : super(key: key);

  @override
  State<FleetDriverPage> createState() => _FleetDriverPageState();
}

class _FleetDriverPageState extends State<FleetDriverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppThemes.kSizedBoxHeight50,
            AppThemes.kSizedBoxHeight20,
            /*=====Date and notification Icon=====*/
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.height20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monday',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimensions.height15,
                        ),
                      ),
                      Text(
                        'Apr 30, 2023',
                        style: GoogleFonts.inter(),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.kRoadColor,
                      padding: EdgeInsets.all(
                        AppDimensions.height10,
                      ),
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {},
                    child: FaIcon(
                      FontAwesomeIcons.bell,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            AppThemes.kSizedBoxHeight20,
            /*=====Driver information=====*/
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppDimensions.height20,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(
                  AppDimensions.radius20,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(
                      AppDimensions.height10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.circle,
                              size: AppDimensions.height50,
                            ),
                            SizedBox(
                              width: AppDimensions.height10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ayush Panchal',
                                  style: AppThemes.kMidText.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppDimensions.height15),
                                ),
                                Text(
                                  'ID144',
                                  style: AppThemes.kSmallText.copyWith(
                                    color: AppColors.kLightTextColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radius20,
                                ),
                              ),
                              primary: Colors.green.withOpacity(0.3)),
                          onPressed: () {},
                          child: Text(
                            'ONLINE',
                            style: AppThemes.kMidText.copyWith(
                              color: Colors.green,
                              fontSize: AppDimensions.height15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.height10,
                      vertical: AppDimensions.height10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.kRoadColor,
                      ),
                      color: AppColors.kRoadColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(19),
                        bottomRight: Radius.circular(19),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Logged from',
                              style: AppThemes.kSmallText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: AppDimensions.height5,
                            ),
                            Text(
                              'Apr 30, 4:21 AM',
                              style: AppThemes.kSmallText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '04:21:33',
                          style: AppThemes.kSmallText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppThemes.kSizedBoxHeight20,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppDimensions.radius20),
                  topLeft: Radius.circular(AppDimensions.radius20),
                ),
                color: AppColors.kRoadColor,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.height20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppThemes.kSizedBoxHeight20,
                  Text(
                    'Tasks',
                    style: AppThemes.kMidText.copyWith(
                      color: Colors.white,
                      fontSize: AppDimensions.height30,
                    ),
                  ),
                  AppThemes.kSizedBoxHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pending',
                        style: AppThemes.kSmallText.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Confirmed',
                        style: AppThemes.kSmallText.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Completed',
                        style: AppThemes.kSmallText.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
