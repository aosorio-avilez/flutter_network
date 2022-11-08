library flutter_network;

import 'package:flutter_network/src/api_rest_client.dart';
import 'package:flutter_network/src/api_rest_client_impl.dart';
import 'package:flutter_network/src/api_rest_interceptor.dart';
import 'package:flutter_network/src/internal_providers.dart';
import 'package:riverpod/riverpod.dart';

export 'src/api_rest_client.dart';
export 'src/api_rest_client_mock.dart';
export 'src/api_rest_result.dart';
export 'src/api_rest_error.dart';
export 'src/api_rest_interceptor.dart';

final apiUrlProvider = Provider<String>((ref) {
  throw UnimplementedError();
});

final interceptorListProvider = Provider<List<ApiRestInterceptor>>((ref) {
  return [];
});

final apiRestClientProvider = Provider<ApiRestClient>((ref) {
  return ApiRestClientImpl(ref.watch(dioProvider));
});
