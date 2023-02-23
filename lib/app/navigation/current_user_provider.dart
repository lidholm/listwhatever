import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterbase/app/firebase/firebase_auth_provider.dart';

final userChangesProvider = StreamProvider((ref) async* {
  final auth = await ref.watch(firebaseAuthProvider.future);
  yield* auth.userChanges().distinct((previous, next) {
    return previous?.email == next?.email && previous?.emailVerified == next?.emailVerified;
  });
});

final currentUserProvider = StreamProvider<User?>((ref) async* {
  final auth = await ref.watch(firebaseAuthProvider.future);
  final userValue = ref.watch(userChangesProvider);
  yield* userValue.when(
    error: (e, st) => Stream.value(null),
    loading: () => Stream.value(auth.currentUser),
    data: Stream.value,
  );
});
