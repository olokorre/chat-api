import 'package:chat_dart/domain/entity/chat.dart';
import 'package:chat_dart/domain/repository/chat_repository.dart';

class ChatRepositoryMemory implements ChatRepository {
  final List<Chat> _chats = [];

  @override
  Future<List<Chat>> getAll() async {
    return _chats.toList();
  }

  @override
  Future<void> save(Chat chat) async {
    final index =
        _chats.indexWhere((existingChat) => existingChat.id == chat.id);
    if (index != -1) {
      _chats[index] = chat;
    } else {
      _chats.add(chat);
    }
  }
}
