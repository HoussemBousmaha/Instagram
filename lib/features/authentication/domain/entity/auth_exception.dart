import 'package:flutter/material.dart';

import '../../../../core/base/error/base_exception.dart';

@immutable
class AuthException extends BaseException {
  const AuthException({
    required String message,
    required String code,
  }) : super(message: message, code: code);
}
