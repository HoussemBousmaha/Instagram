import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../presentation/constants/auth_constants.dart';

@immutable
class AuthUser extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? photoUrl;

  const AuthUser({
    required this.id,
    required this.email,
    this.name,
    this.photoUrl,
  });

  factory AuthUser.fromFirebaseUser(User user) {
    return AuthUser(
      id: user.uid,
      email: user.email!,
      name: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AuthUserJsonKeys.id: id,
      AuthUserJsonKeys.email: email,
      AuthUserJsonKeys.name: name,
      AuthUserJsonKeys.photoUrl: photoUrl,
    };
  }

  @override
  List<Object?> get props => [id, email, name, photoUrl];

  @override
  bool get stringify => true;
}
