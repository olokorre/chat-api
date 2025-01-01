import 'package:chat_dart/domain/repository/chat_repository.dart';
import 'package:chat_dart/domain/repository/user_repository.dart';

abstract class RepositoryFactory {
  UserRepository getUserRepository();
  ChatRepository getChatRepository();
}
