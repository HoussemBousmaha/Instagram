import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entity/post_settings.dart';
import '../../presentation/constants/enums.dart';

@immutable
class CreatePostRequest extends Equatable {
  final File file;
  final Uint8List thumbnail;
  final String description;
  final double aspectRatio;
  final FileType type;
  final PostSettings settings;

  const CreatePostRequest({
    required this.file,
    required this.thumbnail,
    required this.description,
    required this.type,
    required this.aspectRatio,
    required this.settings,
  });

  @override
  List<Object?> get props => [file, thumbnail, type, aspectRatio, settings];
}
