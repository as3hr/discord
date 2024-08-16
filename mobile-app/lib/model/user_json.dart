import 'package:discord/domain/entities/user_entity.dart';

class UserJson {
  String? name;
  String? email;
  String? id;
  UserJson({
    this.id,
    this.name,
    this.email,
  });

  factory UserJson.fromData(Map<String, dynamic> json) => UserJson(
        email: json["email"],
        name: json["name"],
        id: json['id'],
      );

  UserEntity toDomain() => UserEntity(
        name: name,
        email: email,
        id: id,
      );
}
