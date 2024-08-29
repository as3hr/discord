import 'package:discord/model/user_json.dart';

class UserEntity {
  String? email;
  String? name;
  String? id;

  UserEntity({
    this.email,
    this.name,
    this.id,
  });

  factory UserEntity.empty() => UserEntity(email: '', name: '', id: '');

  Map<String, dynamic> toUserJson() {
    return UserJson.copyWith(this).toJson();
  }
}
