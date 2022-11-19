import 'package:flutter/material.dart';

import '../../../../core/base/error/base_failure.dart';

@immutable
class PostFailure extends BaseFailure {
  const PostFailure({
    required String message,
    required String code,
  }) : super(message: message, code: code);
}
