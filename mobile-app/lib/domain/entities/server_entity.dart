import 'channel_entity.dart';
import 'user_entity.dart';

class ServerEntity {
  String id;
  String title;
  String image;
  String description;
  List<UserEntity> members;
  List<ChannelEntity> channels;

  ServerEntity({
    required this.id,
    required this.description,
    required this.image,
    required this.title,
    required this.members,
    required this.channels,
  });
}
