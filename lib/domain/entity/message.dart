import 'package:chat_dart/domain/type/message_type.dart';

class Message {
  final int id;
  String _content;
  final DateTime dateTime;
  final int userId;
  late final MessageType type;
  late DateTime? _editedAt;
  Message(this.id, this._content, this.dateTime, this.userId,
      {MessageType? type, DateTime? editedAt}) {
    this.type = type ?? MessageType.text;
    _editedAt = editedAt;
  }

  String get content {
    return _content;
  }

  DateTime? get editedAt {
    return _editedAt;
  }

  void edit(String content, DateTime editedAt) {
    _content = content;
    _editedAt = editedAt;
  }
}
