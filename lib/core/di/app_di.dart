import 'package:firebase_auth/firebase_auth.dart';
import 'package:qleanfeel_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:qleanfeel_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:qleanfeel_app/features/auth/domain/repositories/auth_repository.dart';

final firebaseAuth = FirebaseAuth.instance;

final authRepository = AuthRepositoryImpl(
  FirebaseAuthDatasource(firebaseAuth),
);