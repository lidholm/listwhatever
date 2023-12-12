// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bar_action_dropdown.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppBarActionDropdown<T> {
  IconData get icon => throw _privateConstructorUsedError;
  String? get tooltip => throw _privateConstructorUsedError;
  void Function(T) get callback => throw _privateConstructorUsedError;
  List<(T, Widget)> get menuItems => throw _privateConstructorUsedError;
  Key get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppBarActionDropdownCopyWith<T, AppBarActionDropdown<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBarActionDropdownCopyWith<T, $Res> {
  factory $AppBarActionDropdownCopyWith(AppBarActionDropdown<T> value,
          $Res Function(AppBarActionDropdown<T>) then) =
      _$AppBarActionDropdownCopyWithImpl<T, $Res, AppBarActionDropdown<T>>;
  @useResult
  $Res call(
      {IconData icon,
      String? tooltip,
      void Function(T) callback,
      List<(T, Widget)> menuItems,
      Key key});
}

/// @nodoc
class _$AppBarActionDropdownCopyWithImpl<T, $Res,
        $Val extends AppBarActionDropdown<T>>
    implements $AppBarActionDropdownCopyWith<T, $Res> {
  _$AppBarActionDropdownCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? tooltip = freezed,
    Object? callback = null,
    Object? menuItems = null,
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      tooltip: freezed == tooltip
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
      callback: null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as void Function(T),
      menuItems: null == menuItems
          ? _value.menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<(T, Widget)>,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppBarActionDropdownCopyWith<T, $Res>
    implements $AppBarActionDropdownCopyWith<T, $Res> {
  factory _$$_AppBarActionDropdownCopyWith(_$_AppBarActionDropdown<T> value,
          $Res Function(_$_AppBarActionDropdown<T>) then) =
      __$$_AppBarActionDropdownCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {IconData icon,
      String? tooltip,
      void Function(T) callback,
      List<(T, Widget)> menuItems,
      Key key});
}

/// @nodoc
class __$$_AppBarActionDropdownCopyWithImpl<T, $Res>
    extends _$AppBarActionDropdownCopyWithImpl<T, $Res,
        _$_AppBarActionDropdown<T>>
    implements _$$_AppBarActionDropdownCopyWith<T, $Res> {
  __$$_AppBarActionDropdownCopyWithImpl(_$_AppBarActionDropdown<T> _value,
      $Res Function(_$_AppBarActionDropdown<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? tooltip = freezed,
    Object? callback = null,
    Object? menuItems = null,
    Object? key = null,
  }) {
    return _then(_$_AppBarActionDropdown<T>(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      tooltip: freezed == tooltip
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
      callback: null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as void Function(T),
      menuItems: null == menuItems
          ? _value._menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<(T, Widget)>,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
    ));
  }
}

/// @nodoc

class _$_AppBarActionDropdown<T> implements _AppBarActionDropdown<T> {
  _$_AppBarActionDropdown(
      {required this.icon,
      required this.tooltip,
      required this.callback,
      required final List<(T, Widget)> menuItems,
      required this.key})
      : _menuItems = menuItems;

  @override
  final IconData icon;
  @override
  final String? tooltip;
  @override
  final void Function(T) callback;
  final List<(T, Widget)> _menuItems;
  @override
  List<(T, Widget)> get menuItems {
    if (_menuItems is EqualUnmodifiableListView) return _menuItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuItems);
  }

  @override
  final Key key;

  @override
  String toString() {
    return 'AppBarActionDropdown<$T>(icon: $icon, tooltip: $tooltip, callback: $callback, menuItems: $menuItems, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppBarActionDropdown<T> &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.callback, callback) ||
                other.callback == callback) &&
            const DeepCollectionEquality()
                .equals(other._menuItems, _menuItems) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, icon, tooltip, callback,
      const DeepCollectionEquality().hash(_menuItems), key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppBarActionDropdownCopyWith<T, _$_AppBarActionDropdown<T>>
      get copyWith =>
          __$$_AppBarActionDropdownCopyWithImpl<T, _$_AppBarActionDropdown<T>>(
              this, _$identity);
}

abstract class _AppBarActionDropdown<T> implements AppBarActionDropdown<T> {
  factory _AppBarActionDropdown(
      {required final IconData icon,
      required final String? tooltip,
      required final void Function(T) callback,
      required final List<(T, Widget)> menuItems,
      required final Key key}) = _$_AppBarActionDropdown<T>;

  @override
  IconData get icon;
  @override
  String? get tooltip;
  @override
  void Function(T) get callback;
  @override
  List<(T, Widget)> get menuItems;
  @override
  Key get key;
  @override
  @JsonKey(ignore: true)
  _$$_AppBarActionDropdownCopyWith<T, _$_AppBarActionDropdown<T>>
      get copyWith => throw _privateConstructorUsedError;
}
