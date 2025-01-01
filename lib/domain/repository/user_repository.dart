import 'package:chat_dart/domain/entity/user.dart';

abstract class UserRepository {
  Future<void> save(User user);
  Future<List<User>> getAll();
  Future<int> getNextId();
}
