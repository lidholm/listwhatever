import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/helpers/combine_two_async_values.dart';
import 'package:tuple/tuple.dart';

AsyncValue<Tuple4<S, T, U, V>> combineFourAsyncValues<S, T, U, V>(
  AsyncValue<S> firstValue,
  AsyncValue<T> secondValue,
  AsyncValue<U> thirddValue,
  AsyncValue<V> fourthValue,
) {
  return combineTwoAsyncValues(
    combineTwoAsyncValues(firstValue, secondValue),
    combineTwoAsyncValues(thirddValue, fourthValue),
  ).when(
    error: AsyncValue.error,
    loading: AsyncValue.loading,
    data: (Tuple2<Tuple2<S, T>, Tuple2<U, V>> data) => AsyncValue.data(
      Tuple4(
        data.item1.item1,
        data.item1.item2,
        data.item2.item1,
        data.item2.item2,
      ),
    ),
  );
}
