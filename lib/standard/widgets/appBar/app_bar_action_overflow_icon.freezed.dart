// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bar_action_overflow_icon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppBarActionOverflowIcon {
  String get title => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  void Function() get callback => throw _privateConstructorUsedError;
  Key get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppBarActionOverflowIconCopyWith<AppBarActionOverflowIcon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBarActionOverflowIconCopyWith<$Res> {
  factory $AppBarActionOverflowIconCopyWith(AppBarActionOverflowIcon value,
          $Res Function(AppBarActionOverflowIcon) then) =
      _$AppBarActionOverflowIconCopyWithImpl<$Res, AppBarActionOverflowIcon>;
  @useResult
  $Res call({String title, IconData icon, void Function() callback, Key key});
}

/// @nodoc
class _$AppBarActionOverflowIconCopyWithImpl<$Res,
        $Val extends AppBarActionOverflowIcon>
    implements $AppBarActionOverflowIconCopyWith<$Res> {
  _$AppBarActionOverflowIconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? icon = null,
    Object? callback = null,
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      callback: null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as void Function(),
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppBarActionOverflowIconImplCopyWith<$Res>
    implements $AppBarActionOverflowIconCopyWith<$Res> {
  factory _$$AppBarActionOverflowIconImplCopyWith(
          _$AppBarActionOverflowIconImpl value,
          $Res Function(_$AppBarActionOverflowIconImpl) then) =
      __$$AppBarActionOverflowIconImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, IconData icon, void Function() callback, Key key});
}

/// @nodoc
class __$$AppBarActionOverflowIconImplCopyWithImpl<$Res>
    extends _$AppBarActionOverflowIconCopyWithImpl<$Res,
        _$AppBarActionOverflowIconImpl>
    implements _$$AppBarActionOverflowIconImplCopyWith<$Res> {
  __$$AppBarActionOverflowIconImplCopyWithImpl(
      _$AppBarActionOverflowIconImpl _value,
      $Res Function(_$AppBarActionOverflowIconImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? icon = null,
    Object? callback = null,
    Object? key = null,
  }) {
    return _then(_$AppBarActionOverflowIconImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      callback: null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as void Function(),
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
    ));
  }
}

/// @nodoc

class _$AppBarActionOverflowIconImpl implements _AppBarActionOverflowIcon {
  _$AppBarActionOverflowIconImpl(
      {required this.title,
      required this.icon,
      required this.callback,
      required this.key});

  @override
  final String title;
  @override
  final IconData icon;
  @override
  final void Function() callback;
  @override
  final Key key;

  @override
  String toString() {
    return 'AppBarActionOverflowIcon(title: $title, icon: $icon, callback: $callback, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppBarActionOverflowIconImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.callback, callback) ||
                other.callback == callback) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, icon, callback, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppBarActionOverflowIconImplCopyWith<_$AppBarActionOverflowIconImpl>
      get copyWith => __$$AppBarActionOverflowIconImplCopyWithImpl<
          _$AppBarActionOverflowIconImpl>(this, _$identity);
}

abstract class _AppBarActionOverflowIcon implements AppBarActionOverflowIcon {
  factory _AppBarActionOverflowIcon(
      {required final String title,
      required final IconData icon,
      required final void Function() callback,
      required final Key key}) = _$AppBarActionOverflowIconImpl;

  @override
  String get title;
  @override
  IconData get icon;
  @override
  void Function() get callback;
  @override
  Key get key;
  @override
  @JsonKey(ignore: true)
  _$$AppBarActionOverflowIconImplCopyWith<_$AppBarActionOverflowIconImpl>
      get copyWith => throw _privateConstructorUsedError;
}
