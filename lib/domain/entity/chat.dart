import 'package:chat_dart/domain/exeption/few_participants.dart';
import 'package:chat_dart/domain/exeption/user_already_particips.dart';
import 'package:chat_dart/domain/exeption/user_not_mesage_owner.dart';
import 'package:chat_dart/domain/exeption/user_not_participant.dart';
import 'package:chat_dart/domain/entity/message.dart';
import 'package:chat_dart/domain/entity/user.dart';

class Chat {
  final List<User> _participants;
  late final List<Message> _messages;
  late final int id;
  Chat(this._participants, {List<Message>? messages, int? id}) {
    if (_participants.length < 2) {
      throw FewParticipants();
    }
    _messages = messages ?? [];
    this.id = id ?? 1;
  }

  List<User> get participants {
    return _participants.toList();
  }

  List<Message> get messages {
    return _messages.toList();
  }

  User? _findUserById(int userId) {
    try {
      return _participants.firstWhere((test) => test.id == userId);
    } on StateError {
      return null;
    }
  }

  void add(String content, DateTime dateTime, User user) {
    final result = _findUserById(user.id);
    if (result == null) {
      throw UserNotParticipant(user.id);
    }
    _messages.add(Message(
      _messages.length + 1,
      content,
      dateTime,
      user.id,
    ));
  }

  void addParticipant(User user) {
    final result = _findUserById(user.id);
    if (result != null) {
      throw UserAlreadyParticips();
    }
    _participants.add(user);
  }

  void removeParticipant(User user) {
    final result = _findUserById(user.id);
    if (result == null) {
      throw UserNotParticipant(user.id);
    }
    if (_participants.length - 1 < 2) {
      throw FewParticipants();
    }
    _participants.remove(user);
  }

  void editMessage(
      int messageId, String newContent, DateTime editedAt, User user) {
    final message = _messages.firstWhere((test) => test.id == messageId);
    if (message.userId != user.id) {
      throw UserNotMesageOwner();
    }
    message.edit(newContent, editedAt);
  }
}
