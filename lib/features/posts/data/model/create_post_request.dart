import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../presentation/constants/enums.dart';

@immutable
class CreatePostRequest extends Equatable {
  final File file;
  final Uint8List thumbnail;
  final String description;
  final double aspectRatio;
  final FileType type;

  const CreatePostRequest({
    required this.file,
    required this.thumbnail,
    required this.description,
    required this.type,
    required this.aspectRatio,
  });

  @override
  List<Object?> get props => [file, thumbnail, type, aspectRatio];
}
