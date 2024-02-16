import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listwhatever/standard/userRepository/firestore_user.dart';

import '/standard/constants.dart';
import '/standard/firebase/firestore/firestore.dart';

class UserService {
  UserService({required this.userId}) {
    _initFirestore();
  }

  String? userId;
  late final FirebaseFirestore firestore;

  Future<void> _initFirestore() async {
    firestore = await getFirestore();
  }

  // ignore: use_setters_to_change_properties
  void changeUser(String? userId) {
    this.userId = userId;
  }

  Future<DocumentReference<Map<String, dynamic>>> getDocument() async {
    final path = '/users/$userId';
    logger.d('user path: $path');
    return firestore.doc(path);
  }

  Future<FirestoreUser?> getUser() async {
    final fu = await getDocument();
    final data = (await fu.get()).data();
    if (data == null) {
      return null;
    }
    return convertToUserList(fu.id, data);
  }

  FirestoreUser convertToUserList(String id, Map<String, dynamic> data) {
    final tmp = FirestoreUser.fromJson(data);
    return tmp.copyWith(id: id);
  }
}
