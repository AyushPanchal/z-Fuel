import 'package:geocoding/geocoding.dart';
import '../../export_all.dart';

class MapController extends GetxController {
  RxString locationInText = RxString('Loading...');
  RxString fullAddress = RxString('Loading...');
  LatLng userLocation = LatLng(0, 0);

  Future<String> fetchAddress(LatLng markerPosition) async {
    // call the placemarkFromCoordinates method to fetch the address
    List<Placemark> placeMarks = await placemarkFromCoordinates(
        markerPosition.latitude, markerPosition.longitude);

    // parse the JSON response to get the formatted address
    String address = '${placeMarks[0].subThoroughfare ?? ''} '
        '${placeMarks[0].thoroughfare ?? ''}, '
        '${placeMarks[0].subLocality ?? ''}, '
        '${placeMarks[0].locality ?? ''}, '
        '${placeMarks[0].administrativeArea ?? ''} '
        '${placeMarks[0].postalCode ?? ''}';
    return address;
  }
}
