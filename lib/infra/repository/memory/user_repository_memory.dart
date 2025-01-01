import 'package:chat_dart/domain/entity/user.dart';
import 'package:chat_dart/domain/exeption/user_alredy_exists.dart';
import 'package:chat_dart/domain/repository/user_repository.dart';

class UserRepositoryMemory implements UserRepository {
  final List<User> _users = [];

  User? _findUserById(int userId) {
    try {
      return _users.firstWhere((test) => test.id == userId);
    } on StateError {
      return null;
    }
  }

  @override
  Future<List<User>> getAll() async {
    return _users.map((e) => e).toList();
  }

  @override
  Future<void> save(User user) async {
    final result = _findUserById(user.id);
    if (result != null) {
      throw UserAlredyExists();
    }
    _users.add(user);
  }

  @override
  Future<int> getNextId() async {
    return _users.length + 1;
  }
}
