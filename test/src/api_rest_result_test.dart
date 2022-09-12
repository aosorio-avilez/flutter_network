import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_network/src/api_rest_error.dart';
import 'package:flutter_network/src/api_rest_result.dart';

void main() {
  test('api rest result with succeed', () {
    const data = 'message';

    const result = APIResult.succeeded(data);

    expect(result, isA<Succeeded>());
  });

  test('api rest result failed', () {
    const data = 'error';

    const result = APIResult.failed(data);

    expect(result, isA<Failed>());
  });

  test('api rest result with error', () {
    const error = ApiRestError('NOT_FOUND', 'Resource not found');

    const result = APIResult.error(error);

    expect(result, isA<Error>());
  });
}
