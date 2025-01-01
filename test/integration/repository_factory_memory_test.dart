import 'package:chat_dart/infra/repository/memory/chat_repository_memory.dart';
import 'package:chat_dart/infra/repository/memory/user_repository_memory.dart';
import 'package:chat_dart/infra/repository/memory_repository_factory.dart';
import 'package:test/test.dart';

void main() {
  test("Deve crear um repositõrio de usuários", () {
    final repositoryFactory = MemoryRepositoryFactory();
    final output = repositoryFactory.getUserRepository();
    expect(output, isA<UserRepositoryMemory>());
  });

  test("Deve crear um repositõrio de chats", () {
    final repositoryFactory = MemoryRepositoryFactory();
    final output = repositoryFactory.getChatRepository();
    expect(output, isA<ChatRepositoryMemory>());
  });
}
