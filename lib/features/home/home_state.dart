import 'package:discord/domain/entities/user_entity.dart';

class HomeState {
  UserEntity? user;
  HomeState({this.user});

  copyWith({UserEntity? user}) => HomeState(user: user ?? this.user);

  factory HomeState.empty() =>
      HomeState(user: UserEntity(email: '', id: '', name: ''));
}
