import 'package:dartz/dartz.dart';
import 'package:discord/domain/entities/user_entity.dart';
import 'package:discord/domain/failures/login_failure.dart';
import 'package:discord/domain/repositories/login_repository.dart';
import 'package:discord/main.dart';

class FirebaseLoginRepository implements LoginRepository {
  @override
  Future<Either<LoginFailure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user?.email?.isNotEmpty == true) {
        return right(UserEntity(
            email: response.user!.email, name: response.user?.displayName));
      } else {
        return left(LoginFailure(error: 'Unable to login due to some error!'));
      }
    } catch (error) {
      return left(LoginFailure(error: 'Unable to login, Error: $error'));
    }
  }
}
