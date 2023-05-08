import 'package:geocoding/geocoding.dart' as gc;
import 'package:zfuel/export_all.dart';

class MapHelper {
  static LatLng userLocation = const LatLng(0, 0);
  static Set<Marker> petrolPumpMarkers = {};
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
      List<gc.Placemark> placeMarks = await gc.placemarkFromCoordinates(
          locationData.latitude!, locationData.longitude!);
      gc.Placemark place = placeMarks[0];
      String address = "${place.name}, ${place.locality}, ${place.country}";
      final MapController mapController = Get.find();
      mapController.userLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
      mapController.locationInText.value = address;
      userLocation = LatLng(locationData.latitude!, locationData.longitude!);
      return LatLng(locationData.latitude!, locationData.longitude!);
    } else {
      return latLng;
    }
  }

  ///Generating stream for LatLng for map.
  static Stream<LatLng> getUserLocationStream() {
    var location = Location();
    const LatLng latLng = LatLng(0.0, 0.0);
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    StreamController<LatLng> locationStreamController =
        StreamController<LatLng>.broadcast();

    locationStreamController.onListen = () async {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          locationStreamController.add(latLng);
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          locationStreamController.add(latLng);
          return;
        }
      }

      location.onLocationChanged.listen((LocationData currentLocation) async {
        if (currentLocation != null) {
          List<gc.Placemark> placeMarks = await gc.placemarkFromCoordinates(
              currentLocation.latitude!, currentLocation.longitude!);
          gc.Placemark place = placeMarks[0];
          String address = "${place.name}, ${place.locality}, ${place.country}";
          final MapController mapController = Get.find();
          mapController.locationInText.value = address;
          mapController.fullAddress.value = ''
              '${place.subLocality ?? ''}, '
              '${place.locality ?? ''}, '
              '${place.administrativeArea ?? ''} '
              '${place.postalCode ?? ''}';
          final LatLng userLocation = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
          locationStreamController.add(userLocation);
        }
      });
    };

    return locationStreamController.stream;
  }
}
