import 'package:chat_dart/domain/entity/user.dart';
import 'package:test/test.dart';

void main() {
  test('Deve criar um usuário simples', () {
    final user = User(1, 'Altair Oracio');
    expect(user.id, 1);
    expect(user.name, 'Altair Oracio');
  });
}
