import 'package:flutter/material.dart';

import '../../../../core/base/error/base_failure.dart';

@immutable
class AuthFailure extends BaseFailure {
  const AuthFailure(
    String message,
    String code,
  ) : super(message: message, code: code);
}
