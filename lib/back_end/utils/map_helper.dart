import 'package:geocoding/geocoding.dart' as gc;
import 'package:zfuel/export_all.dart';

class MapHelper {
  static Future<LatLng> getUserLocation() async {
    var location = Location();
    const LatLng latLng = LatLng(0.0, 0.0);

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return latLng;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return latLng;
      }
    }
    locationData = await location.getLocation();
    if (locationData != null) {
      List<gc.Placemark> placemarks = await gc.placemarkFromCoordinates(
          locationData.latitude!, locationData.longitude!);
      gc.Placemark place = placemarks[0];
      String address = "${place.name}, ${place.locality}, ${place.country}";
      final MapController _mapController = Get.find();
      _mapController.locationInText.value = address;
      print("Address : ${address}");
      return LatLng(locationData.latitude!, locationData.longitude!);
    } else {
      return latLng;
    }
  }
}
