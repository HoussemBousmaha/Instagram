import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../presentation/constants/enums.dart';
import 'post_settings.dart';

@immutable
class PostInfo extends Equatable {
  final File? file;
  final double? aspectRatio;
  final String? description;
  final PostSettings settings;
  final FileType type;

  const PostInfo({
    this.file,
    this.aspectRatio,
    this.description,
    this.settings = const PostSettings(isCommentable: true, isLikeable: true),
    required this.type,
  });

  factory PostInfo.initial(FileType type) => PostInfo(type: type);

  bool get isAllValid => file != null && aspectRatio != null && description != null && description!.isNotEmpty;

  @override
  List<Object?> get props => [file, aspectRatio, description, settings, type];

  @override
  bool get stringify => true;
}
