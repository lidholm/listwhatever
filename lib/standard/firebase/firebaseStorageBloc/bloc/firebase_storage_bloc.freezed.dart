// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_storage_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FirebaseStorageEvent {
  List<String> get filenames => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> filenames) loadFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> filenames)? loadFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> filenames)? loadFiles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFiles value) loadFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFiles value)? loadFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFiles value)? loadFiles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FirebaseStorageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirebaseStorageEventCopyWith<FirebaseStorageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseStorageEventCopyWith<$Res> {
  factory $FirebaseStorageEventCopyWith(FirebaseStorageEvent value,
          $Res Function(FirebaseStorageEvent) then) =
      _$FirebaseStorageEventCopyWithImpl<$Res, FirebaseStorageEvent>;
  @useResult
  $Res call({List<String> filenames});
}

/// @nodoc
class _$FirebaseStorageEventCopyWithImpl<$Res,
        $Val extends FirebaseStorageEvent>
    implements $FirebaseStorageEventCopyWith<$Res> {
  _$FirebaseStorageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirebaseStorageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filenames = null,
  }) {
    return _then(_value.copyWith(
      filenames: null == filenames
          ? _value.filenames
          : filenames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadFilesImplCopyWith<$Res>
    implements $FirebaseStorageEventCopyWith<$Res> {
  factory _$$LoadFilesImplCopyWith(
          _$LoadFilesImpl value, $Res Function(_$LoadFilesImpl) then) =
      __$$LoadFilesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> filenames});
}

/// @nodoc
class __$$LoadFilesImplCopyWithImpl<$Res>
    extends _$FirebaseStorageEventCopyWithImpl<$Res, _$LoadFilesImpl>
    implements _$$LoadFilesImplCopyWith<$Res> {
  __$$LoadFilesImplCopyWithImpl(
      _$LoadFilesImpl _value, $Res Function(_$LoadFilesImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseStorageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filenames = null,
  }) {
    return _then(_$LoadFilesImpl(
      null == filenames
          ? _value._filenames
          : filenames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$LoadFilesImpl implements _LoadFiles {
  const _$LoadFilesImpl(final List<String> filenames) : _filenames = filenames;

  final List<String> _filenames;
  @override
  List<String> get filenames {
    if (_filenames is EqualUnmodifiableListView) return _filenames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filenames);
  }

  @override
  String toString() {
    return 'FirebaseStorageEvent.loadFiles(filenames: $filenames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFilesImpl &&
            const DeepCollectionEquality()
                .equals(other._filenames, _filenames));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_filenames));

  /// Create a copy of FirebaseStorageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFilesImplCopyWith<_$LoadFilesImpl> get copyWith =>
      __$$LoadFilesImplCopyWithImpl<_$LoadFilesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> filenames) loadFiles,
  }) {
    return loadFiles(filenames);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> filenames)? loadFiles,
  }) {
    return loadFiles?.call(filenames);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> filenames)? loadFiles,
    required TResult orElse(),
  }) {
    if (loadFiles != null) {
      return loadFiles(filenames);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFiles value) loadFiles,
  }) {
    return loadFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFiles value)? loadFiles,
  }) {
    return loadFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFiles value)? loadFiles,
    required TResult orElse(),
  }) {
    if (loadFiles != null) {
      return loadFiles(this);
    }
    return orElse();
  }
}

abstract class _LoadFiles implements FirebaseStorageEvent {
  const factory _LoadFiles(final List<String> filenames) = _$LoadFilesImpl;

  @override
  List<String> get filenames;

  /// Create a copy of FirebaseStorageEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadFilesImplCopyWith<_$LoadFilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FirebaseStorageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<String> imageUrls) filesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<String> imageUrls)? filesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<String> imageUrls)? filesLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(FilesLoaded value) filesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(FilesLoaded value)? filesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(FilesLoaded value)? filesLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseStorageStateCopyWith<$Res> {
  factory $FirebaseStorageStateCopyWith(FirebaseStorageState value,
          $Res Function(FirebaseStorageState) then) =
      _$FirebaseStorageStateCopyWithImpl<$Res, FirebaseStorageState>;
}

/// @nodoc
class _$FirebaseStorageStateCopyWithImpl<$Res,
        $Val extends FirebaseStorageState>
    implements $FirebaseStorageStateCopyWith<$Res> {
  _$FirebaseStorageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirebaseStorageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FirebaseStorageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseStorageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FirebaseStorageState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<String> imageUrls) filesLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<String> imageUrls)? filesLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<String> imageUrls)? filesLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(FilesLoaded value) filesLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(FilesLoaded value)? filesLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(FilesLoaded value)? filesLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements FirebaseStorageState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$FirebaseStorageStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseStorageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'FirebaseStorageState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<String> imageUrls) filesLoaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<String> imageUrls)? filesLoaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<String> imageUrls)? filesLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(FilesLoaded value) filesLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(FilesLoaded value)? filesLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(FilesLoaded value)? filesLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements FirebaseStorageState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FilesLoadedImplCopyWith<$Res> {
  factory _$$FilesLoadedImplCopyWith(
          _$FilesLoadedImpl value, $Res Function(_$FilesLoadedImpl) then) =
      __$$FilesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> imageUrls});
}

/// @nodoc
class __$$FilesLoadedImplCopyWithImpl<$Res>
    extends _$FirebaseStorageStateCopyWithImpl<$Res, _$FilesLoadedImpl>
    implements _$$FilesLoadedImplCopyWith<$Res> {
  __$$FilesLoadedImplCopyWithImpl(
      _$FilesLoadedImpl _value, $Res Function(_$FilesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseStorageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrls = null,
  }) {
    return _then(_$FilesLoadedImpl(
      null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$FilesLoadedImpl implements FilesLoaded {
  const _$FilesLoadedImpl(final List<String> imageUrls)
      : _imageUrls = imageUrls;

  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  String toString() {
    return 'FirebaseStorageState.filesLoaded(imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilesLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_imageUrls));

  /// Create a copy of FirebaseStorageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilesLoadedImplCopyWith<_$FilesLoadedImpl> get copyWith =>
      __$$FilesLoadedImplCopyWithImpl<_$FilesLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<String> imageUrls) filesLoaded,
  }) {
    return filesLoaded(imageUrls);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<String> imageUrls)? filesLoaded,
  }) {
    return filesLoaded?.call(imageUrls);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<String> imageUrls)? filesLoaded,
    required TResult orElse(),
  }) {
    if (filesLoaded != null) {
      return filesLoaded(imageUrls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(FilesLoaded value) filesLoaded,
  }) {
    return filesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(FilesLoaded value)? filesLoaded,
  }) {
    return filesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(FilesLoaded value)? filesLoaded,
    required TResult orElse(),
  }) {
    if (filesLoaded != null) {
      return filesLoaded(this);
    }
    return orElse();
  }
}

abstract class FilesLoaded implements FirebaseStorageState {
  const factory FilesLoaded(final List<String> imageUrls) = _$FilesLoadedImpl;

  List<String> get imageUrls;

  /// Create a copy of FirebaseStorageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilesLoadedImplCopyWith<_$FilesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
