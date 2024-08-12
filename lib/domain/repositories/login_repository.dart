import 'package:dartz/dartz.dart';
import 'package:discord/domain/entities/user_entity.dart';
import 'package:discord/domain/failures/login_failure.dart';

abstract class LoginRepository {
  Future<Either<LoginFailure, UserEntity>> login(String email, String password);
}
