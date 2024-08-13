import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:discord/domain/entities/user_entity.dart';
import 'package:discord/domain/failures/login_failure.dart';
import 'package:discord/domain/repositories/login_repository.dart';
import 'package:discord/domain/stores/user_store.dart';
import 'package:discord/main.dart';
import 'package:discord/model/user_json.dart';

class FirebaseLoginRepository implements LoginRepository {
  final UserStore _userStore;
  FirebaseLoginRepository(this._userStore);
  @override
  Future<Either<LoginFailure, UserEntity>> login(
    String email,
    String password,
  ) async {
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
          return left(LoginFailure(error: 'This user does not exist!'));
        }
      } else {
        return left(LoginFailure(error: 'Unable to login due to some error!'));
      }
    } catch (error) {
      return left(LoginFailure(error: 'Unable to login, Error: $error'));
    }
  }
}
