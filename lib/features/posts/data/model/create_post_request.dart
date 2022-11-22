import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/post_settings.dart';
import '../../presentation/constants/enums.dart';

part 'create_post_request.freezed.dart';

@freezed
class CreatePostRequest with _$CreatePostRequest {
  const factory CreatePostRequest({
    required File file,
    required Uint8List thumbnail,
    required String description,
    required FileType type,
    required double aspectRatio,
    required PostSettings settings,
  }) = _CreatePostRequest;
}
