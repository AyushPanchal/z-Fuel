import 'package:zfuel/export_all.dart';
import 'package:zfuel/front_end/pages/nearby_gas_station_page.dart';

class FuelChoicePage extends StatefulWidget {
  static const String id = '/fuel_choice_page_id';
  const FuelChoicePage({Key? key}) : super(key: key);

  @override
  State<FuelChoicePage> createState() => _FuelChoicePageState();
}

class _FuelChoicePageState extends State<FuelChoicePage> {
  @override
  void initState() {
    super.initState();
  }

  bool isMapDataAvailable = false;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final MapController _mapController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            /*=====Google map=====*/
            StreamBuilder<LatLng>(
              stream: MapHelper.getUserLocationStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data != null) {
                  isMapDataAvailable = true;
                  MapHelper.userLocation = snapshot.data!;
                  return GoogleMap(
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    markers: {
                      Marker(
                        markerId: const MarkerId('You'),
                        position: snapshot.data!,
                      ),
                    },
                    initialCameraPosition: CameraPosition(
                      target: snapshot.data!,
                      zoom: 14.47,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  );
                } else {
                  return Center(
                      child: Text('Could not retrieve location data.'));
                }
              },
            ),
            /*=====Location information=====*/
            Positioned(
              top: AppDimensions.height50,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppDimensions.height15),
                child: Container(
                  width: Get.width,
                  padding: EdgeInsets.all(AppDimensions.height15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
                    color: Colors.white,
                    boxShadow: [
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
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: AppDimensions.height10,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                      ),
                      Container(
                        height: AppDimensions.height40,
                        margin: EdgeInsets.symmetric(
                            horizontal: AppDimensions.height20),
                        width: 1,
                        color: Colors.black,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.locationArrow,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: AppDimensions.height15,
                      ),
                      Expanded(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Delivery at',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold),
                            ),
                            AppThemes.kSizedBoxHeight5,
                            Obx(
                              () => Text(
                                _mapController.fullAddress.value,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            /*=====Fuel type selection=====*/
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.height15),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
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
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
                  ),
                  width: Get.width,
                  padding: EdgeInsets.only(
                    left: AppDimensions.height20,
                    right: AppDimensions.height20,
                    bottom: AppDimensions.height30,
                  ),
                  child: Column(
                    children: [
                      AppThemes.kSizedBoxHeight10,
                      Text(
                        'Fuel Type',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      AppThemes.kSizedBoxHeight10,
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.height50,
                                  vertical: AppDimensions.height30,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radius20,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Column(
                                children: [
                                  FaIcon(FontAwesomeIcons.gasPump),
                                  AppThemes.kSizedBoxHeight10,
                                  Text('Petrol'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppDimensions.height50,
                                    vertical: AppDimensions.height30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radius20,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Column(
                                children: [
                                  FaIcon(FontAwesomeIcons.fireFlameSimple),
                                  AppThemes.kSizedBoxHeight10,
                                  Text('Diesel'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      AppThemes.kSizedBoxHeight10,
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.kRoadColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radius20,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: AppDimensions.height15,
                            ),
                          ),
                          onPressed: () {
                            if (isMapDataAvailable) {
                              Get.toNamed(
                                NearbyGasStationPage.id,
                              );
                            } else {
                              showSnackBar(
                                "Wait!",
                                "Let us fetch your location.",
                              );
                            }
                          },
                          child: Text(
                            'CONTINUE',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
