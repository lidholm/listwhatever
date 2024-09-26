import 'package:cloud_firestore/cloud_firestore.dart';

import '/standard/constants.dart';
import '../firebase/firestore_service.dart';
import '/standard/userRepository/models/user.dart';

class UserService extends FirestoreService {
  UserService({super.userId});

  static String className = 'UserService';

  Future<DocumentReference<Map<String, dynamic>>> getDocument([
    String? userId,
  ]) async {
    final path = '/users/${userId ?? this.userId}';
    logger.d('$className => user path: $path');
    return firestore.doc(path);
  }

  Future<User?> getUser(String? userId) async {
    if (userId == null) {
      return null;
    }
    final fu = await getDocument(userId);
    final data = (await fu.get()).data();
    if (data == null) {
      return null;
    }
    return convertToUserList(fu.id, data);
  }

  User convertToUserList(String id, Map<String, dynamic> data) {
    final tmp = User.fromJson(data);
    return tmp.copyWith(id: id);
  }

  Future<User> updateUser(User user) async {
    logger.d('updating user: $user');
    final doc = await getDocument(user.id);
    final options = SetOptions(merge: true);
    await doc.set(user.toJson(), options);
    return user;
  }

  Future<User> addUser(User user) async {
    logger.d('updating user: $user');
    final doc = await getDocument(user.id);
    await doc.set(user.toJson());
    return user;
  }
}
