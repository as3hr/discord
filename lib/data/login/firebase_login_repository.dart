import 'package:discord/domain/repositories/login_repository.dart';
import 'package:discord/main.dart';
import 'package:discord/model/user_json.dart';

class FirebaseLoginRepository implements LoginRepository {
  @override
  Future<UserJson> login(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    if (auth.currentUser?.email?.isNotEmpty == true) {
      return UserJson(email: auth.currentUser!.email);
    } else {
      return UserJson();
    }
  }
}
