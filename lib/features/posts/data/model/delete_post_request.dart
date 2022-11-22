import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/post.dart';

part 'delete_post_request.freezed.dart';

@freezed
class DeletePostRequest with _$DeletePostRequest {
  const factory DeletePostRequest({
    required PostEntity post,
  }) = _DeletePostRequest;
}
