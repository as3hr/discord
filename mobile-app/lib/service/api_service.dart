import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:discord/domain/failures/network_failure.dart';

class ApiService {
  static const baseUrl = 'http://192.168.1.148:5000';
  late Dio dio;
  ApiService() {
    _initializeApiService();
  }
  void _initializeApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
  }

  Either<NetworkFailure, Map<String, dynamic>> checkError(Response response) {
    final body = response.data;
    if ((response.statusCode == 200 || response.statusCode == 201) ||
        response.data['success'] == true) {
      return right(body);
    } else {
      return left(NetworkFailure(
        error:
            'Request ended with status code: ${response.statusCode}, with a Network error!',
      ));
    }
  }
}
