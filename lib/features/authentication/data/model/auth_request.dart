import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AuthRequest extends Equatable {
  final String email;
  final String password;

  const AuthRequest(this.email, this.password);

  @override
  List<Object?> get props => [email, password];

  @override
  bool get stringify => true;
}
