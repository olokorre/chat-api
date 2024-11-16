import 'package:chat_dart/domain/entity/message.dart';
import 'package:chat_dart/domain/type/message_type.dart';
import 'package:test/test.dart';

void main() {
  test('Deve criar uma mensagem simples', () {
    final message = Message(
      1,
      'Olá, mundo!',
      DateTime.parse('2024-01-01T10:00:00'),
      1,
    );
    expect(message.id, 1);
    expect(message.content, 'Olá, mundo!');
    expect(message.dateTime, DateTime.parse('2024-01-01T10:00:00'));
  });

  test('Deve guardar o ID de um usuário na mensagem', () {
    final message = Message(
      1,
      'Olá, mundo!',
      DateTime.parse('2024-01-01T10:00:00'),
      1,
    );
    expect(message.userId, 1);
  });

  test("Deve constatar que a mensagem é do tipo texto", () {
    final dateTime = DateTime.parse('2024-04-01 10:00:00');
    final message = Message(1, 'content', dateTime, 1);
    expect(message.type, MessageType.text);
  });

  test("Deve criar uma mensagem do timpo imagem", () {
    final dateTime = DateTime.parse('2024-04-01 10:00:00');
    final message = Message(1, 'content', dateTime, 1, type: MessageType.image);
    expect(message.type, MessageType.image);
  });
}
