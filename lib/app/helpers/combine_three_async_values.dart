import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/helpers/combine_two_async_values.dart';
import 'package:tuple/tuple.dart';

AsyncValue<Tuple3<S, T, U>> combineThreeAsyncValues<S, T, U>(
  AsyncValue<S> firstValue,
  AsyncValue<T> secondValue,
  AsyncValue<U> thirddValue,
) {
  return combineTwoAsyncValues(
    firstValue,
    combineTwoAsyncValues(secondValue, thirddValue),
  ).when(
    error: AsyncValue.error,
    loading: AsyncValue.loading,
    data: (Tuple2<S, Tuple2<T, U>> data) => AsyncValue.data(
      Tuple3(data.item1, data.item2.item1, data.item2.item2),
    ),
  );
}
