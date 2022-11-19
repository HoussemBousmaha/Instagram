import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../presentation/constants/post_constants.dart';

@immutable
class PostSettings extends Equatable {
  final bool isCommentable;
  final bool isLikeable;

  const PostSettings({required this.isCommentable, required this.isLikeable});

  factory PostSettings.initial() => const PostSettings(isCommentable: true, isLikeable: true);

  @override
  List<Object?> get props => [isCommentable, isLikeable];

  Map<String, dynamic> toJson() => {
        PostSettingsJsonKeys.isCommentable: isCommentable,
        PostSettingsJsonKeys.isLikeable: isLikeable,
      };

  factory PostSettings.fromJson(Map<String, dynamic> json) {
    return PostSettings(
      isCommentable: json[PostSettingsJsonKeys.isCommentable],
      isLikeable: json[PostSettingsJsonKeys.isLikeable],
    );
  }

  @override
  bool get stringify => true;
}
