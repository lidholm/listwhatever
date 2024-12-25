// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lists_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchUserLists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchUserLists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchUserLists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchUserLists value) watchUserLists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchUserLists value)? watchUserLists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchUserLists value)? watchUserLists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListsEventCopyWith<$Res> {
  factory $ListsEventCopyWith(
          ListsEvent value, $Res Function(ListsEvent) then) =
      _$ListsEventCopyWithImpl<$Res, ListsEvent>;
}

/// @nodoc
class _$ListsEventCopyWithImpl<$Res, $Val extends ListsEvent>
    implements $ListsEventCopyWith<$Res> {
  _$ListsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WatchUserListsImplCopyWith<$Res> {
  factory _$$WatchUserListsImplCopyWith(_$WatchUserListsImpl value,
          $Res Function(_$WatchUserListsImpl) then) =
      __$$WatchUserListsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WatchUserListsImplCopyWithImpl<$Res>
    extends _$ListsEventCopyWithImpl<$Res, _$WatchUserListsImpl>
    implements _$$WatchUserListsImplCopyWith<$Res> {
  __$$WatchUserListsImplCopyWithImpl(
      _$WatchUserListsImpl _value, $Res Function(_$WatchUserListsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WatchUserListsImpl implements _WatchUserLists {
  const _$WatchUserListsImpl();

  @override
  String toString() {
    return 'ListsEvent.watchUserLists()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WatchUserListsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchUserLists,
  }) {
    return watchUserLists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchUserLists,
  }) {
    return watchUserLists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchUserLists,
    required TResult orElse(),
  }) {
    if (watchUserLists != null) {
      return watchUserLists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchUserLists value) watchUserLists,
  }) {
    return watchUserLists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchUserLists value)? watchUserLists,
  }) {
    return watchUserLists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchUserLists value)? watchUserLists,
    required TResult orElse(),
  }) {
    if (watchUserLists != null) {
      return watchUserLists(this);
    }
    return orElse();
  }
}

abstract class _WatchUserLists implements ListsEvent {
  const factory _WatchUserLists() = _$WatchUserListsImpl;
}

/// @nodoc
mixin _$ListsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserList> lists) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserList> lists)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserList> lists)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListsInitial value) initial,
    required TResult Function(ListsLoading value) loading,
    required TResult Function(ListsLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListsInitial value)? initial,
    TResult? Function(ListsLoading value)? loading,
    TResult? Function(ListsLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListsInitial value)? initial,
    TResult Function(ListsLoading value)? loading,
    TResult Function(ListsLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListsStateCopyWith<$Res> {
  factory $ListsStateCopyWith(
          ListsState value, $Res Function(ListsState) then) =
      _$ListsStateCopyWithImpl<$Res, ListsState>;
}

/// @nodoc
class _$ListsStateCopyWithImpl<$Res, $Val extends ListsState>
    implements $ListsStateCopyWith<$Res> {
  _$ListsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ListsInitialImplCopyWith<$Res> {
  factory _$$ListsInitialImplCopyWith(
          _$ListsInitialImpl value, $Res Function(_$ListsInitialImpl) then) =
      __$$ListsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ListsInitialImplCopyWithImpl<$Res>
    extends _$ListsStateCopyWithImpl<$Res, _$ListsInitialImpl>
    implements _$$ListsInitialImplCopyWith<$Res> {
  __$$ListsInitialImplCopyWithImpl(
      _$ListsInitialImpl _value, $Res Function(_$ListsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ListsInitialImpl implements ListsInitial {
  const _$ListsInitialImpl();

  @override
  String toString() {
    return 'ListsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ListsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserList> lists) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserList> lists)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserList> lists)? loaded,
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
    required TResult Function(ListsInitial value) initial,
    required TResult Function(ListsLoading value) loading,
    required TResult Function(ListsLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListsInitial value)? initial,
    TResult? Function(ListsLoading value)? loading,
    TResult? Function(ListsLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListsInitial value)? initial,
    TResult Function(ListsLoading value)? loading,
    TResult Function(ListsLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ListsInitial implements ListsState {
  const factory ListsInitial() = _$ListsInitialImpl;
}

/// @nodoc
abstract class _$$ListsLoadingImplCopyWith<$Res> {
  factory _$$ListsLoadingImplCopyWith(
          _$ListsLoadingImpl value, $Res Function(_$ListsLoadingImpl) then) =
      __$$ListsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ListsLoadingImplCopyWithImpl<$Res>
    extends _$ListsStateCopyWithImpl<$Res, _$ListsLoadingImpl>
    implements _$$ListsLoadingImplCopyWith<$Res> {
  __$$ListsLoadingImplCopyWithImpl(
      _$ListsLoadingImpl _value, $Res Function(_$ListsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ListsLoadingImpl implements ListsLoading {
  const _$ListsLoadingImpl();

  @override
  String toString() {
    return 'ListsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ListsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserList> lists) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserList> lists)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserList> lists)? loaded,
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
    required TResult Function(ListsInitial value) initial,
    required TResult Function(ListsLoading value) loading,
    required TResult Function(ListsLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListsInitial value)? initial,
    TResult? Function(ListsLoading value)? loading,
    TResult? Function(ListsLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListsInitial value)? initial,
    TResult Function(ListsLoading value)? loading,
    TResult Function(ListsLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ListsLoading implements ListsState {
  const factory ListsLoading() = _$ListsLoadingImpl;
}

/// @nodoc
abstract class _$$ListsLoadedImplCopyWith<$Res> {
  factory _$$ListsLoadedImplCopyWith(
          _$ListsLoadedImpl value, $Res Function(_$ListsLoadedImpl) then) =
      __$$ListsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserList> lists});
}

/// @nodoc
class __$$ListsLoadedImplCopyWithImpl<$Res>
    extends _$ListsStateCopyWithImpl<$Res, _$ListsLoadedImpl>
    implements _$$ListsLoadedImplCopyWith<$Res> {
  __$$ListsLoadedImplCopyWithImpl(
      _$ListsLoadedImpl _value, $Res Function(_$ListsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lists = null,
  }) {
    return _then(_$ListsLoadedImpl(
      null == lists
          ? _value._lists
          : lists // ignore: cast_nullable_to_non_nullable
              as List<UserList>,
    ));
  }
}

/// @nodoc

class _$ListsLoadedImpl implements ListsLoaded {
  const _$ListsLoadedImpl(final List<UserList> lists) : _lists = lists;

  final List<UserList> _lists;
  @override
  List<UserList> get lists {
    if (_lists is EqualUnmodifiableListView) return _lists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lists);
  }

  @override
  String toString() {
    return 'ListsState.loaded(lists: $lists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListsLoadedImpl &&
            const DeepCollectionEquality().equals(other._lists, _lists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lists));

  /// Create a copy of ListsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListsLoadedImplCopyWith<_$ListsLoadedImpl> get copyWith =>
      __$$ListsLoadedImplCopyWithImpl<_$ListsLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserList> lists) loaded,
  }) {
    return loaded(lists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserList> lists)? loaded,
  }) {
    return loaded?.call(lists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserList> lists)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(lists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListsInitial value) initial,
    required TResult Function(ListsLoading value) loading,
    required TResult Function(ListsLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListsInitial value)? initial,
    TResult? Function(ListsLoading value)? loading,
    TResult? Function(ListsLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListsInitial value)? initial,
    TResult Function(ListsLoading value)? loading,
    TResult Function(ListsLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ListsLoaded implements ListsState {
  const factory ListsLoaded(final List<UserList> lists) = _$ListsLoadedImpl;

  List<UserList> get lists;

  /// Create a copy of ListsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListsLoadedImplCopyWith<_$ListsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
