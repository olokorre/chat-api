class UserNotParticipant implements Exception {
  final int userId;
  UserNotParticipant(this.userId);

  @override
  String toString() {
    return 'Usuário $userId não participa deste chat';
  }
}
