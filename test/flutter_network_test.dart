import 'package:flutter_network/flutter_network.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

const _apiUrl = 'https://google.com';

void main() {
  test('api url provider return valid url', () {
    final container = ProviderContainer(
      overrides: [apiUrlProvider.overrideWithValue(_apiUrl)],
    );

    final apiUrl = container.read(apiUrlProvider);

    expect(apiUrl, _apiUrl);
  });

  test(
      'api rest client provider without implemente api url provider throw UnimplementedError',
      () {
    final container = ProviderContainer();

    try {
      container.read(apiRestClientProvider);
    } catch (e) {
      expect(e, isA<ProviderException>());
    }
  });

  test('api rest client provider return a valid instance', () {
    final container = ProviderContainer(overrides: [
      apiUrlProvider.overrideWithValue(_apiUrl),
    ]);

    final apiRestClient = container.read(apiRestClientProvider);

    expect(apiRestClient, isA<ApiRestClient>());
  });
}
