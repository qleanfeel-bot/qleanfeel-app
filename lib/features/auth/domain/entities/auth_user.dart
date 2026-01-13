class AuthUser {
  final String id;
  final String phoneNumber;
  final bool isAnonymous;

  const AuthUser({
    required this.id,
    required this.phoneNumber,
    required this.isAnonymous,
  });
}