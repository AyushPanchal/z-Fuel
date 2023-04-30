import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zfuel/export_all.dart';

class FirestoreController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Stream<List<GasStationModel>> getGasStation() {
    final CollectionReference gasStationCollection =
        _firestore.collection('GasStationModel');
    return gasStationCollection.snapshots().map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return [];
      } else {
        try {
          final data = snapshot.docs
              .map((doc) =>
                  GasStationModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();
          return data;
        } catch (e) {
          return [];
        }
      }
    });
  }
}
