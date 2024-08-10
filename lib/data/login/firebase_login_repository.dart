import 'package:discord/domain/repositories/login_repository.dart';
import 'package:discord/main.dart';

class FirebaseLoginRepository extends LoginRepository {
  @override
  Future<void> login(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
