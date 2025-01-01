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
}
