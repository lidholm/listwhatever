import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_user.freezed.dart';
part 'firestore_user.g.dart';

@freezed
class FirestoreUser with _$FirestoreUser {
  factory FirestoreUser({
    required String uid,
    required String email,
  }) = _FirestoreUser;

  factory FirestoreUser.fromJson(Map<String, dynamic> json) =>
      _$FirestoreUserFromJson(json);
}
