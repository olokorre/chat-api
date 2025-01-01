import 'package:bcrypt/bcrypt.dart';
import 'package:chat_dart/domain/entity/user.dart';
import 'package:chat_dart/domain/repository/user_repository.dart';
import 'package:chat_dart/infra/repository/repository_factory.dart';

class CreateUser {
  final UserRepository _userRepository;

  CreateUser(RepositoryFactory repositoryFactory)
      : _userRepository = repositoryFactory.getUserRepository();

  Future<void> execute(String name, String password) async {
    final userId = await _userRepository.getNextId();
    final user =
        User(userId, name, password: BCrypt.hashpw(password, BCrypt.gensalt()));
    await _userRepository.save(user);
  }
}
