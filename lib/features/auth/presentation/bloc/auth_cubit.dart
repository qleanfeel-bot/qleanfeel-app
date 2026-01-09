import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qleanfeel_app/features/auth/presentation/bloc/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.unknown());

  Future<void> checkAuth() async {
    emit(AuthState.unauthenticated());
  }

  Future<void> sendCode(String phone) async {
    emit(AuthState.verifying());

    await Future.delayed(const Duration(seconds: 1));

    emit(AuthState.codeSent());
  }

  Future<void> verifyCode(String code) async {
    emit(AuthState.verifying());

    await Future.delayed(const Duration(seconds: 1));

    emit(AuthState.authenticated());
  }

  void logout() {
    emit(AuthState.unauthenticated());
  }
}