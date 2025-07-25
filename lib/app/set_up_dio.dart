import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:expense_tracker/core/network_executor/interceptors/core_interceptor.dart';

import 'configurations.dart';

Dio getDioInstance() {
  BaseOptions dioOption = BaseOptions(
    baseUrl: Configurations.baseUrl,
    connectTimeout: Configurations.connectionTimeOut,
    sendTimeout: Configurations.sendTimeOut,
    receiveTimeout: Configurations.receiveTimeOut,
    headers: {'token': 'global token', 'content-type': 'application/json'},
  );
  final Dio dio = Dio(dioOption);

  List<Interceptor> interceptors = [
    LogInterceptor(),
    CoreInterceptor(
      Configurations.accessToken,
      basePath: Configurations.baseUrl,
    ),
    RetryInterceptor(
      dio: dio,
      retries: 2,
      retryDelays: [Duration(seconds: 5), Duration(seconds: 10)],
    ),
    //Refresh Interceptor
  ];
  dio.interceptors.addAll(interceptors);
  return dio;
}
