import 'package:chat_ai/core/models/generic/network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result(T value) = Data<T>;

  const factory Result.error({
    required NetworkExceptions error,
  }) = ErrorDetails<T>;
}
