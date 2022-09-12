import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_network/src/api_rest_client.dart';
import 'package:flutter_network/src/api_rest_error.dart';
import 'package:flutter_network/src/api_rest_result.dart';

class ApiRestClientImpl extends ApiRestClient {
  ApiRestClientImpl(this._httpClient);

  final Dio _httpClient;

  /// Make a http get request to the specific [url]
  @override
  Future<APIResult> get(
    String url, {
    Options? options,
  }) async {
    try {
      final response = await _httpClient.get<Object>(
        url,
        options: options,
      );
      return response.toAPIResult();
    } on DioError catch (exception) {
      return exception.response?.toAPIResult() ?? exception.toAPIResult();
    }
  }

  /// Make a http post request to the specific [url]
  /// With the specific [body] and [options]
  @override
  Future<APIResult> post(
    String url, {
    Object? body,
    Options? options,
  }) async {
    try {
      final response = await _httpClient.post<Object>(
        url,
        data: body,
        options: options,
      );
      return response.toAPIResult();
    } on DioError catch (exception) {
      return exception.response?.toAPIResult() ?? exception.toAPIResult();
    }
  }

  /// Make a http put request to the specific [url]
  /// With the specific [body] and [options]
  @override
  Future<APIResult> put(
    String url, {
    Object? body,
    Options? options,
  }) async {
    try {
      final response = await _httpClient.put<Object>(
        url,
        data: body,
        options: options,
      );
      return response.toAPIResult();
    } on DioError catch (exception) {
      return exception.response?.toAPIResult() ?? exception.toAPIResult();
    }
  }

  /// Make a http patch request to the specific [url]
  /// With the specific [body] and [options]
  @override
  Future<APIResult> patch(
    String url, {
    Object? body,
    Options? options,
  }) async {
    try {
      final response = await _httpClient.patch<Object>(
        url,
        data: body,
        options: options,
      );
      return response.toAPIResult();
    } on DioError catch (exception) {
      return exception.response?.toAPIResult() ?? exception.toAPIResult();
    }
  }

  /// Make a http delete request to the specific [url]
  @override
  Future<APIResult> delete(
    String url, {
    Options? options,
  }) async {
    try {
      final response = await _httpClient.delete<Object>(
        url,
        options: options,
      );
      return response.toAPIResult();
    } on DioError catch (exception) {
      return exception.response?.toAPIResult() ?? exception.toAPIResult();
    }
  }
}

extension ResponseExtension on Response {
  APIResult toAPIResult() {
    debugPrint(toString());

    if (statusCode! >= 200 && statusCode! <= 300) {
      return APIResult.succeeded(data as Object);
    } else {
      return APIResult.failed(data as Object);
    }
  }
}

extension DioErrorExtension on DioError {
  APIResult toAPIResult() {
    return APIResult.error(ApiRestError(
      type.name,
      message,
    ));
  }
}
