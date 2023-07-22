import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

AsyncValue<Tuple2<S, T>> combineTwoAsyncValues<S, T>(
  AsyncValue<S> firstValue,
  AsyncValue<T> secondValue,
) {
  if (firstValue is AsyncError) {
    return AsyncValue.error(firstValue.error!, firstValue.stackTrace!);
  } else if (secondValue is AsyncError) {
    return AsyncValue.error(secondValue.error!, secondValue.stackTrace!);
  } else if (firstValue is AsyncLoading || secondValue is AsyncLoading) {
    return const AsyncValue.loading();
  }
  return AsyncValue.data(
    Tuple2(firstValue.asData!.value, secondValue.asData!.value),
  );
}
