import 'package:discord/domain/entities/user_entity.dart';

class HomeState {
  UserEntity? user;
  double panelOffsetX;
  double bottomBarOffset;
  HomeState({
    this.user,
    this.bottomBarOffset = 0,
    this.panelOffsetX = 0,
  });

  copyWith({UserEntity? user, double? panelOffsetX, double? bottomBarOffset}) =>
      HomeState(
        user: user ?? this.user,
        panelOffsetX: panelOffsetX ?? this.panelOffsetX,
        bottomBarOffset: bottomBarOffset ?? this.bottomBarOffset,
      );

  factory HomeState.empty() =>
      HomeState(user: UserEntity(email: '', id: '', name: ''));
}
