import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BaseFailure extends Equatable {
  final String message;
  final String code;

  const BaseFailure({required this.message, required this.code});

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [message, code];
}
