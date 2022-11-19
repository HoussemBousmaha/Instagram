import 'package:flutter/material.dart';

import '../../domain/entity/post.dart';

@immutable
class DeletePostRequest {
  final PostEntity post;
  const DeletePostRequest(this.post);
}
