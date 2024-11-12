import 'package:chat_dart/domain/exeption/user_not_participant.dart';
import 'package:chat_dart/domain/entity/message.dart';
import 'package:chat_dart/domain/entity/user.dart';

class Chat {
  final List<User> _participants;
  late final List<Message> _messages;
  Chat(this._participants, {List<Message>? messages}) {
    _messages = messages ?? [];
  }

  List<User> get participants {
    return _participants.toList();
  }

  List<Message> get messages {
    return _messages.toList();
  }

  void add(String content, DateTime dateTime, User user) {
    try {
      _participants.firstWhere((test) => test.id == user.id);
    } on StateError {
      throw UserNotParticipant(user.id);
    }
    _messages.add(Message(
      _messages.length + 1,
      content,
      dateTime,
      user.id,
    ));
  }
}
