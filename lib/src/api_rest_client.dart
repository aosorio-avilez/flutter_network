import 'package:dio/dio.dart';

import 'api_rest_result.dart';

abstract class ApiRestClient {
  Future<APIResult> get(
    String url, {
    Options? options,
  });

  Future<APIResult> post(
    String url, {
    Object? body,
    Options? options,
  });

  Future<APIResult> put(
    String url, {
    Object? body,
    Options? options,
  });

  Future<APIResult> patch(
    String url, {
    Object? body,
    Options? options,
  });

  Future<APIResult> delete(
    String url, {
    Options? options,
  });
}
