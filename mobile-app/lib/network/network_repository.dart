import 'package:dartz/dartz.dart';
import 'package:discord/domain/failures/network_failure.dart';
import 'package:discord/service/api_service.dart';

class NetworkRepository {
  final ApiService apiService;
  NetworkRepository(this.apiService);

  Future<Either<NetworkFailure, dynamic>> get({
    required String url,
    Map<String, dynamic>? extraQuery,
  }) async {
    final response = await apiService.dio.get(url, queryParameters: {
      ...?extraQuery,
    });
    final result = apiService.checkError(response);
    return result.fold((failure) => left(failure), (body) => right(body));
  }

  Future<Either<NetworkFailure, dynamic>> put({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? extraQuery,
  }) async {
    final response = await apiService.dio.put(url, data: data);
    final result = apiService.checkError(response);
    return result.fold((failure) => left(failure), (body) => right(body));
  }

  Future<Either<NetworkFailure, dynamic>> post({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? extraQuery,
  }) async {
    final response = await apiService.dio.post(url, data: data);
    final result = apiService.checkError(response);
    return result.fold((failure) => left(failure), (body) => right(body));
  }

  Future<Either<NetworkFailure, dynamic>> delete({
    required String url,
    Map<String, dynamic>? extraQuery,
  }) async {
    final response = await apiService.dio.delete(url);
    final result = apiService.checkError(response);
    return result.fold((failure) => left(failure), (body) => right(body));
  }
}
