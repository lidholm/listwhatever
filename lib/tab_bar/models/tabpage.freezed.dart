// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tabpage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TabPage {
  String get key => throw _privateConstructorUsedError;
  String Function(BuildContext) get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  Widget get page => throw _privateConstructorUsedError;

  /// Create a copy of TabPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TabPageCopyWith<TabPage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabPageCopyWith<$Res> {
  factory $TabPageCopyWith(TabPage value, $Res Function(TabPage) then) =
      _$TabPageCopyWithImpl<$Res, TabPage>;
  @useResult
  $Res call(
      {String key,
      String Function(BuildContext) label,
      IconData icon,
      Widget page});
}

/// @nodoc
class _$TabPageCopyWithImpl<$Res, $Val extends TabPage>
    implements $TabPageCopyWith<$Res> {
  _$TabPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TabPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? label = null,
    Object? icon = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String Function(BuildContext),
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Widget,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabPageImplCopyWith<$Res> implements $TabPageCopyWith<$Res> {
  factory _$$TabPageImplCopyWith(
          _$TabPageImpl value, $Res Function(_$TabPageImpl) then) =
      __$$TabPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String Function(BuildContext) label,
      IconData icon,
      Widget page});
}

/// @nodoc
class __$$TabPageImplCopyWithImpl<$Res>
    extends _$TabPageCopyWithImpl<$Res, _$TabPageImpl>
    implements _$$TabPageImplCopyWith<$Res> {
  __$$TabPageImplCopyWithImpl(
      _$TabPageImpl _value, $Res Function(_$TabPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of TabPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? label = null,
    Object? icon = null,
    Object? page = null,
  }) {
    return _then(_$TabPageImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String Function(BuildContext),
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$TabPageImpl implements _TabPage {
  _$TabPageImpl(
      {required this.key,
      required this.label,
      required this.icon,
      required this.page});

  @override
  final String key;
  @override
  final String Function(BuildContext) label;
  @override
  final IconData icon;
  @override
  final Widget page;

  @override
  String toString() {
    return 'TabPage(key: $key, label: $label, icon: $icon, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabPageImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, label, icon, page);

  /// Create a copy of TabPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TabPageImplCopyWith<_$TabPageImpl> get copyWith =>
      __$$TabPageImplCopyWithImpl<_$TabPageImpl>(this, _$identity);
}

abstract class _TabPage implements TabPage {
  factory _TabPage(
      {required final String key,
      required final String Function(BuildContext) label,
      required final IconData icon,
      required final Widget page}) = _$TabPageImpl;

  @override
  String get key;
  @override
  String Function(BuildContext) get label;
  @override
  IconData get icon;
  @override
  Widget get page;

  /// Create a copy of TabPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TabPageImplCopyWith<_$TabPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
