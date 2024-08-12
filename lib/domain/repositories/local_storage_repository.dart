import 'package:dartz/dartz.dart';

import '../failures/local_storage_failure.dart';

abstract class LocalStorageRepository {
  Future<Either<LocalStorageFailure, bool>> setUser(String key, String value);
  Future<Either<LocalStorageFailure, String>> getUser(String key);
}
