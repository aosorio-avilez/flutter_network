import 'package:dio/dio.dart';
import 'package:flutter_network/flutter_network.dart';
import 'package:flutter_network/src/internal_providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

const _apiUrl = 'https://google.com';

class MockInterceptor extends ApiRestInterceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    response.headers.add('test', 'test');
    super.onResponse(response, handler);
  }
}

void main() {
  test('dio provider return a valid instance', () {
    final container = ProviderContainer(overrides: [
      apiUrlProvider.overrideWithValue(_apiUrl),
    ]);

    final dio = container.read(dioProvider);

    expect(dio, isA<Dio>());
  });

  test('dio provider should apply interceptors', () async {
    final container = ProviderContainer(overrides: [
      apiUrlProvider.overrideWithValue(_apiUrl),
      interceptorListProvider.overrideWithValue([MockInterceptor()])
    ]);

    final dio = container.read(dioProvider);

    final response = await dio.get('/');

    final header = response.headers.value('test');

    expect(header, 'test');
  });
}
