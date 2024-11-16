import 'package:chat_dart/domain/entity/chat.dart';

abstract class ChatRepository {
  Future<void> save(Chat chat);
  Future<List<Chat>> getAll();
}
