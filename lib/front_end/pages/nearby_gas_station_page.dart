import 'package:zfuel/export_all.dart';

class NearbyGasStationPage extends StatefulWidget {
  const NearbyGasStationPage({Key? key}) : super(key: key);

  @override
  State<NearbyGasStationPage> createState() => _NearbyGasStationPageState();
}

class _NearbyGasStationPageState extends State<NearbyGasStationPage> {
  final FirestoreController _firestoreController = Get.find();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(22.9978, 72.6660),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          AppDimensions.deviceWidth,
          AppDimensions.height300,
        ),
        child: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(
                  top: AppDimensions.height50,
                  right: AppDimensions.height10,
                  left: AppDimensions.height10,
                ),
                child: TextField(
                  cursorColor: AppColors.kRoadColor,
                  cursorHeight: AppDimensions.height20,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: AppDimensions.height10,
                    ),
                    hintText: "Search nearby fuel pump",
                    prefixIcon: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: AppColors.kRoadColor,
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<List<GasStationModel?>>(
        stream: _firestoreController.getGasStation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No data found.');
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.height20,
                        vertical: AppDimensions.height30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: AppDimensions.height200,
                                child: Text(
                                  '${data[index]!.name}',
                                  style: AppThemes.kMidText,
                                ),
                              ),
                              AppThemes.kSizedBoxHeight5,
                              Text(
                                '${data[index]!.area}, ${data[index]!.city}',
                                style: AppThemes.kSmallText,
                              ),
                              Text(
                                '2.7 km',
                                style: AppThemes.kSmallText,
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppDimensions.height30,
                              ),
                              primary: AppColors.kRoadColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.height10,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Order now',
                            ),
                          ),
                        ],
                      ),
                    ),
                    index != -1 && index != data.indexOf(data.last)
                        ? const Divider(
                            thickness: 1,
                            color: AppColors.kRoadColor,
                          )
                        : SizedBox.shrink(),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
