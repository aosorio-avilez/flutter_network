library flutter_network;

import 'package:flutter_network/src/api_rest_client.dart';
import 'package:flutter_network/src/api_rest_client_impl.dart';
import 'package:flutter_network/src/internal_providers.dart';
import 'package:riverpod/riverpod.dart';

export 'src/api_rest_client.dart';
export 'src/api_rest_client_mock.dart';
export 'src/api_rest_result.dart';

final apiUrlProvider = Provider<String>((ref) {
  throw UnimplementedError();
});

final apiRestClientProvider = Provider<ApiRestClient>((ref) {
  return ApiRestClientImpl(ref.watch(dioProvider));
});
