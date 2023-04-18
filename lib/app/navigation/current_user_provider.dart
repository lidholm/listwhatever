import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_auth_provider.dart';
import 'package:listanything/app/navigation/selected_user.dart';

const SelectedUser? userOverride = null;
// final userOverride = SelectedUser(uid: 'XKyyh5drxmUMT3GI1jij6HGhyjk2', email: 'useroverride@email.com'); // Prod
// final userOverride = SelectedUser(uid: 'p705JjMr9UzanvEERZhYUpsS5jqa', email: 'regular@email.com'); // Local

final userChangesProvider = StreamProvider<SelectedUser?>((ref) async* {
  // ignore: unnecessary_null_comparison
  if (userOverride != null) {
    yield* Stream.value(userOverride);
    return;
  }

  final auth = await ref.watch(firebaseAuthProvider.future);
  yield* auth.userChanges().distinct((previous, next) {
    return previous?.email == next?.email && previous?.emailVerified == next?.emailVerified;
  }).map(mapSelectedUser);
});

final currentUserProvider = StreamProvider<SelectedUser?>((ref) async* {
  final auth = await ref.watch(firebaseAuthProvider.future);
  final userValue = ref.watch(userChangesProvider);
  yield* userValue.when(
    error: (e, st) => Stream.value(null),
    loading: () => Stream.value(mapSelectedUser(auth.currentUser)),
    data: Stream.value,
  );
});

SelectedUser? mapSelectedUser(User? user) {
  if (user == null) return null;
  return SelectedUser(
    uid: user.uid,
    email: user.email,
    name: user.displayName,
  );
}
