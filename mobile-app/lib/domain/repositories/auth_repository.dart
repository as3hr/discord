import 'package:dartz/dartz.dart';
import 'package:discord/domain/entities/user_entity.dart';

import '../failures/auth_failure.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, UserEntity>> login(String email, String password);
  Future<Either<AuthFailure, UserEntity>> register(UserEntity user);
  Future<Either<AuthFailure, bool>> logout();
}
