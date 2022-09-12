import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_network/src/api_rest_error.dart';

void main() {
  test('api rest error instantiate correctly', () {
    const errorCode = 'NOT_FOUND';
    const message = 'Resource not found';

    const error = ApiRestError(errorCode, message);

    expect(errorCode, error.errorCode);
    expect(message, error.message);
  });
}
