class UserAlredyExists implements Exception {
  @override
  String toString() {
    return 'Já existe um usuário com esse ID';
  }
}
