import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_network/flutter_network.dart';
import 'package:flutter_network/src/dio_mock.dart';
import 'package:flutter_network/src/internal_providers.dart';
import 'package:riverpod/riverpod.dart';

const url = 'https://www.google.com';

void main() {
  ProviderContainer buildContainer() {
    final container = ProviderContainer(
      overrides: [dioProvider.overrideWithValue(DioMock())],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('get request succeed', () async {
    const data = 'message';
    final container = buildContainer();
    when(() => container.read(dioProvider).get<Object>(url))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: url),
              statusCode: 200,
              data: data,
            ));

    final result = await container.read(apiRestClientProvider).get(url);

    expect(result, isA<Succeeded>());
    expect((result as Succeeded).data, data);
  });

  test('get request failed', () async {
    const data = 'error';
    final container = buildContainer();
    when(() => container.read(dioProvider).get<Object>(url))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: url),
              statusCode: 500,
              data: data,
            ));

    final result = await container.read(apiRestClientProvider).get(url);

    expect(result, isA<Failed>());
    expect((result as Failed).data, data);
  });

  test('get request with error', () async {
    final container = buildContainer();
    const errorMessage = 'Error message';
    const errorType = DioErrorType.connectTimeout;
    when(() => container.read(dioProvider).get<Object>(url)).thenThrow(DioError(
      requestOptions: RequestOptions(path: url),
      error: errorMessage,
      type: errorType,
    ));

    final result = await container.read(apiRestClientProvider).get(url);

    expect(result, isA<Error>());
    expect((result as Error).error.message, errorMessage);
    expect((result).error.errorCode, errorType.name);
  });

  test('patch request succeed', () async {
    const data = 'message';
    final container = buildContainer();
    when(() => container.read(dioProvider).patch<Object>(url))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: url),
              statusCode: 200,
              data: data,
            ));

    final result = await container.read(apiRestClientProvider).patch(url);

    expect(result, isA<Succeeded>());
    expect((result as Succeeded).data, data);
  });

  test('patch request failed', () async {
    const data = 'error';
    final container = buildContainer();
    when(() => container.read(dioProvider).patch<Object>(url))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: url),
              statusCode: 400,
              data: data,
            ));

    final result = await container.read(apiRestClientProvider).patch(url);

    expect(result, isA<Failed>());
    expect((result as Failed).data, data);
  });

  test('patch request with error', () async {
    final container = buildContainer();
    const errorMessage = 'Error message';
    const errorType = DioErrorType.connectTimeout;
    when(() => container.read(dioProvider).patch<Object>(url))
        .thenThrow(DioError(
      requestOptions: RequestOptions(path: url),
      error: errorMessage,
      type: errorType,
    ));

    final result = await container.read(apiRestClientProvider).patch(url);

    expect(result, isA<Error>());
    expect((result as Error).error.message, errorMessage);
    expect((result).error.errorCode, errorType.name);
  });

  test('put request succeed', () async {
    const data = 'message';
    final container = buildContainer();
    when(() => container.read(dioProvider).put<Object>(url))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: url),
              statusCode: 200,
              data: data,
            ));

    final result = await container.read(apiRestClientProvider).put(url);

    expect(result, isA<Succeeded>());
    expect((result as Succeeded).data, data);
  });

  test('put request failed', () async {
    const data = 'error';
    final container = buildContainer();
    when(() => container.read(dioProvider).put<Object>(url))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: url),
              statusCode: 400,
              data: data,
            ));

    final result = await container.read(apiRestClientProvider).put(url);

    expect(result, isA<Failed>());
    expect((result as Failed).data, data);
  });

  test('put request with error', () async {
    final container = buildContainer();
    const errorMessage = 'Error message';
    const errorType = DioErrorType.connectTimeout;
    when(() => container.read(dioProvider).put<Object>(url)).thenThrow(DioError(
      requestOptions: RequestOptions(path: url),
      error: errorMessage,
      type: errorType,
    ));

    final result = await container.read(apiRestClientProvider).put(url);

    expect(result, isA<Error>());
    expect((result as Error).error.message, errorMessage);
    expect((result).error.errorCode, errorType.name);
  });

  test('post request succeed', () async {
    const data = 'message';
    final container = buildContainer();
    when(() => container.read(dioProvider).post<Object>(url))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: url),
              statusCode: 200,
              data: data,
            ));

    final result = await container.read(apiRestClientProvider).post(url);

    expect(result, isA<Succeeded>());
    expect((result as Succeeded).data, data);
  });

  test('post request failed', () async {
    const data = 'error';
    final container = buildContainer();
    when(() => container.read(dioProvider).post<Object>(url))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: url),
              statusCode: 400,
              data: data,
            ));

    final result = await container.read(apiRestClientProvider).post(url);

    expect(result, isA<Failed>());
    expect((result as Failed).data, data);
  });

  test('post request with error', () async {
    final container = buildContainer();
    const errorMessage = 'Error message';
    const errorType = DioErrorType.connectTimeout;
    when(() => container.read(dioProvider).post<Object>(url))
        .thenThrow(DioError(
      requestOptions: RequestOptions(path: url),
      error: errorMessage,
      type: errorType,
    ));

    final result = await container.read(apiRestClientProvider).post(url);

    expect(result, isA<Error>());
    expect((result as Error).error.message, errorMessage);
    expect((result).error.errorCode, errorType.name);
  });

  test('delete request succeed', () async {
    const data = 'message';
    final container = buildContainer();
    when(() => container.read(dioProvider).delete<Object>(url))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: url),
              statusCode: 200,
              data: data,
            ));

    final result = await container.read(apiRestClientProvider).delete(url);

    expect(result, isA<Succeeded>());
    expect((result as Succeeded).data, data);
  });

  test('delete request failed', () async {
    const data = 'error';
    final container = buildContainer();
    when(() => container.read(dioProvider).delete<Object>(url))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: url),
              statusCode: 400,
              data: data,
            ));

    final result = await container.read(apiRestClientProvider).delete(url);

    expect(result, isA<Failed>());
    expect((result as Failed).data, data);
  });

  test('delete request with error', () async {
    final container = buildContainer();
    const errorMessage = 'Error message';
    const errorType = DioErrorType.connectTimeout;
    when(() => container.read(dioProvider).delete<Object>(url))
        .thenThrow(DioError(
      requestOptions: RequestOptions(path: url),
      error: errorMessage,
      type: errorType,
    ));

    final result = await container.read(apiRestClientProvider).delete(url);

    expect(result, isA<Error>());
    expect((result as Error).error.message, errorMessage);
    expect((result).error.errorCode, errorType.name);
  });
}
