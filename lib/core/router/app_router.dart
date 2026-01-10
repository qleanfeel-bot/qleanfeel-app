import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qleanfeel_app/core/router/routes.dart';
import 'package:qleanfeel_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:qleanfeel_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:qleanfeel_app/features/auth/presentation/screens/enter_phone_screen.dart';
import 'package:qleanfeel_app/features/auth/presentation/screens/enter_code_screen.dart';
import 'package:qleanfeel_app/features/home/presentation/home_page.dart';
import 'package:qleanfeel_app/features/splash/presentation/splash_page.dart';
import 'package:qleanfeel_app/core/router/go_router_refresh_stream.dart';

class AppRouter {
  static GoRouter router(BuildContext context) {
  final authCubit = context.read<AuthCubit>();

  return GoRouter(
    initialLocation: AppRoutes.splash,

    refreshListenable: GoRouterRefreshStream(authCubit.stream),

    redirect: (context, state) {
      final status = authCubit.state.status;
      final location = state.uri.path;

      final isLogin = location == AppRoutes.login;
      final isCode = location == AppRoutes.loginCode;

      if (status == AuthStatus.unauthenticated) {
        return isLogin ? null : AppRoutes.login;
      }

      if (status == AuthStatus.codeSent) {
        return isCode ? null : AppRoutes.loginCode;
      }

      if (status == AuthStatus.authenticated) {
        return AppRoutes.home;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const EnterPhoneScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginCode,
        builder: (context, state) => const EnterCodeScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
}