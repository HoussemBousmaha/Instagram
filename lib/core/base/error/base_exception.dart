import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BaseException extends Equatable implements Exception {
  final String message;
  final String code;

  const BaseException({required this.message, required this.code});

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [message, code];
}
