import 'package:dartz/dartz.dart';
import 'package:discord/domain/failures/local_storage_failure.dart';
import 'package:discord/domain/repositories/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrimaryLocalStorageRepository implements LocalStorageRepository {
  @override
  Future<Either<LocalStorageFailure, String>> getUser(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return right(prefs.getString(key) ?? '');
    } catch (error) {
      return left(LocalStorageFailure(error: error.toString()));
    }
  }

  @override
  Future<Either<LocalStorageFailure, bool>> setUser(
    String key,
    String value,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
      return right(true);
    } catch (error) {
      return left(LocalStorageFailure(error: error.toString()));
    }
  }
}
