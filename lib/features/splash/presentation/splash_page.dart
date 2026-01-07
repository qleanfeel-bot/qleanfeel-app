import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qleanfeel_app/core/di/app_di.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final isAuth = await authRepository.isAuthenticated();

    if (!mounted) return;

    context.go(isAuth ? '/home' : '/login');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}