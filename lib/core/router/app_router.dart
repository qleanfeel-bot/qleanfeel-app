import 'package:go_router/go_router.dart';
import 'package:qleanfeel_app/core/router/routes.dart';
import 'package:qleanfeel_app/features/auth/presentation/screens/enter_phone_screen.dart';
import 'package:qleanfeel_app/features/auth/presentation/screens/enter_code_screen.dart';
import 'package:qleanfeel_app/features/splash/presentation/splash_page.dart';
import 'package:qleanfeel_app/features/home/presentation/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.splash,
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