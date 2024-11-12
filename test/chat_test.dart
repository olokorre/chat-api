import 'package:chat_dart/domain/chat.dart';
import 'package:chat_dart/domain/exeption/user_not_participant.dart';
import 'package:chat_dart/domain/user.dart';
import 'package:test/test.dart';

void main() {
  test('Deve criar um chat generico sem mensagens', () {
    const user1 = User(1, 'Samira');
    const user2 = User(2, 'Carlos');
    final chat = Chat([user1, user2]);
    expect(chat.participants.length, 2);
    expect(chat.messages.length, 0);
  });

  test('Deve adicionar uma nova mensagem', () {
    const user1 = User(1, 'Samira');
    const user2 = User(2, 'Carlos');
    final chat = Chat([user1, user2]);
    chat.add('Cavalo', DateTime.parse('2024-01-01T10:00:00'), user1);
    expect(chat.messages.length, 1);
  });

  test(
    'Não deve permitr que um usuário não participante do chat não escreva uma mensagem',
    () {
      const user1 = User(1, 'Samira');
      const user2 = User(2, 'Carlos');
      const user3 = User(3, 'Jose');
      final chat = Chat([user1, user2]);
      expect(
        () => chat.add('Cavalo', DateTime.parse('2024-01-01T10:00:00'), user3),
        throwsA(isA<UserNotParticipant>()),
      );
    },
  );
}
