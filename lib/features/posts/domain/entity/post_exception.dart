import '../../../../core/base/error/base_exception.dart';

class PostException extends BaseException {
  const PostException({
    required super.message,
    required super.code,
  });
}
