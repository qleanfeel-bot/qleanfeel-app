import 'package:qleanfeel_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:qleanfeel_app/features/auth/data/mappers/auth_user_mapper.dart';
import 'package:qleanfeel_app/features/auth/domain/entities/auth_user.dart';
import 'package:qleanfeel_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Stream<AuthUser?> authStateChanges() {
    return _datasource.authStateChanges().map(
      (user) => user == null ? null : user.toDomain(),
    );
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
    return _datasource.signOut();
  }
}