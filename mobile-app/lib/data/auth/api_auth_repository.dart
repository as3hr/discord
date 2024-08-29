import 'package:dartz/dartz.dart';
import 'package:discord/domain/entities/user_entity.dart';
import 'package:discord/domain/failures/auth_failure.dart';
import 'package:discord/domain/repositories/auth_repository.dart';
import 'package:discord/model/user_json.dart';
import 'package:discord/network/network_repository.dart';

import '../../domain/stores/user_store.dart';

class ApiAuthRepository implements AuthRepository {
  final UserStore _userStore;
  final NetworkRepository networkRepository;
  ApiAuthRepository(this._userStore, this.networkRepository);

  @override
  Future<Either<AuthFailure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await networkRepository.post(url: '/auth/login', data: {
        'email': email,
        'password': password,
      });
      return response.fold(
        (failure) => left(AuthFailure(error: failure.error)),
        (body) {
          final user = UserJson.fromData(body['user']).toDomain();
          _userStore.setUser(user);
          return right(user);
        },
      );
    } catch (error) {
      return left(AuthFailure(error: 'Unable to login, Error: $error'));
    }
  }

  @override
  Future<Either<AuthFailure, bool>> logout() async {
    return left(AuthFailure(error: 'error'));
  }

  @override
  Future<Either<AuthFailure, UserEntity>> register(UserEntity user) async {
    return left(AuthFailure(error: 'error'));
  }
}
