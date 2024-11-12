import 'package:chat_dart/domain/entity/message.dart';
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
}
