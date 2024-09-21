// ignore: one_member_abstracts
import 'package:cloud_firestore/cloud_firestore.dart';
import '/standard/firebase/firestore/firestore.dart';

class FirestoreService {
  FirestoreService({this.userId}) {
    _initFirestore();
  }

  late final FirebaseFirestore firestore;

  Future<void> _initFirestore() async {
    firestore = await getFirestore();
  }

  String? userId;

  // ignore: use_setters_to_change_properties
  void changeUser(String? userId) {
    this.userId = userId;
    // logger.i('$className => changing user id to $userId   QQ');
  }
}
