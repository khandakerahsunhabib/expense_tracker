import 'package:dio/dio.dart';

import '../models/network_response.dart';
import 'error_mapper.dart';

class DefaultErrorMapper implements ErrorMapper {
  @override
  NetworkResponse mapError(Exception e) {
    if (e is DioException) {
      if (e.response?.statusCode == 401) {
        // TODO: Redirect to login screen
        // Lets decide from the client end.
        return NetworkResponse(statusCode: 401, data: e.response?.data);
      } else {
        return NetworkResponse(
          statusCode: e.response?.statusCode ?? -1,
          data: e.response?.data,
        );
      }
    } else {
      return NetworkResponse(statusCode: -1, data: 'Something went wrong!');
    }
  }
}
