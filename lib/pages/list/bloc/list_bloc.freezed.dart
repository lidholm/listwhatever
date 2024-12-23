// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String listId) getList,
    required TResult Function(ListOfThings list) addList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String listId)? getList,
    TResult? Function(ListOfThings list)? addList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String listId)? getList,
    TResult Function(ListOfThings list)? addList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetList value) getList,
    required TResult Function(_AddList value) addList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetList value)? getList,
    TResult? Function(_AddList value)? addList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetList value)? getList,
    TResult Function(_AddList value)? addList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListEventCopyWith<$Res> {
  factory $ListEventCopyWith(ListEvent value, $Res Function(ListEvent) then) =
      _$ListEventCopyWithImpl<$Res, ListEvent>;
}

/// @nodoc
class _$ListEventCopyWithImpl<$Res, $Val extends ListEvent>
    implements $ListEventCopyWith<$Res> {
  _$ListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetListImplCopyWith<$Res> {
  factory _$$GetListImplCopyWith(
          _$GetListImpl value, $Res Function(_$GetListImpl) then) =
      __$$GetListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String listId});
}

/// @nodoc
class __$$GetListImplCopyWithImpl<$Res>
    extends _$ListEventCopyWithImpl<$Res, _$GetListImpl>
    implements _$$GetListImplCopyWith<$Res> {
  __$$GetListImplCopyWithImpl(
      _$GetListImpl _value, $Res Function(_$GetListImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listId = null,
  }) {
    return _then(_$GetListImpl(
      null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetListImpl implements _GetList {
  const _$GetListImpl(this.listId);

  @override
  final String listId;

  @override
  String toString() {
    return 'ListEvent.getList(listId: $listId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetListImpl &&
            (identical(other.listId, listId) || other.listId == listId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, listId);

  /// Create a copy of ListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetListImplCopyWith<_$GetListImpl> get copyWith =>
      __$$GetListImplCopyWithImpl<_$GetListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String listId) getList,
    required TResult Function(ListOfThings list) addList,
  }) {
    return getList(listId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String listId)? getList,
    TResult? Function(ListOfThings list)? addList,
  }) {
    return getList?.call(listId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String listId)? getList,
    TResult Function(ListOfThings list)? addList,
    required TResult orElse(),
  }) {
    if (getList != null) {
      return getList(listId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetList value) getList,
    required TResult Function(_AddList value) addList,
  }) {
    return getList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetList value)? getList,
    TResult? Function(_AddList value)? addList,
  }) {
    return getList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetList value)? getList,
    TResult Function(_AddList value)? addList,
    required TResult orElse(),
  }) {
    if (getList != null) {
      return getList(this);
    }
    return orElse();
  }
}

abstract class _GetList implements ListEvent {
  const factory _GetList(final String listId) = _$GetListImpl;

  String get listId;

  /// Create a copy of ListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetListImplCopyWith<_$GetListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddListImplCopyWith<$Res> {
  factory _$$AddListImplCopyWith(
          _$AddListImpl value, $Res Function(_$AddListImpl) then) =
      __$$AddListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ListOfThings list});

  $ListOfThingsCopyWith<$Res> get list;
}

/// @nodoc
class __$$AddListImplCopyWithImpl<$Res>
    extends _$ListEventCopyWithImpl<$Res, _$AddListImpl>
    implements _$$AddListImplCopyWith<$Res> {
  __$$AddListImplCopyWithImpl(
      _$AddListImpl _value, $Res Function(_$AddListImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$AddListImpl(
      null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListOfThings,
    ));
  }

  /// Create a copy of ListEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListOfThingsCopyWith<$Res> get list {
    return $ListOfThingsCopyWith<$Res>(_value.list, (value) {
      return _then(_value.copyWith(list: value));
    });
  }
}

/// @nodoc

class _$AddListImpl implements _AddList {
  const _$AddListImpl(this.list);

  @override
  final ListOfThings list;

  @override
  String toString() {
    return 'ListEvent.addList(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddListImpl &&
            (identical(other.list, list) || other.list == list));
  }

  @override
  int get hashCode => Object.hash(runtimeType, list);

  /// Create a copy of ListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddListImplCopyWith<_$AddListImpl> get copyWith =>
      __$$AddListImplCopyWithImpl<_$AddListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String listId) getList,
    required TResult Function(ListOfThings list) addList,
  }) {
    return addList(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String listId)? getList,
    TResult? Function(ListOfThings list)? addList,
  }) {
    return addList?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String listId)? getList,
    TResult Function(ListOfThings list)? addList,
    required TResult orElse(),
  }) {
    if (addList != null) {
      return addList(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetList value) getList,
    required TResult Function(_AddList value) addList,
  }) {
    return addList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetList value)? getList,
    TResult? Function(_AddList value)? addList,
  }) {
    return addList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetList value)? getList,
    TResult Function(_AddList value)? addList,
    required TResult orElse(),
  }) {
    if (addList != null) {
      return addList(this);
    }
    return orElse();
  }
}

abstract class _AddList implements ListEvent {
  const factory _AddList(final ListOfThings list) = _$AddListImpl;

  ListOfThings get list;

  /// Create a copy of ListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddListImplCopyWith<_$AddListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ListOfThings list) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ListOfThings list)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ListOfThings list)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListInitial value) initial,
    required TResult Function(ListLoading value) loading,
    required TResult Function(ListLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListInitial value)? initial,
    TResult? Function(ListLoading value)? loading,
    TResult? Function(ListLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListInitial value)? initial,
    TResult Function(ListLoading value)? loading,
    TResult Function(ListLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListStateCopyWith<$Res> {
  factory $ListStateCopyWith(ListState value, $Res Function(ListState) then) =
      _$ListStateCopyWithImpl<$Res, ListState>;
}

/// @nodoc
class _$ListStateCopyWithImpl<$Res, $Val extends ListState>
    implements $ListStateCopyWith<$Res> {
  _$ListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ListInitialImplCopyWith<$Res> {
  factory _$$ListInitialImplCopyWith(
          _$ListInitialImpl value, $Res Function(_$ListInitialImpl) then) =
      __$$ListInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ListInitialImplCopyWithImpl<$Res>
    extends _$ListStateCopyWithImpl<$Res, _$ListInitialImpl>
    implements _$$ListInitialImplCopyWith<$Res> {
  __$$ListInitialImplCopyWithImpl(
      _$ListInitialImpl _value, $Res Function(_$ListInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ListInitialImpl implements ListInitial {
  const _$ListInitialImpl();

  @override
  String toString() {
    return 'ListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ListInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ListOfThings list) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ListOfThings list)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ListOfThings list)? loaded,
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
    required TResult Function(ListInitial value) initial,
    required TResult Function(ListLoading value) loading,
    required TResult Function(ListLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListInitial value)? initial,
    TResult? Function(ListLoading value)? loading,
    TResult? Function(ListLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListInitial value)? initial,
    TResult Function(ListLoading value)? loading,
    TResult Function(ListLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ListInitial implements ListState {
  const factory ListInitial() = _$ListInitialImpl;
}

/// @nodoc
abstract class _$$ListLoadingImplCopyWith<$Res> {
  factory _$$ListLoadingImplCopyWith(
          _$ListLoadingImpl value, $Res Function(_$ListLoadingImpl) then) =
      __$$ListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ListLoadingImplCopyWithImpl<$Res>
    extends _$ListStateCopyWithImpl<$Res, _$ListLoadingImpl>
    implements _$$ListLoadingImplCopyWith<$Res> {
  __$$ListLoadingImplCopyWithImpl(
      _$ListLoadingImpl _value, $Res Function(_$ListLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ListLoadingImpl implements ListLoading {
  const _$ListLoadingImpl();

  @override
  String toString() {
    return 'ListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ListOfThings list) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ListOfThings list)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ListOfThings list)? loaded,
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
    required TResult Function(ListInitial value) initial,
    required TResult Function(ListLoading value) loading,
    required TResult Function(ListLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListInitial value)? initial,
    TResult? Function(ListLoading value)? loading,
    TResult? Function(ListLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListInitial value)? initial,
    TResult Function(ListLoading value)? loading,
    TResult Function(ListLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ListLoading implements ListState {
  const factory ListLoading() = _$ListLoadingImpl;
}

/// @nodoc
abstract class _$$ListLoadedImplCopyWith<$Res> {
  factory _$$ListLoadedImplCopyWith(
          _$ListLoadedImpl value, $Res Function(_$ListLoadedImpl) then) =
      __$$ListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ListOfThings list});

  $ListOfThingsCopyWith<$Res> get list;
}

/// @nodoc
class __$$ListLoadedImplCopyWithImpl<$Res>
    extends _$ListStateCopyWithImpl<$Res, _$ListLoadedImpl>
    implements _$$ListLoadedImplCopyWith<$Res> {
  __$$ListLoadedImplCopyWithImpl(
      _$ListLoadedImpl _value, $Res Function(_$ListLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$ListLoadedImpl(
      null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListOfThings,
    ));
  }

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListOfThingsCopyWith<$Res> get list {
    return $ListOfThingsCopyWith<$Res>(_value.list, (value) {
      return _then(_value.copyWith(list: value));
    });
  }
}

/// @nodoc

class _$ListLoadedImpl implements ListLoaded {
  const _$ListLoadedImpl(this.list);

  @override
  final ListOfThings list;

  @override
  String toString() {
    return 'ListState.loaded(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListLoadedImpl &&
            (identical(other.list, list) || other.list == list));
  }

  @override
  int get hashCode => Object.hash(runtimeType, list);

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListLoadedImplCopyWith<_$ListLoadedImpl> get copyWith =>
      __$$ListLoadedImplCopyWithImpl<_$ListLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ListOfThings list) loaded,
  }) {
    return loaded(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ListOfThings list)? loaded,
  }) {
    return loaded?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ListOfThings list)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListInitial value) initial,
    required TResult Function(ListLoading value) loading,
    required TResult Function(ListLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListInitial value)? initial,
    TResult? Function(ListLoading value)? loading,
    TResult? Function(ListLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListInitial value)? initial,
    TResult Function(ListLoading value)? loading,
    TResult Function(ListLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ListLoaded implements ListState {
  const factory ListLoaded(final ListOfThings list) = _$ListLoadedImpl;

  ListOfThings get list;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListLoadedImplCopyWith<_$ListLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
