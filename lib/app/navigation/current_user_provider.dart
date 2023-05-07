import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_auth_provider.dart';
import 'package:listanything/app/firebase/firebase_user_repository_provider.dart';
import 'package:listanything/app/firebase/firestore_user.dart';
import 'package:listanything/app/helpers/constants.dart';

// const SelectedUser? userOverride = null;
// final userOverride = SelectedUser(uid: 'XKyyh5drxmUMT3GI1jij6HGhyjk2', email: 'useroverride@email.com'); // Prod
// final userOverride = SelectedUser(uid: 'p705JjMr9UzanvEERZhYUpsS5jqa', email: 'regular@email.com'); // Local
// // ignore: unnecessary_null_comparison
// if (userOverride != null) {
//   yield* Stream.value(userOverride);
//   return;
// }

final _userChangesProvider = StreamProvider<User?>((ref) async* {
  final auth = await ref.watch(firebaseAuthProvider.future);
  yield* auth.userChanges().distinct((previous, next) {
    return previous?.email == next?.email &&
        previous?.emailVerified == next?.emailVerified;
  });
});

final currentUserProvider = Provider<AsyncValue<FirestoreUser?>>((ref) {
  final authValue = ref.watch(firebaseAuthProvider);
  final userValue = ref.watch(_userChangesProvider);

  String? uid;

  if (authValue is AsyncError) {
    return AsyncValue.error(authValue.error!, authValue.stackTrace!);
  } else if (userValue is AsyncError) {
    return AsyncValue.error(userValue.error!, userValue.stackTrace!);
  } else if (authValue is AsyncLoading && userValue is AsyncLoading) {
    return const AsyncValue.loading();
  } else if (userValue is AsyncLoading) {
    final auth = authValue.asData!.value;
    uid = auth.currentUser?.uid;
  } else {
    uid = userValue.asData!.value?.uid;
  }

  if (uid == null) {
    return const AsyncValue.data(null);
  }

  final firestoreUserValue = ref.watch(userProvider(uid));
  return firestoreUserValue;
});

final userProvider =
    StreamProvider.family<FirestoreUser?, String>((ref, userId) async* {
  logger.d('in userProvider');
  final repo = await ref.watch(fiirebaseUserRepositoryProvider.future);
  logger.d('repo: $repo');
  yield* repo.retrieveItemStream(itemId: userId);
});
