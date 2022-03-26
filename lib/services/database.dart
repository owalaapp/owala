import 'package:cloud_firestore/cloud_firestore.dart';

class DatebaseService {
  final String uid;

  DatebaseService({required this.uid});
  // collection referernce
  final CollectionReference bewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserDate(String sugars, String name, int strength) async {
    return await bewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }
}
