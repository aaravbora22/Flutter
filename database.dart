import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // Collection reference
  final CollectionReference alarmCollection =
      FirebaseFirestore.instance.collection('AlarmReminders');

  Future updateUserData(String reminder, String name, int minutes) async {
    return await alarmCollection.doc(uid).set({
      'reminder': reminder,
      'name': name,
      'minutes': minutes,
    });
  }

  // get brew stream
  Stream<QuerySnapshot> get brews {
    return alarmCollection.snapshots();
  }
}
