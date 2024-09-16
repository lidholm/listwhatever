// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Filters {
  Map<String, List<String>> get categoryFilters =>
      throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FiltersCopyWith<Filters> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltersCopyWith<$Res> {
  factory $FiltersCopyWith(Filters value, $Res Function(Filters) then) =
      _$FiltersCopyWithImpl<$Res, Filters>;
  @useResult
  $Res call(
      {Map<String, List<String>> categoryFilters,
      double? distance,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class _$FiltersCopyWithImpl<$Res, $Val extends Filters>
    implements $FiltersCopyWith<$Res> {
  _$FiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryFilters = null,
    Object? distance = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      categoryFilters: null == categoryFilters
          ? _value.categoryFilters
          : categoryFilters // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FiltersImplCopyWith<$Res> implements $FiltersCopyWith<$Res> {
  factory _$$FiltersImplCopyWith(
          _$FiltersImpl value, $Res Function(_$FiltersImpl) then) =
      __$$FiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, List<String>> categoryFilters,
      double? distance,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class __$$FiltersImplCopyWithImpl<$Res>
    extends _$FiltersCopyWithImpl<$Res, _$FiltersImpl>
    implements _$$FiltersImplCopyWith<$Res> {
  __$$FiltersImplCopyWithImpl(
      _$FiltersImpl _value, $Res Function(_$FiltersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryFilters = null,
    Object? distance = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$FiltersImpl(
      categoryFilters: null == categoryFilters
          ? _value._categoryFilters
          : categoryFilters // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$FiltersImpl extends _Filters {
  _$FiltersImpl(
      {required final Map<String, List<String>> categoryFilters,
      this.distance,
      this.startDate,
      this.endDate})
      : _categoryFilters = categoryFilters,
        super._();

  final Map<String, List<String>> _categoryFilters;
  @override
  Map<String, List<String>> get categoryFilters {
    if (_categoryFilters is EqualUnmodifiableMapView) return _categoryFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryFilters);
  }

  @override
  final double? distance;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'Filters(categoryFilters: $categoryFilters, distance: $distance, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiltersImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryFilters, _categoryFilters) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryFilters),
      distance,
      startDate,
      endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FiltersImplCopyWith<_$FiltersImpl> get copyWith =>
      __$$FiltersImplCopyWithImpl<_$FiltersImpl>(this, _$identity);
}

abstract class _Filters extends Filters {
  factory _Filters(
      {required final Map<String, List<String>> categoryFilters,
      final double? distance,
      final DateTime? startDate,
      final DateTime? endDate}) = _$FiltersImpl;
  _Filters._() : super._();

  @override
  Map<String, List<String>> get categoryFilters;
  @override
  double? get distance;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$FiltersImplCopyWith<_$FiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
