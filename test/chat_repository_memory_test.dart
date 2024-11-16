import 'package:chat_dart/domain/entity/chat.dart';
import 'package:chat_dart/domain/entity/user.dart';
import 'package:chat_dart/infra/repository/memory/chat_repository_memory.dart';
import 'package:test/test.dart';

void main() {
  test("Deve armazenar um chat", () async {
    final chatRepository = ChatRepositoryMemory();
    final user1 = User(1, 'Enzo Gabriel');
    final user2 = User(1, 'Maria Valentina');
    final chat = Chat([user1, user2]);
    await chatRepository.save(chat);
    final [output] = await chatRepository.getAll();
    expect(output.participants.length, 2);
    expect(output.messages.length, 0);
  });
}
