import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/standard/settings/settings.dart';

part 'firestore_user.freezed.dart';
part 'firestore_user.g.dart';

@freezed
abstract class FirestoreUser with _$FirestoreUser {
  const factory FirestoreUser({
    required String name,
    required Settings settings,
    String? id,
  }) = _FirestoreUser;

  factory FirestoreUser.fromJson(Map<String, dynamic> json) => _$FirestoreUserFromJson(json);
}
