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
}
