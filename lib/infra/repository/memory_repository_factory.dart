import 'package:chat_dart/domain/repository/chat_repository.dart';
import 'package:chat_dart/domain/repository/user_repository.dart';
import 'package:chat_dart/infra/repository/memory/chat_repository_memory.dart';
import 'package:chat_dart/infra/repository/memory/user_repository_memory.dart';
import 'package:chat_dart/infra/repository/repository_factory.dart';

class MemoryRepositoryFactory implements RepositoryFactory {
  final UserRepository _userRepository = UserRepositoryMemory();
  final ChatRepository _chatRepository = ChatRepositoryMemory();

  @override
  UserRepository getUserRepository() {
    return _userRepository;
  }

  @override
  ChatRepository getChatRepository() {
    return _chatRepository;
  }
}
