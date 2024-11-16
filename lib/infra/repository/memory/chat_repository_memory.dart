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
    _chats.add(chat);
  }
}
