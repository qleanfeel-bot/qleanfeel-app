import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/auth/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const QleanfeelApp());
}

class QleanfeelApp extends StatelessWidget {
  const QleanfeelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}