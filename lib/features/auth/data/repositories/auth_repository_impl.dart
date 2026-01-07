import 'package:qleanfeel_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<bool> isAuthenticated() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return false; // ⬅️ пока ВСЕГДА не авторизован
  }
}