import 'package:dio/dio.dart';
import 'package:flutter_network/flutter_network.dart';
import 'package:riverpod/riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final url = ref.watch(apiUrlProvider);
  return Dio(
    BaseOptions(baseUrl: url),
  );
});
