// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bar_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppBarAction<T> {
  AppBarActionType get type => throw _privateConstructorUsedError;
  AppBarActionIcon? get iconAction => throw _privateConstructorUsedError;
  AppBarActionDropdown<T>? get dropdownAction =>
      throw _privateConstructorUsedError;
  AppBarActionOverflowIcon? get overflowIcon =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppBarActionCopyWith<T, AppBarAction<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBarActionCopyWith<T, $Res> {
  factory $AppBarActionCopyWith(
          AppBarAction<T> value, $Res Function(AppBarAction<T>) then) =
      _$AppBarActionCopyWithImpl<T, $Res, AppBarAction<T>>;
  @useResult
  $Res call(
      {AppBarActionType type,
      AppBarActionIcon? iconAction,
      AppBarActionDropdown<T>? dropdownAction,
      AppBarActionOverflowIcon? overflowIcon});

  $AppBarActionIconCopyWith<$Res>? get iconAction;
  $AppBarActionDropdownCopyWith<T, $Res>? get dropdownAction;
  $AppBarActionOverflowIconCopyWith<$Res>? get overflowIcon;
}

/// @nodoc
class _$AppBarActionCopyWithImpl<T, $Res, $Val extends AppBarAction<T>>
    implements $AppBarActionCopyWith<T, $Res> {
  _$AppBarActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? iconAction = freezed,
    Object? dropdownAction = freezed,
    Object? overflowIcon = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AppBarActionType,
      iconAction: freezed == iconAction
          ? _value.iconAction
          : iconAction // ignore: cast_nullable_to_non_nullable
              as AppBarActionIcon?,
      dropdownAction: freezed == dropdownAction
          ? _value.dropdownAction
          : dropdownAction // ignore: cast_nullable_to_non_nullable
              as AppBarActionDropdown<T>?,
      overflowIcon: freezed == overflowIcon
          ? _value.overflowIcon
          : overflowIcon // ignore: cast_nullable_to_non_nullable
              as AppBarActionOverflowIcon?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppBarActionIconCopyWith<$Res>? get iconAction {
    if (_value.iconAction == null) {
      return null;
    }

    return $AppBarActionIconCopyWith<$Res>(_value.iconAction!, (value) {
      return _then(_value.copyWith(iconAction: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppBarActionDropdownCopyWith<T, $Res>? get dropdownAction {
    if (_value.dropdownAction == null) {
      return null;
    }

    return $AppBarActionDropdownCopyWith<T, $Res>(_value.dropdownAction!,
        (value) {
      return _then(_value.copyWith(dropdownAction: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppBarActionOverflowIconCopyWith<$Res>? get overflowIcon {
    if (_value.overflowIcon == null) {
      return null;
    }

    return $AppBarActionOverflowIconCopyWith<$Res>(_value.overflowIcon!,
        (value) {
      return _then(_value.copyWith(overflowIcon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppBarActionImplCopyWith<T, $Res>
    implements $AppBarActionCopyWith<T, $Res> {
  factory _$$AppBarActionImplCopyWith(_$AppBarActionImpl<T> value,
          $Res Function(_$AppBarActionImpl<T>) then) =
      __$$AppBarActionImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {AppBarActionType type,
      AppBarActionIcon? iconAction,
      AppBarActionDropdown<T>? dropdownAction,
      AppBarActionOverflowIcon? overflowIcon});

  @override
  $AppBarActionIconCopyWith<$Res>? get iconAction;
  @override
  $AppBarActionDropdownCopyWith<T, $Res>? get dropdownAction;
  @override
  $AppBarActionOverflowIconCopyWith<$Res>? get overflowIcon;
}

/// @nodoc
class __$$AppBarActionImplCopyWithImpl<T, $Res>
    extends _$AppBarActionCopyWithImpl<T, $Res, _$AppBarActionImpl<T>>
    implements _$$AppBarActionImplCopyWith<T, $Res> {
  __$$AppBarActionImplCopyWithImpl(
      _$AppBarActionImpl<T> _value, $Res Function(_$AppBarActionImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? iconAction = freezed,
    Object? dropdownAction = freezed,
    Object? overflowIcon = freezed,
  }) {
    return _then(_$AppBarActionImpl<T>(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AppBarActionType,
      iconAction: freezed == iconAction
          ? _value.iconAction
          : iconAction // ignore: cast_nullable_to_non_nullable
              as AppBarActionIcon?,
      dropdownAction: freezed == dropdownAction
          ? _value.dropdownAction
          : dropdownAction // ignore: cast_nullable_to_non_nullable
              as AppBarActionDropdown<T>?,
      overflowIcon: freezed == overflowIcon
          ? _value.overflowIcon
          : overflowIcon // ignore: cast_nullable_to_non_nullable
              as AppBarActionOverflowIcon?,
    ));
  }
}

/// @nodoc

class _$AppBarActionImpl<T> implements _AppBarAction<T> {
  _$AppBarActionImpl(
      {required this.type,
      this.iconAction = null,
      this.dropdownAction = null,
      this.overflowIcon = null});

  @override
  final AppBarActionType type;
  @override
  @JsonKey()
  final AppBarActionIcon? iconAction;
  @override
  @JsonKey()
  final AppBarActionDropdown<T>? dropdownAction;
  @override
  @JsonKey()
  final AppBarActionOverflowIcon? overflowIcon;

  @override
  String toString() {
    return 'AppBarAction<$T>(type: $type, iconAction: $iconAction, dropdownAction: $dropdownAction, overflowIcon: $overflowIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppBarActionImpl<T> &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.iconAction, iconAction) ||
                other.iconAction == iconAction) &&
            (identical(other.dropdownAction, dropdownAction) ||
                other.dropdownAction == dropdownAction) &&
            (identical(other.overflowIcon, overflowIcon) ||
                other.overflowIcon == overflowIcon));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, type, iconAction, dropdownAction, overflowIcon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppBarActionImplCopyWith<T, _$AppBarActionImpl<T>> get copyWith =>
      __$$AppBarActionImplCopyWithImpl<T, _$AppBarActionImpl<T>>(
          this, _$identity);
}

abstract class _AppBarAction<T> implements AppBarAction<T> {
  factory _AppBarAction(
      {required final AppBarActionType type,
      final AppBarActionIcon? iconAction,
      final AppBarActionDropdown<T>? dropdownAction,
      final AppBarActionOverflowIcon? overflowIcon}) = _$AppBarActionImpl<T>;

  @override
  AppBarActionType get type;
  @override
  AppBarActionIcon? get iconAction;
  @override
  AppBarActionDropdown<T>? get dropdownAction;
  @override
  AppBarActionOverflowIcon? get overflowIcon;
  @override
  @JsonKey(ignore: true)
  _$$AppBarActionImplCopyWith<T, _$AppBarActionImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
