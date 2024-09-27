// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NetworkExceptions {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorModel error) responseError,
    required TResult Function() timeOut,
    required TResult Function() unauthorized,
    required TResult Function(String? errorCode, String? errorMessage)
        defaultError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorModel error)? responseError,
    TResult? Function()? timeOut,
    TResult? Function()? unauthorized,
    TResult? Function(String? errorCode, String? errorMessage)? defaultError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorModel error)? responseError,
    TResult Function()? timeOut,
    TResult Function()? unauthorized,
    TResult Function(String? errorCode, String? errorMessage)? defaultError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseError value) responseError,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(DefaultError value) defaultError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseError value)? responseError,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(DefaultError value)? defaultError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseError value)? responseError,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(DefaultError value)? defaultError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkExceptionsCopyWith<$Res> {
  factory $NetworkExceptionsCopyWith(
          NetworkExceptions value, $Res Function(NetworkExceptions) then) =
      _$NetworkExceptionsCopyWithImpl<$Res, NetworkExceptions>;
}

/// @nodoc
class _$NetworkExceptionsCopyWithImpl<$Res, $Val extends NetworkExceptions>
    implements $NetworkExceptionsCopyWith<$Res> {
  _$NetworkExceptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResponseErrorImplCopyWith<$Res> {
  factory _$$ResponseErrorImplCopyWith(
          _$ResponseErrorImpl value, $Res Function(_$ResponseErrorImpl) then) =
      __$$ResponseErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorModel error});
}

/// @nodoc
class __$$ResponseErrorImplCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res, _$ResponseErrorImpl>
    implements _$$ResponseErrorImplCopyWith<$Res> {
  __$$ResponseErrorImplCopyWithImpl(
      _$ResponseErrorImpl _value, $Res Function(_$ResponseErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ResponseErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel,
    ));
  }
}

/// @nodoc

class _$ResponseErrorImpl implements ResponseError {
  const _$ResponseErrorImpl(this.error);

  @override
  final ErrorModel error;

  @override
  String toString() {
    return 'NetworkExceptions.responseError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseErrorImplCopyWith<_$ResponseErrorImpl> get copyWith =>
      __$$ResponseErrorImplCopyWithImpl<_$ResponseErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorModel error) responseError,
    required TResult Function() timeOut,
    required TResult Function() unauthorized,
    required TResult Function(String? errorCode, String? errorMessage)
        defaultError,
  }) {
    return responseError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorModel error)? responseError,
    TResult? Function()? timeOut,
    TResult? Function()? unauthorized,
    TResult? Function(String? errorCode, String? errorMessage)? defaultError,
  }) {
    return responseError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorModel error)? responseError,
    TResult Function()? timeOut,
    TResult Function()? unauthorized,
    TResult Function(String? errorCode, String? errorMessage)? defaultError,
    required TResult orElse(),
  }) {
    if (responseError != null) {
      return responseError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseError value) responseError,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(DefaultError value) defaultError,
  }) {
    return responseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseError value)? responseError,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(DefaultError value)? defaultError,
  }) {
    return responseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseError value)? responseError,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(DefaultError value)? defaultError,
    required TResult orElse(),
  }) {
    if (responseError != null) {
      return responseError(this);
    }
    return orElse();
  }
}

abstract class ResponseError implements NetworkExceptions {
  const factory ResponseError(final ErrorModel error) = _$ResponseErrorImpl;

  ErrorModel get error;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseErrorImplCopyWith<_$ResponseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeOutImplCopyWith<$Res> {
  factory _$$TimeOutImplCopyWith(
          _$TimeOutImpl value, $Res Function(_$TimeOutImpl) then) =
      __$$TimeOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimeOutImplCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res, _$TimeOutImpl>
    implements _$$TimeOutImplCopyWith<$Res> {
  __$$TimeOutImplCopyWithImpl(
      _$TimeOutImpl _value, $Res Function(_$TimeOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimeOutImpl implements TimeOut {
  const _$TimeOutImpl();

  @override
  String toString() {
    return 'NetworkExceptions.timeOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimeOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorModel error) responseError,
    required TResult Function() timeOut,
    required TResult Function() unauthorized,
    required TResult Function(String? errorCode, String? errorMessage)
        defaultError,
  }) {
    return timeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorModel error)? responseError,
    TResult? Function()? timeOut,
    TResult? Function()? unauthorized,
    TResult? Function(String? errorCode, String? errorMessage)? defaultError,
  }) {
    return timeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorModel error)? responseError,
    TResult Function()? timeOut,
    TResult Function()? unauthorized,
    TResult Function(String? errorCode, String? errorMessage)? defaultError,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseError value) responseError,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(DefaultError value) defaultError,
  }) {
    return timeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseError value)? responseError,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(DefaultError value)? defaultError,
  }) {
    return timeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseError value)? responseError,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(DefaultError value)? defaultError,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(this);
    }
    return orElse();
  }
}

abstract class TimeOut implements NetworkExceptions {
  const factory TimeOut() = _$TimeOutImpl;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
          _$UnauthorizedImpl value, $Res Function(_$UnauthorizedImpl) then) =
      __$$UnauthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl _value, $Res Function(_$UnauthorizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthorizedImpl implements Unauthorized {
  const _$UnauthorizedImpl();

  @override
  String toString() {
    return 'NetworkExceptions.unauthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorModel error) responseError,
    required TResult Function() timeOut,
    required TResult Function() unauthorized,
    required TResult Function(String? errorCode, String? errorMessage)
        defaultError,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorModel error)? responseError,
    TResult? Function()? timeOut,
    TResult? Function()? unauthorized,
    TResult? Function(String? errorCode, String? errorMessage)? defaultError,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorModel error)? responseError,
    TResult Function()? timeOut,
    TResult Function()? unauthorized,
    TResult Function(String? errorCode, String? errorMessage)? defaultError,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseError value) responseError,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(DefaultError value) defaultError,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseError value)? responseError,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(DefaultError value)? defaultError,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseError value)? responseError,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(DefaultError value)? defaultError,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized implements NetworkExceptions {
  const factory Unauthorized() = _$UnauthorizedImpl;
}

/// @nodoc
abstract class _$$DefaultErrorImplCopyWith<$Res> {
  factory _$$DefaultErrorImplCopyWith(
          _$DefaultErrorImpl value, $Res Function(_$DefaultErrorImpl) then) =
      __$$DefaultErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorCode, String? errorMessage});
}

/// @nodoc
class __$$DefaultErrorImplCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res, _$DefaultErrorImpl>
    implements _$$DefaultErrorImplCopyWith<$Res> {
  __$$DefaultErrorImplCopyWithImpl(
      _$DefaultErrorImpl _value, $Res Function(_$DefaultErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorCode = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$DefaultErrorImpl(
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DefaultErrorImpl implements DefaultError {
  const _$DefaultErrorImpl({this.errorCode, this.errorMessage});

  @override
  final String? errorCode;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'NetworkExceptions.defaultError(errorCode: $errorCode, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultErrorImpl &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorCode, errorMessage);

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultErrorImplCopyWith<_$DefaultErrorImpl> get copyWith =>
      __$$DefaultErrorImplCopyWithImpl<_$DefaultErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorModel error) responseError,
    required TResult Function() timeOut,
    required TResult Function() unauthorized,
    required TResult Function(String? errorCode, String? errorMessage)
        defaultError,
  }) {
    return defaultError(errorCode, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorModel error)? responseError,
    TResult? Function()? timeOut,
    TResult? Function()? unauthorized,
    TResult? Function(String? errorCode, String? errorMessage)? defaultError,
  }) {
    return defaultError?.call(errorCode, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorModel error)? responseError,
    TResult Function()? timeOut,
    TResult Function()? unauthorized,
    TResult Function(String? errorCode, String? errorMessage)? defaultError,
    required TResult orElse(),
  }) {
    if (defaultError != null) {
      return defaultError(errorCode, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseError value) responseError,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(DefaultError value) defaultError,
  }) {
    return defaultError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseError value)? responseError,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(DefaultError value)? defaultError,
  }) {
    return defaultError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseError value)? responseError,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(DefaultError value)? defaultError,
    required TResult orElse(),
  }) {
    if (defaultError != null) {
      return defaultError(this);
    }
    return orElse();
  }
}

abstract class DefaultError implements NetworkExceptions {
  const factory DefaultError(
      {final String? errorCode,
      final String? errorMessage}) = _$DefaultErrorImpl;

  String? get errorCode;
  String? get errorMessage;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefaultErrorImplCopyWith<_$DefaultErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
