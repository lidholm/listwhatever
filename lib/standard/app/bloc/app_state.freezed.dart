// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function(User user) loggedInWithData,
    required TResult Function(User user) onboardingRequired,
    required TResult Function() loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? loggedIn,
    TResult? Function(User user)? loggedInWithData,
    TResult? Function(User user)? onboardingRequired,
    TResult? Function()? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function(User user)? loggedInWithData,
    TResult Function(User user)? onboardingRequired,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoggedIn value) loggedIn,
    required TResult Function(LoggedInWithData value) loggedInWithData,
    required TResult Function(OnboardingRequired value) onboardingRequired,
    required TResult Function(LoggedOut value) loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoggedIn value)? loggedIn,
    TResult? Function(LoggedInWithData value)? loggedInWithData,
    TResult? Function(OnboardingRequired value)? onboardingRequired,
    TResult? Function(LoggedOut value)? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoggedIn value)? loggedIn,
    TResult Function(LoggedInWithData value)? loggedInWithData,
    TResult Function(OnboardingRequired value)? onboardingRequired,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoggedInImplCopyWith<$Res> {
  factory _$$LoggedInImplCopyWith(
          _$LoggedInImpl value, $Res Function(_$LoggedInImpl) then) =
      __$$LoggedInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoggedInImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$LoggedInImpl>
    implements _$$LoggedInImplCopyWith<$Res> {
  __$$LoggedInImplCopyWithImpl(
      _$LoggedInImpl _value, $Res Function(_$LoggedInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoggedInImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$LoggedInImpl implements LoggedIn {
  _$LoggedInImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AppState.loggedIn(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedInImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedInImplCopyWith<_$LoggedInImpl> get copyWith =>
      __$$LoggedInImplCopyWithImpl<_$LoggedInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function(User user) loggedInWithData,
    required TResult Function(User user) onboardingRequired,
    required TResult Function() loggedOut,
  }) {
    return loggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? loggedIn,
    TResult? Function(User user)? loggedInWithData,
    TResult? Function(User user)? onboardingRequired,
    TResult? Function()? loggedOut,
  }) {
    return loggedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function(User user)? loggedInWithData,
    TResult Function(User user)? onboardingRequired,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoggedIn value) loggedIn,
    required TResult Function(LoggedInWithData value) loggedInWithData,
    required TResult Function(OnboardingRequired value) onboardingRequired,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoggedIn value)? loggedIn,
    TResult? Function(LoggedInWithData value)? loggedInWithData,
    TResult? Function(OnboardingRequired value)? onboardingRequired,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoggedIn value)? loggedIn,
    TResult Function(LoggedInWithData value)? loggedInWithData,
    TResult Function(OnboardingRequired value)? onboardingRequired,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class LoggedIn implements AppState {
  factory LoggedIn(final User user) = _$LoggedInImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$LoggedInImplCopyWith<_$LoggedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoggedInWithDataImplCopyWith<$Res> {
  factory _$$LoggedInWithDataImplCopyWith(_$LoggedInWithDataImpl value,
          $Res Function(_$LoggedInWithDataImpl) then) =
      __$$LoggedInWithDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoggedInWithDataImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$LoggedInWithDataImpl>
    implements _$$LoggedInWithDataImplCopyWith<$Res> {
  __$$LoggedInWithDataImplCopyWithImpl(_$LoggedInWithDataImpl _value,
      $Res Function(_$LoggedInWithDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoggedInWithDataImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$LoggedInWithDataImpl implements LoggedInWithData {
  _$LoggedInWithDataImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AppState.loggedInWithData(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedInWithDataImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedInWithDataImplCopyWith<_$LoggedInWithDataImpl> get copyWith =>
      __$$LoggedInWithDataImplCopyWithImpl<_$LoggedInWithDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function(User user) loggedInWithData,
    required TResult Function(User user) onboardingRequired,
    required TResult Function() loggedOut,
  }) {
    return loggedInWithData(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? loggedIn,
    TResult? Function(User user)? loggedInWithData,
    TResult? Function(User user)? onboardingRequired,
    TResult? Function()? loggedOut,
  }) {
    return loggedInWithData?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function(User user)? loggedInWithData,
    TResult Function(User user)? onboardingRequired,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedInWithData != null) {
      return loggedInWithData(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoggedIn value) loggedIn,
    required TResult Function(LoggedInWithData value) loggedInWithData,
    required TResult Function(OnboardingRequired value) onboardingRequired,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return loggedInWithData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoggedIn value)? loggedIn,
    TResult? Function(LoggedInWithData value)? loggedInWithData,
    TResult? Function(OnboardingRequired value)? onboardingRequired,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return loggedInWithData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoggedIn value)? loggedIn,
    TResult Function(LoggedInWithData value)? loggedInWithData,
    TResult Function(OnboardingRequired value)? onboardingRequired,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedInWithData != null) {
      return loggedInWithData(this);
    }
    return orElse();
  }
}

abstract class LoggedInWithData implements AppState {
  factory LoggedInWithData(final User user) = _$LoggedInWithDataImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$LoggedInWithDataImplCopyWith<_$LoggedInWithDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnboardingRequiredImplCopyWith<$Res> {
  factory _$$OnboardingRequiredImplCopyWith(_$OnboardingRequiredImpl value,
          $Res Function(_$OnboardingRequiredImpl) then) =
      __$$OnboardingRequiredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$OnboardingRequiredImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$OnboardingRequiredImpl>
    implements _$$OnboardingRequiredImplCopyWith<$Res> {
  __$$OnboardingRequiredImplCopyWithImpl(_$OnboardingRequiredImpl _value,
      $Res Function(_$OnboardingRequiredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$OnboardingRequiredImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$OnboardingRequiredImpl implements OnboardingRequired {
  _$OnboardingRequiredImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AppState.onboardingRequired(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingRequiredImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingRequiredImplCopyWith<_$OnboardingRequiredImpl> get copyWith =>
      __$$OnboardingRequiredImplCopyWithImpl<_$OnboardingRequiredImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function(User user) loggedInWithData,
    required TResult Function(User user) onboardingRequired,
    required TResult Function() loggedOut,
  }) {
    return onboardingRequired(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? loggedIn,
    TResult? Function(User user)? loggedInWithData,
    TResult? Function(User user)? onboardingRequired,
    TResult? Function()? loggedOut,
  }) {
    return onboardingRequired?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function(User user)? loggedInWithData,
    TResult Function(User user)? onboardingRequired,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (onboardingRequired != null) {
      return onboardingRequired(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoggedIn value) loggedIn,
    required TResult Function(LoggedInWithData value) loggedInWithData,
    required TResult Function(OnboardingRequired value) onboardingRequired,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return onboardingRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoggedIn value)? loggedIn,
    TResult? Function(LoggedInWithData value)? loggedInWithData,
    TResult? Function(OnboardingRequired value)? onboardingRequired,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return onboardingRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoggedIn value)? loggedIn,
    TResult Function(LoggedInWithData value)? loggedInWithData,
    TResult Function(OnboardingRequired value)? onboardingRequired,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (onboardingRequired != null) {
      return onboardingRequired(this);
    }
    return orElse();
  }
}

abstract class OnboardingRequired implements AppState {
  factory OnboardingRequired(final User user) = _$OnboardingRequiredImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$OnboardingRequiredImplCopyWith<_$OnboardingRequiredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoggedOutImplCopyWith<$Res> {
  factory _$$LoggedOutImplCopyWith(
          _$LoggedOutImpl value, $Res Function(_$LoggedOutImpl) then) =
      __$$LoggedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggedOutImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$LoggedOutImpl>
    implements _$$LoggedOutImplCopyWith<$Res> {
  __$$LoggedOutImplCopyWithImpl(
      _$LoggedOutImpl _value, $Res Function(_$LoggedOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoggedOutImpl implements LoggedOut {
  _$LoggedOutImpl();

  @override
  String toString() {
    return 'AppState.loggedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function(User user) loggedInWithData,
    required TResult Function(User user) onboardingRequired,
    required TResult Function() loggedOut,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? loggedIn,
    TResult? Function(User user)? loggedInWithData,
    TResult? Function(User user)? onboardingRequired,
    TResult? Function()? loggedOut,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function(User user)? loggedInWithData,
    TResult Function(User user)? onboardingRequired,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoggedIn value) loggedIn,
    required TResult Function(LoggedInWithData value) loggedInWithData,
    required TResult Function(OnboardingRequired value) onboardingRequired,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoggedIn value)? loggedIn,
    TResult? Function(LoggedInWithData value)? loggedInWithData,
    TResult? Function(OnboardingRequired value)? onboardingRequired,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoggedIn value)? loggedIn,
    TResult Function(LoggedInWithData value)? loggedInWithData,
    TResult Function(OnboardingRequired value)? onboardingRequired,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class LoggedOut implements AppState {
  factory LoggedOut() = _$LoggedOutImpl;
}
