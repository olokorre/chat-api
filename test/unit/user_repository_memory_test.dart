import 'package:chat_dart/domain/entity/user.dart';
import 'package:chat_dart/domain/exeption/user_alredy_exists.dart';
import 'package:chat_dart/infra/repository/memory/user_repository_memory.dart';
import 'package:test/test.dart';

void main() {
  test("Deve adicionar um usuário ao repositório", () async {
    final userRepository = UserRepositoryMemory();
    final user = User(1, 'Enzo Gabriel');
    await userRepository.save(user);
    final [output] = await userRepository.getAll();
    expect(output.id, 1);
    expect(output.name, 'Enzo Gabriel');
  });

  test("Não deve criar dois usuários com o mesmo id", () async {
    final userRepository = UserRepositoryMemory();
    final user = User(1, 'Enzo Gabriel');
    await userRepository.save(user);
    expect(
      () => userRepository.save(user),
      throwsA(isA<UserAlredyExists>()),
    );
  });

  test("Deve retornar o proximo id dos usuarios", () async {
    final userRepository = UserRepositoryMemory();
    final output = await userRepository.getNextId();
    expect(output, 1);
  });

  test('Deve retornar o proximo id depois de acressentar alguns usários',
      () async {
    final userRepository = UserRepositoryMemory();
    await userRepository.save(User(1, 'Enzo Gabriel'));
    await userRepository.save(User(2, 'Enzo Gabriel'));
    await userRepository.save(User(3, 'Enzo Gabriel'));
    final output = await userRepository.getNextId();
    expect(output, 4);
  });
}
