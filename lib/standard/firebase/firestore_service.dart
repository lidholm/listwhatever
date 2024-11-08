// ignore: one_member_abstracts
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore.dart';

class FirestoreService {
  FirestoreService({this.userId}) {
    _initFirestore();
  }

  Future<void> _initFirestore() async {
    firestore = await getFirestore();
  }

  late final FirebaseFirestore firestore;
  String? userId;

  // ignore: use_setters_to_change_properties
  void changeUser(String? userId) {
    this.userId = userId;
    //
  }
}
