sealed class AuthFailure {
  const AuthFailure();
}

class NetworkFailure extends AuthFailure {
  const NetworkFailure();
}

class InvalidOtpFailure extends AuthFailure {
  const InvalidOtpFailure();
}

class OtpExpiredFailure extends AuthFailure {
  const OtpExpiredFailure();
}

class TooManyRequestsFailure extends AuthFailure {
  const TooManyRequestsFailure();
}

class UnknownAuthFailure extends AuthFailure {
  const UnknownAuthFailure();
}