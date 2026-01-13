import 'package:qleanfeel_app/features/auth/domain/entities/auth_user.dart';
import 'package:qleanfeel_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Stream<AuthUser?> authStateChanges() {
    throw UnimplementedError();
  }

  @override
  Future<AuthUser> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}