enum AuthStatus {
  unknown,
  unauthenticated,
  codeSent,
  verifying,
  authenticated,
  error,
}

class AuthState {
  final AuthStatus status;
  final String? error;

  const AuthState({
    required this.status,
    this.error,
  });

  factory AuthState.unknown() =>
      const AuthState(status: AuthStatus.unknown);

  factory AuthState.unauthenticated() =>
      const AuthState(status: AuthStatus.unauthenticated);

  factory AuthState.codeSent() =>
      const AuthState(status: AuthStatus.codeSent);

  factory AuthState.verifying() =>
      const AuthState(status: AuthStatus.verifying);

  factory AuthState.authenticated() =>
      const AuthState(status: AuthStatus.authenticated);

  factory AuthState.error(String message) =>
      AuthState(status: AuthStatus.error, error: message);
}