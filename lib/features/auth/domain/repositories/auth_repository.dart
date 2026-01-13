import 'package:qleanfeel_app/features/auth/domain/entities/auth_user.dart';
//import 'package:qleanfeel_app/features/auth/domain/failures/auth_failure.dart';

abstract class AuthRepository {
  /// Emits current auth state and all future changes
  Stream<AuthUser?> authStateChanges();

  /// Confirms OTP and returns authenticated user
  Future<AuthUser> verifyOtp({
    required String verificationId,
    required String smsCode,
  });

  /// Logs out current user
  Future<void> signOut();
}