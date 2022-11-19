import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../presentation/constants/enums.dart';
import '../../presentation/constants/post_constants.dart';

@immutable
class PostModel extends Equatable {
  final String? id;
  final String? userId;
  final String? fileUrl;
  final String? fileId;
  final FileType? type;
  final String? thumbnailUrl;
  final String? thumbnailId;
  final String? description;
  final double? aspectRatio;
  final DateTime? createdAt;
  const PostModel({
    this.id,
    this.userId,
    this.fileUrl,
    this.fileId,
    this.type,
    this.thumbnailUrl,
    this.thumbnailId,
    this.description,
    this.aspectRatio,
    this.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json[PostJsonKeys.id],
      userId: json[PostJsonKeys.userId],
      fileUrl: json[PostJsonKeys.fileUrl],
      fileId: json[PostJsonKeys.fileId],
      type: fileType(json[PostJsonKeys.type]),
      thumbnailUrl: json[PostJsonKeys.thumbnailUrl],
      thumbnailId: json[PostJsonKeys.thumbnailId],
      description: json[PostJsonKeys.description],
      aspectRatio: json[PostJsonKeys.aspectRatio],
      createdAt: (json[PostJsonKeys.createdAt] as Timestamp).toDate(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        fileUrl,
        fileId,
        type,
        thumbnailUrl,
        thumbnailId,
        description,
        aspectRatio,
        createdAt,
      ];

  @override
  bool get stringify => true;
}

FileType fileType(String type) {
  return type == FileType.image.name ? FileType.image : FileType.video;
}
