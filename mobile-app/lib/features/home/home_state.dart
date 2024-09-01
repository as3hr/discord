import 'package:discord/domain/entities/server_entity.dart';
import 'package:discord/domain/entities/user_entity.dart';

class HomeState {
  UserEntity? user;
  int serverIndex;
  List<ServerEntity> servers;
  ServerEntity currentServer;
  double panelOffsetX;
  double bottomBarOffset;
  HomeState({
    this.user,
    required this.servers,
    required this.currentServer,
    this.serverIndex = 0,
    this.bottomBarOffset = 0,
    this.panelOffsetX = 0,
  });

  copyWith({
    UserEntity? user,
    List<ServerEntity>? servers,
    ServerEntity? currentServer,
    double? panelOffsetX,
    double? bottomBarOffset,
    int? serverIndex,
  }) =>
      HomeState(
        servers: servers ?? this.servers,
        serverIndex: serverIndex ?? this.serverIndex,
        user: user ?? this.user,
        currentServer: currentServer ?? this.currentServer,
        panelOffsetX: panelOffsetX ?? this.panelOffsetX,
        bottomBarOffset: bottomBarOffset ?? this.bottomBarOffset,
      );

  factory HomeState.empty() => HomeState(
        user: UserEntity(email: '', id: '', name: ''),
        servers: [],
        currentServer: ServerEntity.empty(),
      );
}
