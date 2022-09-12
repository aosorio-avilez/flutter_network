import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_network/src/api_rest_error.dart';

part 'api_rest_result.freezed.dart';

@freezed
class APIResult with _$APIResult {
  const factory APIResult.succeeded(Object data) = Succeeded;
  const factory APIResult.failed(Object data) = Failed;
  const factory APIResult.error(ApiRestError error) = Error;
}
