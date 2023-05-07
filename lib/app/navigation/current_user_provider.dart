import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_auth_provider.dart';
import 'package:listanything/app/navigation/selected_user.dart';

const SelectedUser? userOverride = null;
// final userOverride = SelectedUser(uid: 'XKyyh5drxmUMT3GI1jij6HGhyjk2', email: 'useroverride@email.com'); // Prod
// final userOverride = SelectedUser(uid: 'p705JjMr9UzanvEERZhYUpsS5jqa', email: 'regular@email.com'); // Local

final _userChangesProvider = StreamProvider<User?>((ref) async* {
  final auth = await ref.watch(firebaseAuthProvider.future);
  yield* auth.userChanges().distinct((previous, next) {
    return previous?.email == next?.email &&
        previous?.emailVerified == next?.emailVerified;
  });
});

final currentUserProvider = Provider<AsyncValue<SelectedUser?>>((ref) {
  final authValue = ref.watch(firebaseAuthProvider);
  final userValue = ref.watch(_userChangesProvider);

  if (authValue is AsyncError) {
    return AsyncValue.error(authValue.error!, authValue.stackTrace!);
  } else if (userValue is AsyncError) {
    return AsyncValue.error(userValue.error!, userValue.stackTrace!);
  } else if (authValue is AsyncLoading && userValue is AsyncLoading) {
    return const AsyncValue.loading();
  } else if (userValue is AsyncLoading) {
    final auth = authValue.asData!.value;
    final mappedUser = mapSelectedUser(auth.currentUser);
    return AsyncValue.data(mappedUser);
  }

  final user = userValue.asData!.value;
  return AsyncValue.data(mapSelectedUser(user));
});

SelectedUser? mapSelectedUser(
  User? user,
) {
  if (user == null) return null;

  // ignore: unnecessary_null_comparison
  if (userOverride != null) {
    return userOverride;
  }

  return SelectedUser(
    uid: user.uid,
    email: user.email,
    name: user.displayName,
  );
}
