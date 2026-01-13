import 'package:firebase_auth/firebase_auth.dart';
import 'package:qleanfeel_app/features/auth/domain/entities/auth_user.dart';

extension FirebaseUserMapper on User {
  AuthUser toDomain() {
    return AuthUser(
      id: uid,
      phoneNumber: phoneNumber ?? '',
      isAnonymous: isAnonymous,
    );
  }
}