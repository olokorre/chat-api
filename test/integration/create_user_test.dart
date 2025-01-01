import 'package:bcrypt/bcrypt.dart';
import 'package:chat_dart/app/usecase/create_user.dart';
import 'package:chat_dart/infra/repository/memory_repository_factory.dart';
import 'package:chat_dart/infra/repository/repository_factory.dart';
import 'package:test/test.dart';

void main() {
  group("Create user usecase", () {
    late RepositoryFactory repositoryFactory;
    setUp(() {
      repositoryFactory = MemoryRepositoryFactory();
    });
    test('Create user', () async {
      final usecase = CreateUser(repositoryFactory);
      await usecase.execute("user", "password");
      final [output] = await repositoryFactory.getUserRepository().getAll();
      expect(output.id, 1);
      expect(output.name, "user");
      expect(BCrypt.checkpw("password", output.password!), true);
    });

    test('Deve criar dois usuários distintos', () async {
      final usecase = CreateUser(repositoryFactory);
      await usecase.execute("user", "password");
      await usecase.execute("user2", "password2");
      final [user1, user2] =
          await repositoryFactory.getUserRepository().getAll();
      expect(user1.id, 1);
      expect(user1.name, "user");
      expect(BCrypt.checkpw("password", user1.password!), true);
      expect(user2.id, 2);
      expect(user2.name, "user2");
      expect(BCrypt.checkpw("password2", user2.password!), true);
    });
  });
}
