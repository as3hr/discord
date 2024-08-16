import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:discord/domain/entities/user_entity.dart';
import 'package:discord/domain/failures/auth_failure.dart';
import 'package:discord/domain/repositories/auth_repository.dart';

import '../../domain/stores/user_store.dart';
import '../../main.dart';
import '../../model/user_json.dart';

class ApiAuthRepository implements AuthRepository {
  final UserStore _userStore;
  ApiAuthRepository(this._userStore);
  @override
  Future<Either<AuthFailure, UserEntity>> login(
      String email, String password) async {
    try {
      final response = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user?.email?.isNotEmpty == true) {
        final firebaseUser = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .get();
        if (firebaseUser.docs.first.exists) {
          final user =
              UserJson.fromData(firebaseUser.docs.first.data()).toDomain();
          _userStore.setUser(user);
          return right(user);
        } else {
          return left(AuthFailure(error: 'This user does not exist!'));
        }
      } else {
        return left(AuthFailure(error: 'Unable to login due to some error!'));
      }
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
