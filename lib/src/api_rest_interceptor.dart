import 'package:dio/dio.dart';

class ApiRestInterceptor extends InterceptorsWrapper {
  ApiRestInterceptor({
    InterceptorSendCallback? onRequest,
    InterceptorSuccessCallback? onResponse,
    InterceptorErrorCallback? onError,
  }) : super(
          onRequest: onRequest,
          onResponse: onResponse,
          onError: onError,
        );
}
