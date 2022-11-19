import '../../../../core/base/error/base_exception.dart';

class PostException extends BaseException {
  const PostException({
    required String message,
    required String code,
  }) : super(message: message, code: code);
}
