import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation/constants/enums.dart';
import 'post_settings.dart';

part "post_info.freezed.dart";

@freezed
class PostInfo with _$PostInfo {
  const factory PostInfo({
    File? file,
    double? aspectRatio,
    String? description,
    @Default(PostSettings(isLikeable: true, isCommentable: true)) PostSettings settings,
    required FileType type,
  }) = _PostInfo;

  factory PostInfo.initial(FileType type) => PostInfo(type: type);

  bool get isAllValid => file != null && aspectRatio != null && description != null && description!.isNotEmpty;

  const PostInfo._();
}
