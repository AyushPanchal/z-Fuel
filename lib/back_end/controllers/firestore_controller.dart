import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zfuel/export_all.dart';

class FirestoreController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirestoreController instance = Get.find();

  final markersController = StreamController<Set<Marker>>.broadcast();
  /*=====CRUD FOR GAS STATION MODEL=====*/
  /*=====CREATE FOR GAS STATION MODEL=====*/
  Future<void> createGasStation(GasStationModel gasStation) async {
    try {
      await _firestore
          .collection('GasStationModel')
          .doc(gasStation.gasStationId)
          .set(gasStation.toJson());
    } catch (error) {
      print('Error creating gas station: $error');
      rethrow;
    }
  }

  /*=====READ FOR GAS STATION MODEL=====*/
  Stream<List<GasStationModel>> getGasStation() {
    const double radius = 5.0;
    final CollectionReference gasStationCollection =
        _firestore.collection('GasStationModel');
    return gasStationCollection
        .where('location',
            isLessThan: GeoPoint(
                MapHelper.userLocation.latitude + radius / 111.0,
                MapHelper.userLocation.longitude +
                    radius /
                        (111.0 *
                            cos(MapHelper.userLocation.latitude * pi / 180.0))))
        .where('location',
            isGreaterThan: GeoPoint(
                MapHelper.userLocation.latitude - radius / 111.0,
                MapHelper.userLocation.longitude -
                    radius /
                        (111.0 *
                            cos(MapHelper.userLocation.latitude * pi / 180.0))))
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return [];
      } else {
        try {
          final data = snapshot.docs
              .map((doc) =>
                  GasStationModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();

          Set<Marker> markers = Set();
          for (GasStationModel gsm in data) {
            Marker marker = Marker(
                markerId: MarkerId(gsm.name!),
                position:
                    LatLng(gsm.location!.latitude, gsm.location!.longitude));
            MapHelper.petrolPumpMarkers.add(marker);
          }

          markersController.sink.add(markers);
          return data;
        } catch (e) {
          return [];
        }
      }
    });
  }

  /*=====CRUD FOR USER MODEL=====*/
  /*=====CREATE FOR USER MODEL=====*/
  Future<dynamic> createUser(UserModel user) async {
    try {
      await _firestore.collection('UserModel').add(user.toJson());
    } catch (e) {
      print("Error ayigai $e");
    }
  }

  /*=====CRUD FOR FLEET DRIVER MODEL=====*/
  /*=====READ FOR FLEET DRIVER MODEL=====*/
  Stream<List<FleetDriverModel>> getFleetDriver() {
    CollectionReference fleetDriverReference =
        _firestore.collection('FleetDriverModel');

    return fleetDriverReference.snapshots().map((snapshots) {
      if (snapshots.docs.isEmpty) {
        return [];
      } else {
        try {
          return snapshots.docs
              .map((doc) =>
                  FleetDriverModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();
        } catch (e) {
          return [];
        }
      }
    });
  }
}
