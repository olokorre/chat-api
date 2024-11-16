import 'package:chat_dart/domain/entity/chat.dart';
import 'package:chat_dart/domain/exeption/user_already_particips.dart';
import 'package:chat_dart/domain/exeption/user_not_mesage_owner.dart';
import 'package:chat_dart/domain/exeption/user_not_participant.dart';
import 'package:chat_dart/domain/entity/user.dart';
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

  test("Deve adicionar participantes ha um chat", () {
    const user1 = User(1, 'Samira');
    const user2 = User(2, 'Carlos');
    const user3 = User(3, 'Jose');
    final chat = Chat([user1, user2]);
    chat.addParticipant(user3);
    expect(chat.participants.length, 3);
  });

  test("Não deve adicionar duas o mesmo participante ao chat", () {
    const user1 = User(1, 'Samira');
    const user2 = User(2, 'Carlos');
    final chat = Chat([user1, user2]);
    expect(
        () => chat.addParticipant(user2), throwsA(isA<UserAlreadyParticips>()));
  });

  test("Deve remover um usuário do chat", () {
    const user1 = User(1, 'Samira');
    const user2 = User(2, 'Carlos');
    const user3 = User(3, 'Jose');
    final chat = Chat([user1, user2, user3]);
    chat.removeParticipant(user3);
    expect(chat.participants.length, 2);
  });

  test(
    "Deve retornar um erro ao tentar remover um usuário que não participa do chat",
    () {
      const user1 = User(1, 'Samira');
      const user2 = User(2, 'Carlos');
      const user3 = User(3, 'Jose');
      final chat = Chat([user1, user2]);
      expect(() => chat.removeParticipant(user3),
          throwsA(isA<UserNotParticipant>()));
    },
  );

  test("Deve permitir a edição de uma mensagem", () {
    const user1 = User(1, 'Samira');
    const user2 = User(2, 'Carlos');
    final chat = Chat([user1, user2]);
    final dateTime = DateTime.parse('2024-01-01T10:00:00');
    final editedAt = DateTime.parse('2024-01-01T10:05:00');
    chat.add('Olá, idiota!', dateTime, user1);
    chat.editMessage(1, 'Olá, amigo!', editedAt, user1);
    final [message] = chat.messages;
    expect(message.content, 'Olá, amigo!');
    expect(message.editedAt, editedAt);
  });

  test("Só deve permitir a edição da mesagem pelo usuário que a criou", () {
    const user1 = User(1, 'Samira');
    const user2 = User(2, 'Carlos');
    final chat = Chat([user1, user2]);
    final dateTime = DateTime.parse('2024-01-01T10:00:00');
    final editedAt = DateTime.parse('2024-01-01T10:05:00');
    chat.add('Olá, idiota!', dateTime, user1);
    expect(
      () => chat.editMessage(1, 'Olá, amigo!', editedAt, user2),
      throwsA(isA<UserNotMesageOwner>()),
    );
  });
}
