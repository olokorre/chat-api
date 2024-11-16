import 'package:chat_dart/domain/type/message_type.dart';

class Message {
  final int id;
  final String content;
  final DateTime dateTime;
  final int userId;
  late final MessageType type;
  Message(this.id, this.content, this.dateTime, this.userId,
      {MessageType? type}) {
    this.type = type ?? MessageType.text;
  }
}
