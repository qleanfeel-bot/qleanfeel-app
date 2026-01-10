import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qleanfeel_app/core/router/app_router.dart';
import 'package:qleanfeel_app/core/theme/app_theme.dart';
import 'package:qleanfeel_app/features/auth/presentation/bloc/auth_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (_) => AuthCubit(),
  child: Builder(
    builder: (context) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        routerConfig: AppRouter.router(context),
      );
    },
  ),
);
  }
}